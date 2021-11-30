import 'package:flutter/material.dart';

class ContainerBoxDecoration extends StatefulWidget {
  const ContainerBoxDecoration({Key? key}) : super(key: key);

  @override
  _ContainerBoxDecorationState createState() => _ContainerBoxDecorationState();
}

class _ContainerBoxDecorationState extends State<ContainerBoxDecoration>
    with RestorationMixin {
  final RestorableString _currentContainerTypeName =
      RestorableString(_ContainerType.decorationImage.name);

  @override
  String? get restorationId => 'box_decoration';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentContainerTypeName, 'box_decoration_value');
  }

  @override
  void dispose() {
    _currentContainerTypeName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BoxDecoration'),
        ),
        body: Stack(
          children: <Widget>[
            _buildContainer(
                _ContainerType.values.byName(_currentContainerTypeName.value)),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: SizedBox(
                  height: 50,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: _buildChoiceChips(),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  void handleMenuValueChanged(int? value) {
    if (value == null) {
      return;
    }

    setState(() {
      _currentContainerTypeName.value = _ContainerType.values[value].name;
    });
  }

  List<Widget> _buildChoiceChips() {
    return _ContainerType.values
        .map((e) => Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: ChoiceChip(
                label: Text(e.name),
                selected: _ContainerType.values
                        .byName(_currentContainerTypeName.value) == e,
                onSelected: (value) {
                  handleMenuValueChanged(e.index);
                },
              ),
            ))
        .toList();
  }

  Widget _buildContainer(_ContainerType type) {
    switch (type) {
      case _ContainerType.decorationImage:
        return Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
                color: Colors.yellow,
                image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      'https://masafumi-blog.com/wp-content/uploads/2020/09/Flutter_%E3%83%AD%E3%82%B4.png',
                    ))),
          ),
        );
      case _ContainerType.border:
        return Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(color: Colors.black, width: 3)),
          ),
        );
      case _ContainerType.borderRadius:
        return Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(18)),
            ),
          ),
        );
      case _ContainerType.boxShape:
        return Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
              color: Colors.yellow,
              shape: BoxShape.circle,
            ),
          ),
        );
      case _ContainerType.boxShadow:
        return Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
                color: Colors.yellow, boxShadow: [BoxShadow(blurRadius: 10)]),
          ),
        );
      case _ContainerType.linearGradient:
        return Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.red,
              Colors.blue,
            ])),
          ),
        );
      case _ContainerType.radialGradient:
        return Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
                gradient: RadialGradient(
                    colors: [Colors.yellow, Colors.blue], stops: [0.4, 1.0])),
          ),
        );
      case _ContainerType.sweepGradient:
        return Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: const BoxDecoration(
                gradient: SweepGradient(colors: [
              Colors.blue,
              Colors.green,
              Colors.yellow,
              Colors.red,
              Colors.blue,
            ], stops: [
              0.0,
              0.25,
              0.5,
              0.75,
              1.0
            ])),
          ),
        );
      case _ContainerType.backgroundBlendMode:
        return Center(
          child: Container(
            height: 200,
            width: 200,
            foregroundDecoration: const BoxDecoration(
                backgroundBlendMode: BlendMode.exclusion,
                gradient: LinearGradient(colors: [
                  Colors.red,
                  Colors.blue,
                ])),
            child: Image.network(
              'https://masafumi-blog.com/wp-content/uploads/2020/09/Flutter_%E3%83%AD%E3%82%B4.png',
            ),
          ),
        );
      case _ContainerType.backgroundBlendModeUpTheWidget:
        return Center(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
              'https://masafumi-blog.com/wp-content/uploads/2020/09/Flutter_%E3%83%AD%E3%82%B4.png',
            ))),
            child: Container(
              height: 200,
              width: 200,
              foregroundDecoration: const BoxDecoration(
                  backgroundBlendMode: BlendMode.exclusion,
                  gradient: LinearGradient(colors: [
                    Colors.red,
                    Colors.blue,
                  ])),
            ),
          ),
        );
    }
  }
}

enum _ContainerType {
  decorationImage,
  border,
  borderRadius,
  boxShape,
  boxShadow,
  linearGradient,
  radialGradient,
  sweepGradient,
  backgroundBlendMode,
  backgroundBlendModeUpTheWidget
}
