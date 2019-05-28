import 'package:flutter/material.dart';
import 'components/horizontal_listview.dart';
import 'components/GridList.dart';
import 'Carousal.dart';

void main() => runApp(MyApp());

final Widget placeholder = Container(color: Colors.grey);
List<String> imgList = [
  'images/amazonprime.png',
  'images/clothes.png',
  'images/w1.jpeg',
  'images/w3.jpeg',
  'images/w4.jpeg'
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'ProximaNova'),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
   /* Widget imageCarousal = CarouselSlider(
      height: 200.0,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      viewportFraction: 1.0,
      autoPlayCurve: Curves.fastOutSlowIn,
      items: imgList.map((imgPath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                child: Image.asset(imgPath, fit: BoxFit.cover,)
            );
          },
        );
      }).toList(),
    );*/

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('SnapShop',style: TextStyle(fontFamily: 'VolteRounded'),),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: searchShop(),
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: checkout(),
          ),
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(

          children: <Widget>[
            UserAccountsDrawerHeader(
              margin: EdgeInsets.only(bottom: 0),
              decoration: BoxDecoration(color: Colors.redAccent),
              accountName: Text(
                "SnapShop",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              accountEmail:
              Text("snap@gmail.com", style: TextStyle(color: Colors.white)),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  child: Image.asset('images/profile.png'),
                  backgroundColor: Colors.blueAccent,
                ),
              ),
            ),
            InkWell(onTap: () {},
                child: ListTile(
                    title: Text("Home"), leading: Icon(Icons.home))),
            InkWell(onTap: () {},
                child: ListTile(
                    title: Text("My Account"), leading: Icon(Icons.person))),
            InkWell(onTap: () {},
                child: ListTile(title: Text("My Orders"),
                  leading: Icon(Icons.shopping_basket),)),
            InkWell(onTap: () {},
                child: ListTile(
                  title: Text("Categoris"), leading: Icon(Icons.dashboard),)),
            InkWell(onTap: () {},
                child: ListTile(
                  title: Text("Favourites"), leading: Icon(Icons.favorite),)),
            Divider(),
            InkWell(onTap: () {},
                child: ListTile(
                  title: Text("Settings"), leading: Icon(Icons.settings),)),
            InkWell(onTap: () {},
                child: ListTile(
                  title: Text("About"), leading: Icon(Icons.help),)),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          CarouselWithIndicator(landingImage: imgList,),
          Padding(padding: const EdgeInsets.fromLTRB(12,10,0,0)),
          HorizontalList(),
          Padding(padding: const EdgeInsets.fromLTRB(12,10,0,0)),
          GridListProducts(),
          SizedBox(height:20)

        ],
      ),
    );
  }

  searchShop() {}

  checkout() {}
}



