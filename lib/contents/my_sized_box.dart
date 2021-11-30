import 'package:flutter/material.dart';

class MySizedBox extends StatefulWidget {
  const MySizedBox({Key? key}) : super(key: key);

  @override
  _MySizedBoxState createState() => _MySizedBoxState();
}

class _MySizedBoxState extends State<MySizedBox> with RestorationMixin {
  final RestorableString _currentSizedBoxTypeName =
      RestorableString(_SizedBoxType.asConstrainedBox.name);
  bool _isShowing = true;

  @override
  String? get restorationId => 'my_sized_box';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentSizedBoxTypeName, 'my_sized_box_value');
  }

  @override
  void dispose() {
    _currentSizedBoxTypeName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SizedBox'),
      ),
      body: _buildSizedBoxes(
          _SizedBoxType.values.byName(_currentSizedBoxTypeName.value)),
      drawer: Drawer(child: _buildDrawer()),
    );
  }

  Widget _buildDrawer() {
    const drawerHeader = UserAccountsDrawerHeader(
      accountName: Text('とだやま'),
      accountEmail: Text('noreplay@noreplay.com'),
      currentAccountPicture: CircleAvatar(
        child: FlutterLogo(size: 42.0),
      ),
    );
    return ListView(
      children: [
        drawerHeader,
        ListTile(
          leading: const Icon(Icons.one_k),
          title: const Text('SizedBox as ConstrainedBox'),
          onTap: () {
            handleSelectDrawerItemValueChanged(
                _SizedBoxType.asConstrainedBox.index);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.two_k),
          title: const Text('SizedBox as padding'),
          onTap: () {
            handleSelectDrawerItemValueChanged(_SizedBoxType.asPadding.index);
            Navigator.pop(context);
          },
        ),
        ListTile(
          leading: const Icon(Icons.two_k),
          title: const Text('SizedBox as an Invisible Object'),
          onTap: () {
            handleSelectDrawerItemValueChanged(
                _SizedBoxType.asInvisibleObject.index);
            Navigator.pop(context);
          },
        ),
      ],
    );
  }

  void handleSelectDrawerItemValueChanged(int? value) {
    if (value == null) {
      return;
    }

    setState(() {
      _currentSizedBoxTypeName.value = _SizedBoxType.values[value].name;
    });
  }

  Widget _buildSizedBoxes(_SizedBoxType type) {
    switch (type) {
      case _SizedBoxType.asConstrainedBox:
        return const SizedBox.expand(
          child: Card(
            child: Text('Hello World!'),
            color: Colors.yellowAccent,
          ),
        );
      case _SizedBoxType.asPadding:
        return Column(
          children: const <Widget>[
            Icon(Icons.star, size: 50),
            SizedBox(height: 100,),
            Icon(Icons.star, size: 50),
            Icon(Icons.star, size: 50),
          ],
        );
      case _SizedBoxType.asInvisibleObject:
        return Stack(
          children: <Widget>[
            _isShowing ? Icon(Icons.star, size: 150) : const SizedBox(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                    child: Switch(
                  value: _isShowing,
                  onChanged: (value) {
                    setState(() {
                      _isShowing = !_isShowing;
                    });
                  },
                )),
              ],
            ),
          ],
        );
    }
  }
}

enum _SizedBoxType { asConstrainedBox, asPadding, asInvisibleObject }
