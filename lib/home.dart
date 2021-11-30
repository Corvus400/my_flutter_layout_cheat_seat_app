import 'package:flutter/material.dart';
import 'routes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FlutterLayoutCheatSheetApp')),
      body: Center(
        child: ListView(
          children: [
            _buildCard(
                kRouteRowAndColumn,
                'Page about Row and Column.',
                'Two switching switches are provided.'
            ),
            _buildCard(
                kRouteMyStack,
                'Page about Stack',
                'One switching switch is provided.'
            ),
            _buildCard(
                kRouteMyExpanded,
                'Page about Expanded',
                'One switching switch is provided.'
            ),
            _buildCard(
                kRouteMyConstrainedBox,
                'Page about ConstrainedBox',
                'There are two sliders to change the size of the element, and one switch.'
            ),
            _buildCard(
                kRouteMyAlign,
                'Page about Align',
                'The text speaks for itself.'
            ),
            _buildCard(
                kRouteContainerBasic,
                'Page about Container and Decoration',
                'One switching radio group is provided.'
            ),
            _buildCard(
                kRouteContainerBoxDecoration,
                'Page about BoxDecoration of Container',
                'One pop up menu button is provided.'
            ),
            _buildCard(
                kRouteMyMaterial,
                'Page about Material',
                'The text speaks for itself.'
            ),
            _buildCard(
                kRouteMySlivers,
                'Page about Slivers',
                'The tabbed layout is used in this page.'
            ),
            _buildCard(
                kRouteMySizedBox,
                'Page about SizedBox',
                'The navigation drawer is used in this page.'
            ),
            _buildCard(
                kRouteMySafeArea,
                'Page about SafeArea',
                'The text speaks for itself.'
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(String pushName, String mainTitle, String subTitle) {
    return GestureDetector(
      child: SizedBox(
        height: 80,
        child: Card(
          child: ListTile(
            leading: const Icon(
              Icons.double_arrow,
              color: Colors.blue,
            ),
            title: Text(
              mainTitle,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: Text(subTitle),
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(pushName);
      },
    );
  }
}
