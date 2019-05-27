import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:flutter_app/Pages/AnimatedIcon.dart';
import 'package:flutter_app/Carousal.dart';
import 'package:flutter_app/models/Product.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final double product_detail_old_price;
  final double product_detail_new_price;
  final List<Product> product_detail_picture;
  List<String> carousalImage = List<String>();

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_old_price,
      this.product_detail_new_price,
      this.product_detail_picture}) {

    for(int i = 0; i < product_detail_picture.length; i++) {
      carousalImage.add(product_detail_picture[i].pictures);
    }
  }

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ScrollController _controller;
  double newCurveRadius = 0;
  double curveRadius = 120;
  bool fav = false;

  Future<void> executeAfterBuild() async {
    // this code will get executed after the build method
    // because of the way async functions are scheduled
//    _controller.jumpTo(_controller.position.maxScrollExtent);
    setState(() {
      newCurveRadius = curveRadius;
//      scrollValue = _controller.position.maxScrollExtent;
    });
  }

  @override
  void initState() {
    _controller = ScrollController();

    _controller.addListener(_scrollListener);

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => executeAfterBuild());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _scrollListener() {
    double percent = _controller.offset / _controller.position.maxScrollExtent;

    setState(() {
      newCurveRadius = curveRadius - curveRadius * percent;
      print("Percentage of scroll is ${newCurveRadius}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: ListView(
          scrollDirection: Axis.vertical,
          controller: _controller,
          shrinkWrap: true,
          children: <Widget>[
            //Product Image Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(newCurveRadius)),
                  color: Colors.white),
              child: Padding(
//                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    /*SizedBox(
                      height: 32.0,
                    ),*/
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 6,
                          child: Text(
                            "Black Blazer",
                            style: TextStyle(
                                fontSize: 35.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Padding(
                                padding: const EdgeInsets.only(bottom: 3.0),
                                child: HighLightedIcon(Icons.favorite_border,
                                    size: 34, color: Colors.red)
                                /*IconButton(icon: Icon(fav ? Icons.favorite : Icons.favorite_border, color: Colors.red,size: 35,),onPressed: () {
                          setState(() {
                              fav = !fav;
                          });
                        },),*/
                                )),
                      ],
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Container(
                      height: 375,
                      child: CarouselWithIndicator(
                          landingImage: widget.carousalImage, fitType:BoxFit.contain, previewType: true, height: 375.0),
                    ),
                    SizedBox(height: 20.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "\$${widget.product_detail_new_price.toInt().toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                  color: Colors.green),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text(
                                "\$${widget.product_detail_old_price.toInt().toString()}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough),
                              ),
                            )
                          ],
                        ),
                        FloatingActionButton(
                          child: Icon(Icons.shopping_cart),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Action Buttons on product
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: <Widget>[
                      SmoothStarRating(
                        allowHalfRating: false,
                        onRatingChanged: (v) {},
                        starCount: 5,
                        rating: 4,
                        size: 40.0,
                        color: Colors.yellow,
                        borderColor: Colors.yellow,
                      ),
                      Expanded(
                        child: Text(
                          "61 customer reviews",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontSize: 14),
                          textAlign: TextAlign.end,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 10, 18, 0),
                  child: Row(
                    children: <Widget>[
                      Flexible(
                          child: Text(
                        "Thin, light & durable case protects from scratches and drops. The raised lip on the case sides offers screen protection. Thin, light & durable case protects from scratches and drops. The raised lip on the case sides offers screen protection. ",
                        softWrap: true,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ))
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            )
          ],
        ));
  }
}
