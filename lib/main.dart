import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MyApp());

final Widget placeholder = Container(color: Colors.grey);

/*final List child = map<Widget>(
  imgList,
      (index, i) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        child: Stack(children: <Widget>[
          Image.network(i, fit: BoxFit.cover, width: 1000.0),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            ),
          ),
        ]),
      ),
    );
  },
).toList();*/

/*List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}*/


List imgList = [
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
    Widget imageCarousal = CarouselSlider(
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
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text('SnapShop'),
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
          CarouselWithIndicator()
        ],
      ),
    );
  }

  searchShop() {}

  checkout() {}
}

class CarouselWithIndicator extends StatefulWidget {
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
    return Column(
        children: <Widget>[
          Stack(
            children: [
              ShaderMask(
                shaderCallback: (rect) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.black, Colors.transparent],
                  ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
                },
                blendMode: BlendMode.dstIn,
                child: CarouselSlider(
                  height: 200.0,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  pauseAutoPlayOnTouch: Duration(seconds: 10),
                  viewportFraction: 1.0,
                  onPageChanged: (index) {
                    setState(() {
                      _current = index;
                    });
                  },
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
                ),
              ),
              Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: map<Widget>(imgList, (index, url) {
                      return AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        width: _current == index ? 12.0 : 8.0,
                        height: _current == index ? 12.0 : 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 1.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _current == index ? Colors.lightBlue : Colors.grey
                        ),
                      );
                    }),
                  )
              ),
            ],
          )
        ]
    );
  }
}


