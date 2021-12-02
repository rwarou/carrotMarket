import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final Map<String, String> data;

  const Details({Key key, this.data}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Size size;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
  }

  Widget _appBarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _bodyWidget() {
    return Hero(
      tag: widget.data["cid"],
      child: Container(
        child: Image.asset(
          widget.data["image"],
          width: size.width,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBarWidget(),
      body: _bodyWidget(),
    );
  }
}
