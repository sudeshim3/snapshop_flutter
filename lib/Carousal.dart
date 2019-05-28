import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app/models/Product.dart';

class CarouselWithIndicator extends StatefulWidget {
//  final List<Product> productList;
  final List<String> landingImage;
  final BoxFit fitType;
  final bool previewType;
  final double height;
  final String product_name;

  CarouselWithIndicator(
      {this.product_name,
      this.landingImage,
      this.fitType = BoxFit.cover,
      this.previewType = false,
      this.height = 200});

  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Stack(
        children: [
          widget.previewType
              ? CarousalImage(
                  product_name: widget.product_name,
                  landingImage: widget.landingImage,
                  fitType: widget.fitType,
                  height: widget.height,
                )
              : ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.black, Colors.transparent],
                    ).createShader(
                        Rect.fromLTRB(0, 0, rect.width, rect.height));
                  },
                  blendMode: BlendMode.dstIn,
                  child: CarousalImage(
                      landingImage: widget.landingImage,
                      fitType: widget.fitType,
                      height: widget.height),
                ),
          !widget.previewType
              ? Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(widget.landingImage, (index, url) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: _current == index ? 12.0 : 8.0,
                        height: _current == index ? 12.0 : 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index
                                ? Colors.lightBlue
                                : Colors.grey),
                      );
                    }),
                  ))
              : Container()
        ],
      )
    ]);
  }
}

class CarousalImage extends StatefulWidget {
  final List<String> landingImage;
  final BoxFit fitType;
  final double height;
  final String product_name;

  CarousalImage({this.product_name = "",this.landingImage, this.fitType, this.height});

  @override
  _CarousalImageState createState() => _CarousalImageState();
}

class _CarousalImageState extends State<CarousalImage> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      height: widget.height,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      pauseAutoPlayOnTouch: Duration(seconds: 5),
      viewportFraction: 1.0,
      /*  onPageChanged: (index) {
        setState(() {
          _current = index;
        });
      },*/
      autoPlayCurve: Curves.fastOutSlowIn,
      items: widget.landingImage.map((product) {
        Product productds = null;
        String picturePath;
        if (product is Product) {
          productds = product as Product;
          picturePath = productds.pictures;
        } else {
          picturePath = product as String;
        }
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                child:  widget.product_name == ""? Image.asset(picturePath, fit: widget.fitType): Hero(tag: widget.product_name,child: Image.asset(picturePath, fit: widget.fitType) ));
          },
        );
      }).toList(),
    );
  }
}
