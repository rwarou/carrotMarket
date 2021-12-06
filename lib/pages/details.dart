import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final Map<String, String> data;

  const Details({Key key, this.data}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Size size;
  List<Map<String, String>> imgList;
  int _current;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    _current = 0;
    imgList = [
      {"id": "0", "url": widget.data["image"]},
      {"id": "1", "url": widget.data["image"]},
      {"id": "2", "url": widget.data["image"]},
      {"id": "3", "url": widget.data["image"]},
      {"id": "4", "url": widget.data["image"]},
    ];
  }

  Widget _appBarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.share, color: Colors.white),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _bottomBarWidget() {
    return Container(
      width: size.width,
      height: 55,
      color: Colors.red,
    );
  }

  Widget _bodyWidget() {
    return Stack(
      children: [
        Hero(
          tag: widget.data["cid"],
          child: Container(
            child: CarouselSlider(
              options: CarouselOptions(
                height: size.width,
                initialPage: 0,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                },
              ),
              items: imgList.map(
                (map) {
                  return Image.asset(
                    map["url"],
                    width: size.width,
                    fit: BoxFit.fill,
                  );
                },
              ).toList(),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imgList
                .map(
                  (map) => Container(
                    width: 10,
                    height: 10,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _current == int.parse(map["id"])
                          ? Colors.white
                          : Colors.white.withOpacity(0.3),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appBarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomBarWidget(),
    );
  }
}
