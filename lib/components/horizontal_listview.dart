import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  List<Category> categories = new List<Category>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.only(left: 12.0, top: 10.0),
                child: Text(
              "Category",
              style: TextStyle(fontSize: 21.0),
            )),
            SizedBox(height: 20.0,),
            Expanded(
              flex: 1,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Category(img_location: "images/cats/dress.png",img_catption: "Dress",),
                  Category(img_location: "images/cats/accessories.png",img_catption: "Accessories",),
                  Category(img_location: "images/cats/formal.png",img_catption: "Formal",),
                  Category(img_location: "images/cats/informal.png",img_catption: "InFormal",),
                  Category(img_location: "images/cats/jeans.png",img_catption: "Jeans",),
                  Category(img_location: "images/cats/shoe.png",img_catption: "Shoes",),
                  Category(img_location: "images/cats/tshirt.png",img_catption: "Shirts",),
                ],
              ),
            )
          ],
        ));
  }
}

class Category extends StatelessWidget {
  final String img_location;
  final String img_catption;

  Category({this.img_location, this.img_catption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(onTap: (){},
      child: Container(
        width: 80.0,
        child: ListTile(
          title: Image.asset(img_location,fit: BoxFit.fitWidth),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 4.0 ),
              child: Text(img_catption,textAlign: TextAlign.center,)),
        ),
      ),),
    );
  }
}

