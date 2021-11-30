import 'package:flutter/material.dart';

class MyConstrainedBox extends StatefulWidget {
  const MyConstrainedBox({Key? key}) : super(key: key);

  @override
  _MyConstrainedBoxState createState() => _MyConstrainedBoxState();
}

class _MyConstrainedBoxState extends State<MyConstrainedBox> {
  bool _toggleExpand = true;

  final _myConstrainedBoxKey = GlobalKey();
  Size? _myConstrainedBoxSize;

  final double _minWidth = 120;
  final double _minHeight = 55;

  @override
  Widget build(BuildContext context) {
    AppBar appbar = AppBar(
      title: const Text('ConstrainedBox'),
    );

    double screenHeight = MediaQuery.of(context).size.height;
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double appBarHeight = appbar.preferredSize.height;
    double sliderMaxValue = screenHeight - statusBarHeight - appBarHeight;

    return Scaffold(
      appBar: appbar,
      body: Stack(
        children: <Widget>[
          _buildMyConstrainedBox(_toggleExpand),
          SizedBox.expand(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: const Text('toggle'),
                    onPressed: () {
                      setState(() {
                        _toggleExpand = !_toggleExpand;
                      });
                    },
                  ),
                  Slider(
                    value: _myConstrainedBoxSize?.height ?? 300,
                    min: _minHeight,
                    max: sliderMaxValue,
                    label: (_myConstrainedBoxSize?.height ?? 300).toString(),
                    onChanged: _toggleExpand ? null : (double value) {
                      setState(() {
                        _getSize();
                        _myConstrainedBoxSize = Size(_myConstrainedBoxSize?.width ?? 0, value);
                        print(_myConstrainedBoxSize);
                      });
                    },
                  ),
                  Slider(
                    value: _myConstrainedBoxSize?.width ?? 300,
                    min: _minWidth,
                    max: MediaQuery.of(context).size.width,
                    label: (_myConstrainedBoxSize?.width ?? 300).toString(),
                    onChanged: _toggleExpand ? null : (double value) {
                      setState(() {
                        _getSize();
                        _myConstrainedBoxSize = Size(value, _myConstrainedBoxSize?.height ?? 0);
                        print(_myConstrainedBoxSize);
                      });
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMyConstrainedBox(bool toggleExpand) {
    if (toggleExpand) {
      return LayoutBuilder(
          builder: (context, constraints) => ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Stack(
                  children: <Widget>[
                    const Center(
                      child: Text('Hello World!'),
                    ),
                    SizedBox.expand(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(constraints.maxWidth.ceil().toString()),
                        ],
                      ),
                    ),
                    SizedBox.expand(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Text(constraints.maxHeight.ceil().toString())],
                      ),
                    )
                  ],
                ),
              )
      );
    } else {
      return ConstrainedBox(
        key: _myConstrainedBoxKey,
        constraints: BoxConstraints(
          minWidth: _minWidth,
          maxWidth: _myConstrainedBoxSize?.width ?? 300,
          minHeight: _minHeight,
          maxHeight: _myConstrainedBoxSize?.height ?? 300,
        ),
        child: Card(
          child: Center(
              child: Column(
                children: [
                  Text('Hello World!'),
                  Text(_myConstrainedBoxSize.toString())
                ],
              )
          ),
          color: Colors.yellow,
        ),
      );
    }
  }

  void _getSize() {
    setState(() {
      _myConstrainedBoxSize =
          _myConstrainedBoxKey.currentContext?.size;

    });
  }
}
