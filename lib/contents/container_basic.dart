import 'dart:math';

import 'package:flutter/material.dart';

class ContainerBasic extends StatefulWidget {
  const ContainerBasic({Key? key}) : super(key: key);

  @override
  _ContainerBasicState createState() => _ContainerBasicState();
}

class _ContainerBasicState extends State<ContainerBasic> with RestorationMixin {
  final RestorableString _currentContainerTypeName =
      RestorableString(_ContainerType.basic.name);

  @override
  String? get restorationId => 'basic_container';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_currentContainerTypeName, 'basic_container_value');
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
        title: const Text('Basic Container'),
      ),
      body: Stack(
        children: <Widget>[
          _buildContainer('Hi',
              _ContainerType.values.byName(_currentContainerTypeName.value)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    for (int index = 0;
                        index < _ContainerType.values.length;
                        ++index)
                      Radio<int>(
                        value: index,
                        groupValue: _ContainerType.values
                            .byName(_currentContainerTypeName.value)
                            .index,
                        onChanged: handleRadioValueChanged,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void handleRadioValueChanged(int? value) {
    if (value == null) {
      return;
    }

    setState(() {
      _currentContainerTypeName.value = _ContainerType.values[value].name;
    });
  }

  Widget _buildContainer(String text, _ContainerType type) {
    switch (type) {
      case _ContainerType.basic:
        return Container(
          color: Colors.yellowAccent,
          child: Text(text),
        );
      case _ContainerType.matchParent:
        return Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.yellowAccent,
          child: Text(text),
        );
      case _ContainerType.decorated:
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.yellowAccent),
          child: Text(text),
        );
      case _ContainerType.foregroundDecorated:
        return Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(color: Colors.yellowAccent),
          foregroundDecoration:
              BoxDecoration(color: Colors.red.withOpacity(0.5)),
          child: Text(text),
        );
      case _ContainerType.transform:
        return Container(
          height: 300,
          width: 300,
          transform: Matrix4.rotationZ(pi / 4),
          decoration: const BoxDecoration(color: Colors.yellowAccent),
          child: Text(text, textAlign: TextAlign.center),
        );
    }
  }
}

enum _ContainerType {
  basic,
  matchParent,
  decorated,
  foregroundDecorated,
  transform
}
