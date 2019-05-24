import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final double product_detail_old_price;
  final double product_detail_new_price;
  final  product_detail_picture;

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
        body: Column(
          children: <Widget>[
            //Product Image Section
            Expanded(
              flex: 5,
              child: Container(
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
                      SizedBox(height: 32.0),
                      Icon(Icons.arrow_back),
                      SizedBox(
                        height: 32.0,
                      ),
                      Text(
                        "Black Blazer",
                        style: TextStyle(
                            fontSize: 35.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 32.0,
                      ),
                      Image.asset(widget.product_detail_picture,
                          width: double.infinity, fit: BoxFit.cover),
                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "\$${widget.product_detail_new_price.toInt().toString()}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                    color: Colors.green),
                              ),
                              SizedBox(height: 5.0,),
                              Text("\$${widget.product_detail_old_price.toInt().toString()}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,decoration: TextDecoration.lineThrough),)
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            // Action Buttons on product
            Expanded(
              flex: 1,
              child: Container(),
            )
          ],
        ));
  }
}
