import 'package:flutter/material.dart';

class MyAlign extends StatefulWidget {
  const MyAlign({Key? key}) : super(key: key);

  @override
  _MyAlignState createState() => _MyAlignState();
}

class _MyAlignState extends State<MyAlign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Align'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          ElevatedButton(
            child: const Text('Button'),
            onPressed: () {},
          ),
          Align(
            child: ElevatedButton(
              child: const Text('Aligned Button'),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
