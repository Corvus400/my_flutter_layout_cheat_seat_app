import 'package:flutter/material.dart';

class MyStack extends StatefulWidget {
  const MyStack({Key? key}) : super(key: key);

  @override
  _MyStackState createState() => _MyStackState();
}

class _MyStackState extends State<MyStack> {
  bool _isUseLayoutBuilder = false;

  @override
  Widget build(BuildContext context) {
    Widget main = Scaffold(
      appBar: AppBar(title: const Text('Stack')),
      body: Center(
        child: Column(
          children: [
            Expanded(child: _buildStack(_isUseLayoutBuilder)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isUseLayoutBuilder = !_isUseLayoutBuilder;
                });
              },
              child: Text("This is ${_isUseLayoutBuilder ? "" : "not"} using LayoutBuilder."),
            ),
          ],
        ),
      ),
    );

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        main,
        const Banner(
          message: "Top Start",
          location: BannerLocation.topStart,
        ),
        const Banner(
          message: "Top End",
          location: BannerLocation.topEnd,
        ),
        const Banner(
          message: "Bottom Start",
          location: BannerLocation.bottomStart,
        ),
        const Banner(
          message: "Bottom End",
          location: BannerLocation.bottomEnd,
        ),
      ],
    );
  }

  Widget _buildStack(bool isUseLayoutBuilder) {
    const double iconSize = 50;

    if (isUseLayoutBuilder) {
      return LayoutBuilder(
          builder: (context, constraints) => Stack(
            fit: StackFit.expand,
            children: <Widget>[
              const Material(color: Colors.yellowAccent),
              const Positioned(
                top: 0,
                child: Icon(Icons.star, size: iconSize),
              ),
              Positioned(
                top: constraints.maxHeight - iconSize,
                left: constraints.maxWidth - iconSize,
                child: const Icon(Icons.call, size: iconSize),
              )
            ],
          )
      );
    } else {
      return Stack(
        children: [
          Stack(
            fit: StackFit.expand,
            children: const <Widget>[
              Material(color: Colors.yellowAccent),
              Positioned(
                top: 0,
                left: 0,
                child: Icon(Icons.star, size: iconSize),
              ),
              Positioned(
                top: 340,
                left: 250,
                child: Icon(Icons.call, size: iconSize),
              )
            ],
          )
        ],
      );
    }
  }
}
