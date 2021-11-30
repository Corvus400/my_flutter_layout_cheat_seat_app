import 'package:flutter/material.dart';

class RowAndColumn extends StatefulWidget {
  const RowAndColumn({Key? key}) : super(key: key);

  @override
  _RowAndColumnState createState() => _RowAndColumnState();
}

class _RowAndColumnState extends State<RowAndColumn> {
  bool _toggleRowAndColumn = true;
  MainAxisAlignment _currentMainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _currentCrossAxisAlignment = CrossAxisAlignment.start;
  TextBaseline _currentTextBaseLine = TextBaseline.alphabetic;
  MainAxisSize _currentMainAxisSize = MainAxisSize.min;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Row and Column'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: _buildRowOrColumn(
                  _toggleRowAndColumn,
                  _currentMainAxisAlignment,
                  _currentCrossAxisAlignment,
                  _currentMainAxisSize),
            ),
            IntrinsicWidth(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _toggleRowAndColumn = !_toggleRowAndColumn;
                        });
                      },
                      child: Text(
                          "Now it's ${_toggleRowAndColumn ? "Row" : "Column"}.")),
                  ElevatedButton(
                    onPressed: _toggleMainAxisAlignment,
                    child: Text("Now it's $_currentMainAxisAlignment."),
                  ),
                  ElevatedButton(
                    onPressed: _toggleCrossAxisAlignment,
                    child: Text(
                      "Now it's $_currentCrossAxisAlignment.",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _toggleTextBaseLine,
                    child: Text(
                      "Now it's $_currentTextBaseLine.",
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _toggleMainAxisSize,
                    child: Text(
                      "Now it's $_currentMainAxisSize.",
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRowOrColumn(
      bool isShowRow,
      MainAxisAlignment currentMainAxisAlignment,
      CrossAxisAlignment currentCrossAxisAlignment,
      MainAxisSize currentMainAxisSize) {
    if (isShowRow) {
      return Container(
        color: Colors.amberAccent,
        child: Row(
          mainAxisAlignment: currentMainAxisAlignment,
          crossAxisAlignment: currentCrossAxisAlignment,
          textBaseline:
              _currentCrossAxisAlignment == CrossAxisAlignment.baseline
                  ? _currentTextBaseLine
                  : null,
          mainAxisSize: currentMainAxisSize,
          children: _currentCrossAxisAlignment == CrossAxisAlignment.baseline
              ? const <Widget>[
                  Text(
                    'Baseline',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50),
                  ),
                  Text(
                    'Baseline',
                    style: TextStyle(fontSize: 10),
                  )
                ]
              : const <Widget>[
                  Icon(Icons.one_k, size: 50),
                  Icon(Icons.two_k, size: 200),
                  Icon(Icons.three_k, size: 50),
                ],
        ),
      );
    } else {
      return Container(
        color: Colors.amberAccent,
        child: Column(
          mainAxisAlignment: currentMainAxisAlignment,
          crossAxisAlignment: currentCrossAxisAlignment,
          textBaseline:
              _currentCrossAxisAlignment == CrossAxisAlignment.baseline
                  ? _currentTextBaseLine
                  : null,
          mainAxisSize: currentMainAxisSize,
          children: _currentCrossAxisAlignment == CrossAxisAlignment.baseline
              ? const <Widget>[
                  Text(
                    'Baseline',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 50),
                  ),
                  Text(
                    'Baseline',
                    style: TextStyle(fontSize: 10),
                  )
                ]
              : const <Widget>[
                  Icon(Icons.one_k, size: 50),
                  Icon(Icons.two_k, size: 200),
                  Icon(Icons.three_k, size: 50),
                ],
        ),
      );
    }
  }

  void _toggleMainAxisAlignment() {
    setState(() {
      if (MainAxisAlignment.values.length <=
          _currentMainAxisAlignment.index + 1) {
        _currentMainAxisAlignment = MainAxisAlignment.start;
      } else {
        _currentMainAxisAlignment =
            MainAxisAlignment.values[_currentMainAxisAlignment.index + 1];
      }
    });
  }

  void _toggleCrossAxisAlignment() {
    setState(() {
      if (CrossAxisAlignment.values.length <=
          _currentCrossAxisAlignment.index + 1) {
        _currentCrossAxisAlignment = CrossAxisAlignment.start;
      } else {
        _currentCrossAxisAlignment =
            CrossAxisAlignment.values[_currentCrossAxisAlignment.index + 1];
      }
    });
  }

  void _toggleTextBaseLine() {
    setState(() {
      if (TextBaseline.values.length <= _currentTextBaseLine.index + 1) {
        _currentTextBaseLine = TextBaseline.alphabetic;
      } else {
        _currentTextBaseLine =
            TextBaseline.values[_currentTextBaseLine.index + 1];
      }
    });
  }

  void _toggleMainAxisSize() {
    setState(() {
      if (MainAxisSize.values.length <= _currentMainAxisSize.index + 1) {
        _currentMainAxisSize = MainAxisSize.min;
      } else {
        _currentMainAxisSize =
            MainAxisSize.values[_currentMainAxisSize.index + 1];
      }
    });
  }
}
