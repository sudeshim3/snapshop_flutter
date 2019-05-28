import 'package:flutter/material.dart';
import 'package:flutter_app/Pages/ProductDetail.dart';
import 'package:flutter_app/models/Product.dart';

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
            height: 10.0,
          ),
          GridRecentItems()
        ],
      ),
    );
  }
}

List<List<Product>> products = new List();


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
    var size = MediaQuery
        .of(context)
        .size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    List<Product> menDress = new List();
    menDress.add(Product(
        "Men Blazer", "images/flipkartproduct/arrow_casual_men_blazer.png",
        185.0, 150.0));
    menDress.add(Product(
        "Men Blazer", "images/flipkartproduct/arrow_blazer.png", 185.0, 150.0));
    menDress.add(Product(
        "Men Blazer", "images/flipkartproduct/arrow_blazer_side.png", 185.0,
        150.0));
    menDress.add(Product(
        "Men Blazer", "images/flipkartproduct/arrow_back.png", 185.0, 150.0));
    products.add(menDress);

    List<Product> womenDress = new List();
    womenDress.add(Product(
        "Women Blazers", "images/flipkartproduct/blazer_women.png", 185.0,
        150.0));
    womenDress.add(Product(
        "Women Blazers", "images/flipkartproduct/ngt_formal_blazzer.png", 185.0,
        150.0));
    womenDress.add(Product(
        "Women Blazers", "images/flipkartproduct/women_blazer_back.png", 185.0,
        150.0));
    products.add(womenDress);

    List<Product> shoe = new List();
    shoe.add(Product(
        "Shoe", "images/flipkartproduct/presentation_shoe.png", 185.0, 150.0));
    shoe.add(Product(
        "Shoe", "images/flipkartproduct/asian_runner.png", 185.0, 150.0));
    shoe.add(
        Product("Shoe", "images/flipkartproduct/side_shoe.png", 185.0, 150.0));
    shoe.add(
        Product("Shoe", "images/flipkartproduct/back_shoe.png", 185.0, 150.0));
    products.add(shoe);

    List<Product> phone = new List();
    phone.add(Product(
        "SmartPhone", "images/flipkartproduct/realme.png", 185.0, 150.0));
    phone.add(Product(
        "SmartPhone", "images/flipkartproduct/realme_left_tilt.png", 185.0,
        150.0));
    phone.add(Product(
        "SmartPhone", "images/flipkartproduct/realme_right_tilt.png", 185.0,
        150.0));
    phone.add(Product(
        "SmartPhone", "images/flipkartproduct/realme_back.png", 185.0, 150.0));
    products.add(phone);

    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio:(itemWidth / itemHeight),),
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          Product it = products[index][0];
          return SingleProduct(
              name: it.name,
              pictures: products[index],
              old_price: it.old_price,
              price: it.price);
        },
        itemCount: 4,
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final String name;
  final List<Product> pictures;
  final double old_price, price;

  SingleProduct({this.name, this.pictures, this.old_price, this.price});

  @override
  Widget build(BuildContext context) {
    return Container(

        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Card(
                      child: Material(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.yellow,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            new DecoratedBox(
                              decoration: new BoxDecoration(
                                //color: Colors.lightGreen
                                  gradient: new LinearGradient(
                                      begin: FractionalOffset.bottomLeft,
                                      end: FractionalOffset.topRight,
                                      colors: [
                                         HexColor("#D3CCE3"),//#D3CCE3
                                        HexColor("#E9E4F0")
//                                        #F0C27B   #4B1248
                                      ]
                                  )
                              ),
                            ),
                            InkWell(
                              onTap: () =>
                              {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        ProductDetails(
                                          product_detail_name: pictures[0].name,
                                          product_detail_old_price: pictures[0].old_price,
                                          product_detail_new_price: pictures[0].price,
                                          product_detail_picture: pictures,
                                        )))
                              },
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0,8.0,8.0,0),
                                child: Hero(
                                    tag: name, child: Image.asset(pictures[0].pictures,fit: BoxFit.contain,)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(name, style: TextStyle(fontSize: 16),),
            SizedBox(height: 8,)
          ],
        ));
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
