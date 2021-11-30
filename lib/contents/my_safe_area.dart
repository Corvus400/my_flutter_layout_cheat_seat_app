import 'package:flutter/material.dart';

class MySafeArea extends StatefulWidget {
  const MySafeArea({Key? key}) : super(key: key);

  @override
  _MySafeAreaState createState() => _MySafeAreaState();
}

class _MySafeAreaState extends State<MySafeArea> {
  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.blue,
      child: SafeArea(
        child: SizedBox.expand(
          child: Card(color: Colors.yellowAccent),
        ),
      ),
    );
  }
}
