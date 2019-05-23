import 'package:flutter/material.dart';

class GridListProduct extends StatefulWidget {
  @override
  _GridListProductState createState() => _GridListProductState();
}

class product {
  final String name;
  final String pictures;
  final double old_price;
  final double price;

  product(this.name, this.pictures, this.old_price, this.price);
}


class _GridListProductState extends State<GridListProduct> {

   List products = [
    product("Blazers", "images/products/blazer1.jpeg", 185.0, 150.0),
    product("Blazers Red", "images/products/blazer2.jpeg", 185.0, 150.0),
    product("Blazers blue", "images/products/blazer1.jpeg", 185.0, 150.0),
    product("Blazers xd", "images/products/blazer1.jpeg", 185.0, 150.0),
    product("Blazers xl", "images/products/blazer1.jpeg", 185.0, 150.0)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left: 12.0, top: 10.0),
              child: Text(
                "Recent Product",
                style: TextStyle(fontSize: 21.0),
              )),
          Container(
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                GridView.count(crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  childAspectRatio: 3,
                  physics: NeverScrollableScrollPhysics(),
                  children: <product>[
                  product("Blazers", "images/products/blazer1.jpeg", 185.0, 150.0),
                  product("Blazers Red", "images/products/blazer2.jpeg", 185.0, 150.0),
                  product("Blazers blue", "images/products/blazer1.jpeg", 185.0, 150.0),
                  product("Blazers xd", "images/products/blazer1.jpeg", 185.0, 150.0),
                  product("Blazers xl", "images/products/blazer1.jpeg", 185.0, 150.0),
                  product("Blazers xl", "images/products/blazer1.jpeg", 185.0, 150.0),
                ].map((product item){
                  return Container(
                      color: Colors.blueAccent,
                      width: 50.0,
                      height: 50.0,
                      child: Text(item.name));
                }).toList(),)
              ],
            ),
          )
        ],
      ),
    );
}
}


/*
* return Container(

        child: Column(

            children: <Widget>[


    GridView.count(crossAxisCount: 2,
    children: <product>[

    ].map((product url) {
    return new GridTile(
    child: new Image.network(url.pictures, fit: BoxFit.cover);
    }).toList())])*/

class SingleProduct extends StatelessWidget {
  final String name, pictures;
  final double old_price, price;

  SingleProduct({this.name, this.pictures, this.old_price, this.price });

  @override
  Widget build(BuildContext context) {
    Container(
      child: Text(name),
    );
  }
}

