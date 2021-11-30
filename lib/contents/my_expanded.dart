import 'package:flutter/material.dart';

class MyExpanded extends StatefulWidget {
  const MyExpanded({Key? key}) : super(key: key);

  @override
  _MyExpandedState createState() => _MyExpandedState();
}

class _MyExpandedState extends State<MyExpanded> {
  List<int> _currentFlexes = [3,2,1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expanded'),
      ),
      body: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.red),
                ),
                flex: _currentFlexes[0],
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.green),
                ),
                flex: _currentFlexes[1],
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(color: Colors.blue),
                ),
                flex: _currentFlexes[2],
              ),
            ],
          ),
          SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  child: const Text('toggle flex'),
                  onPressed: () {
                    setState(() {
                      List<int> temp = _currentFlexes;
                      _currentFlexes.insert(0, temp.last);
                      _currentFlexes.removeAt(_currentFlexes.length - 1);
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
