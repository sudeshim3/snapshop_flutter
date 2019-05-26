import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/ProductDetail.dart';

class GridListProducts extends StatelessWidget {
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
          SizedBox(
            height: 20.0,
          ),
          GridRecentItems()
        ],
      ),
    );
  }
}

List products = new List();

class Product {
  final String name;
  final String pictures;
  final double old_price;
  final double price;

  Product(this.name, this.pictures, this.old_price, this.price);
}

/*class _GridListProductState extends State<GridListProduct> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }
}*/

class GridRecentItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    products
        .add(Product("Men Blazer", "images/flipkartproduct/arrow_casual_men_blazer.png", 185.0, 150.0));
    products.add(
        Product("Shoe", "images/flipkartproduct/presentation_shoe.png", 185.0, 150.0));
    products.add(
        Product("Women Blazers", "images/flipkartproduct/blazer_women.png", 185.0, 150.0));
    products.add(
        Product("SmartPhone", "images/flipkartproduct/realme.png", 185.0, 150.0));
    /*products.add(
        Product("Blazers blue", "images/products/hils1.jpeg", 185.0, 150.0));
    products.add(
        Product("Blazers blue", "images/products/hils2.jpeg", 185.0, 150.0));
    products.add(
        Product("Blazers blue", "images/products/pants1.jpg", 185.0, 150.0));
    products.add(
        Product("Blazers blue", "images/products/pants2.jpeg", 185.0, 150.0));
    products.add(
        Product("Blazers blue", "images/products/shoe1.jpg", 185.0, 150.0));
    products.add(
        Product("Blazers blue", "images/products/skt1.jpeg", 185.0, 150.0));
    products.add(
        Product("Blazers blue", "images/products/skt2.jpeg", 185.0, 150.0));*/
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          Product it = products[index];
          return SingleProduct(
              name: it.name,
              pictures: it.pictures,
              old_price: it.old_price,
              price: it.price);
        },
        itemCount: 4,
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final String name, pictures;
  final double old_price, price;

  SingleProduct({this.name, this.pictures, this.old_price, this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Material(
      child: InkWell(
        onTap: () => {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                        product_detail_name: name,
                        product_detail_old_price: old_price,
                        product_detail_new_price: price,
                        product_detail_picture: pictures,
                      )))
            },
        child: GridTile(
          footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "\$${price.toInt()}",
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                ),
              )),
          child: Container(
            width: 50,
            height: 50,
            child: Hero(tag: name, child: Image.asset(pictures)),
          ),
        ),
      ),
    ));
  }
}
