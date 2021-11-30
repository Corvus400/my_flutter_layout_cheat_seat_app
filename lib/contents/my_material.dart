import 'package:flutter/material.dart';

class MyMaterial extends StatefulWidget {
  const MyMaterial({Key? key}) : super(key: key);

  @override
  _MyMaterialState createState() => _MyMaterialState();
}

class _MyMaterialState extends State<MyMaterial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material'),
      ),
      body: Center(
        child: Material(
          shape: const BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(color: Colors.black, width: 4)
          ),
          color: Colors.yellow,
          child: Container(
            height: 200,
            width: 200,
          ),
        ),
      ),
    );
  }
}
