import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final double product_detail_old_price;
  final double product_detail_new_price;
  final product_detail_picture;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_old_price,
      this.product_detail_new_price,
      this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: <Widget>[
            //Product Image Section
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(120.0)),
                  color: Colors.white),
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 32.0,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Black Blazer",
                          style: TextStyle(
                              fontSize: 35.0, fontWeight: FontWeight.bold),
                        ),
                        Expanded(child: Align(alignment: Alignment.centerRight,child: Icon(Icons.favorite_border,size: 34,color: Colors.red,))),
                      ],
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Image.asset(widget.product_detail_picture,
                        width: double.infinity, fit: BoxFit.cover),
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
                                "\$${widget.product_detail_new_price.toInt().toString()}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.green),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                "\$${widget.product_detail_old_price.toInt().toString()}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough),
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
            SizedBox(height: 30,)
          ],
        ));
  }
}
