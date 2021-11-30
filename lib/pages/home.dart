import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget _appBarWidget() {
    return AppBar(
      title: GestureDetector(
        onTap: () {
          print("click");
        },
        child: Row(
          children: [
            Text('아라동'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
      elevation: 1,
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.tune),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(
            "assets/svg/bell.svg",
            width: 22,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: Container(),
      bottomNavigationBar: Container(),
    );
  }
}
