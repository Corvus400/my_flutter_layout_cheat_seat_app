import 'package:flutter/material.dart';

class MySlivers extends StatefulWidget {
  const MySlivers({Key? key}) : super(key: key);

  @override
  _MySliversState createState() => _MySliversState();
}

class _MySliversState extends State<MySlivers> with SingleTickerProviderStateMixin, RestorationMixin {
  late TabController? _tabController;
  final RestorableInt _tabIndex = RestorableInt(0);

  @override
  String? get restorationId => 'slivers';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_tabIndex, 'tab_index');
    if (_tabController == null) {
      buildTabController();
    }
    _tabController?.index = _tabIndex.value;
  }
  
  @override
  void initState() {
    super.initState();
    buildTabController();
  }
  
  @override
  Widget build(BuildContext context) {
    final tabs = [
      Tab(child: buildSlivers(0)),
      Tab(child: buildSlivers(1)),
    ];
    final tabTexts = [
      const Tab(text: 'SliverFillRemaining'),
      const Tab(text: 'Filling the remaining space')
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Slivers'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: false,
          tabs: tabTexts,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs
      )
    );
  }
  
  @override
  void dispose() {
    _tabController?.dispose();
    _tabIndex.dispose();
    super.dispose();
  }

  Widget buildSlivers(int index) {
    if (index == 0) {
      return CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                FlutterLogo(size: 200),
                Text(
                  'This is some longest text that should be centered'
                      'together with the logo',
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      );
    } else {
      return CustomScrollView(
        slivers: [
          SliverList(delegate: SliverChildListDelegate(const [
            ListTile(title: Text('First item')),
            ListTile(title: Text('Second item')),
            ListTile(title: Text('Third item')),
            ListTile(title: Text('Fourth item')),
          ]),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Container(
              color: Colors.yellowAccent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  FlutterLogo(size: 200),
                  Text(
                    'This is some longest text that should be centered'
                        'together with the logo',
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],
      );
    }
  }

  void buildTabController() {
    _tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    _tabController!.addListener(() {
      setState(() {
        _tabIndex.value = _tabController!.index;
      });
    });
  }
}
