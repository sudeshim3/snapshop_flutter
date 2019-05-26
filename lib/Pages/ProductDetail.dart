import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductDetailss extends StatelessWidget {
  final product_detail_name;
  final double product_detail_old_price;
  final double product_detail_new_price;
  final product_detail_picture;

  ProductDetailss(
      {this.product_detail_name,
        this.product_detail_old_price,
        this.product_detail_new_price,
        this.product_detail_picture}) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 54.0, left: 24.0),
                    child: Text(
                      product_detail_name,
                      style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'VolteRounded'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 54.0,right: 18.0),
                    child: Icon(
                      Icons.favorite_border,
                      size: 34,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(0),
//                controller: _controller,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: <Widget>[
                  //Product Image Section
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(60)),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: 390.0,
                            child: Hero(tag:product_detail_name,
                              child: Container(
                                width: double.infinity,
                                child: Image.asset(
                                  product_detail_picture,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            children: <Widget>[
                              FloatingActionButton(
                                child: Icon(Icons.shopping_cart),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      "\$${product_detail_new_price.toInt().toString()}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 40,
                                          color: Colors.green),
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      "\$${product_detail_old_price.toInt().toString()}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                          TextDecoration.lineThrough),
                                    )
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  // Action Buttons on product
                  Padding(
                    padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
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
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            "Thin, light & durable case protects from scratches and drops. The raised lip on the case sides offers screen protection. Thin, light & durable case protects from scratches and drops. The raised lip on the case sides offers screen protection. \n Thin, light & durable case protects from scratches and drops. The raised lip on the case sides offers screen protection. Thin, light & durable case protects from scratches and drops. The raised lip on the case sides offers screen protection. ",
                            softWrap: true,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'ProximaNova'),
                          ),
                        )
                        /* Padding(
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
                        )*/
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}

class ProductDetails extends StatefulWidget {




  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ScrollController _controller;
  double newCurveRadius = 0;
  double curveRadius = 120;

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

  }
}
