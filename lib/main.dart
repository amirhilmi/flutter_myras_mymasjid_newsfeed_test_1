import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:networking_demo/widgets/newsList.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1537181534458-45dcee76ae90?ixlib=rb-1.2.1&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1574246604907-db69e30ddb97?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (context) => MyApp(),
      '/second': (context) => SecondHome(),
    },
  ));
}

//start carousell

final Widget placeholder = Container(color: Colors.grey);

final List child = map<Widget>(
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
                  colors: [
                    Color.fromARGB(200, 0, 0, 0),
                    Color.fromARGB(0, 0, 0, 0)
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Text(
                'No. $index image',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  },
).toList();

List<T> map<T>(List list, Function handler) {
  List<T> result = [];
  for (var i = 0; i < list.length; i++) {
    result.add(handler(i, list[i]));
  }

  return result;
}

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: child,
        autoPlay: true,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
        onPageChanged: (index) {
          setState(() {
            _current = index;
          });
        },
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: map<Widget>(
          imgList,
          (index, url) {
            return Container(
              width: 8.0,
              height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4)),
            );
          },
        ),
      ),
    ]);
  }
}

//end of carousell

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'MediaQuery Demo',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(),
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
    return Scaffold(
      body: SafeArea(
        //done
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: CustomSliverDelegate(
                expandedHeight: 280,
              ),
            ),
            SliverFillRemaining(
              child: Stack(
                children: [
                  //carousell highlight
                  new Container(
                      alignment: Alignment.topCenter,
                      padding: new EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .49,
                          right: 20.0,
                          left: 20.0),
                      child: new Container(
                          height: 290.0, // size of carousell card
                          width: MediaQuery.of(context).size.width,
                          child: new Card(
                              child: new InkWell(
                            splashColor: Colors.green,
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                "/second",
                                (route) => true,
                              ); // Function is executed on tap.
                            },
                            child: Container(
                              // decoration: BoxDecoration(
                              //     gradient: LinearGradient(
                              //       //begin: Alignment.topRight,
                              //       //end: Alignment.bottomLeft,
                              //         colors: [
                              //           Colors.amberAccent,
                              //           Colors.amberAccent,
                              //           Colors.amber[100]
                              //         ]

                              //     )

                              // ),

                              // elevation: 4.0,

                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: Column(children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 8),
                                                  child: Text(
                                                    'Advertisement',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              CarouselWithIndicator(),
                                            ])),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )))),

                  //carousell highlight 2
                  new Container(
                      alignment: Alignment.topCenter,
                      padding: new EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .01,
                          right: 20.0,
                          left: 20.0),
                      child: new Container(
                          height: 290.0, // size of carousell card
                          width: MediaQuery.of(context).size.width,
                          child: new Card(
                              child: InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                "/second",
                                (route) => true,
                              ); // Function is executed on tap.
                            },
                            child: Container(
                              // decoration: BoxDecoration(
                              //     gradient: LinearGradient(
                              //       //begin: Alignment.topRight,
                              //       //end: Alignment.bottomLeft,
                              //         colors: [
                              //           Colors.amberAccent,
                              //           Colors.amberAccent,
                              //           Colors.amber[100]
                              //         ]

                              //     )

                              // ),

                              // elevation: 4.0,

                              child: new Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: Column(children: [
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0, 0, 0, 8),
                                                  child: Text(
                                                    'Highlights : Newsfeed',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 18,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              CarouselWithIndicator(),
                                            ])),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )))),
                ],
              ),
            ), //SliverListRemaining
          ],
        ),
      ),
    );
  }
}

class CustomSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final bool hideTitleWhenExpanded;

  CustomSliverDelegate({
    @required this.expandedHeight,
    this.hideTitleWhenExpanded = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final appBarSize = expandedHeight - shrinkOffset;
    final cardTopPosition = expandedHeight / 1.8 - shrinkOffset;
    final proportion = 2 - (expandedHeight / appBarSize);
    final percent = proportion < 0 || proportion > 1 ? 0.0 : proportion;
    return SizedBox(
      height: expandedHeight + expandedHeight / 2,
      child: Stack(
        children: [
          SizedBox(
            height: appBarSize < kToolbarHeight ? kToolbarHeight : appBarSize,
            child: AppBar(
              centerTitle: true,

              // leading: IconButton(
              //   icon: Icon(Icons.menu),
              //   onPressed: () {},
              // ),
              elevation: 2.0,
              title: Opacity(
                  opacity: hideTitleWhenExpanded ? 1.0 - percent : 1.0,
                  child: Text("MyMasjid",
                      style: TextStyle(
                        color: Colors.limeAccent,
                      ))),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[
                      Colors.greenAccent[700],
                      Colors.lightGreen[700],
                    ])),
              ),
            ),
          ),

          //User setting box
          Positioned(
            left: 0.0,
            right: 0.0,
            top: 22,
            bottom: 70.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20 * percent),
               
                child: new Column(
                
               //pic of user
                children: [
                  
        new Container(
          // padding: new EdgeInsets.only(top: 16.0),
          child: new Row(
            // crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


              new Text(
                'MyMasjid',
                style: new TextStyle(
                  fontSize: 25.0,
                  fontFamily: 'Roboto',
                  color: new Color(0xFFFFFFFF)
                ),
              )
            ],
          ),
          alignment: Alignment(-1.0, -0.8),
        ),




               //pic of user
                

                  new Container(
                                
                  child: new ListTile(
                    trailing: new CircleAvatar(
                      foregroundColor: Theme.of(context).primaryColor,
                      backgroundColor: Colors.grey,
                      backgroundImage: new NetworkImage(
                          "https://4.bp.blogspot.com/-xHDXyhSr0No/TiZtgISjVtI/AAAAAAAAARU/98xGq943Qjs/s1600/282001_175226442543572_100001686515535_453348_4392783_n.jpg"),
                    ),
                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          " ",
                          style: new TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25.0),
                          textAlign: TextAlign.right,
                        ),
                        new Text(
                          "Ahmad Kazim",
                          style: new TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    // subtitle: new Container(
                    //   padding: const EdgeInsets.only(top: 5.0),
                    //   child: new Text(
                    //     "Next prayer : in 20 mins (Asar)",
                    //     style: new TextStyle(
                    //         color: Colors.grey[300], fontSize: 15.0),
                    //     textAlign: TextAlign.right,
                    //   ),
                    // ),
                  ),
                ),
                



                // prayer time
                  new Container(
                                
                  child: new ListTile(

                    title: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          " ",
                          style: new TextStyle(
                              color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 25.0),
                          textAlign: TextAlign.right,
                        ),
                        new Text(
                          "Next prayer : in 20 mins (Asar)",
                          style: new TextStyle(color: Colors.grey[300],  fontSize: 12.0),
                        ),
                      ],
                    ),
                    subtitle: new Container(
                      padding: const EdgeInsets.only(top: 1.0),
                      child: new Text(
                        "Nearest Mosque : 1km Northeast",
                        style: new TextStyle(
                            color: Colors.grey[300], fontSize: 12.0),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
                




                ]


              ),


              ),
            ),
          ),

          Positioned(
            left: 0.0,
            right: 0.0,
            top: cardTopPosition > 0 ? cardTopPosition : 0,
            bottom: 70.0,
            child: Opacity(
              opacity: percent,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20 * percent),
                child: new Card(
                  color: Colors.white,
                  elevation: 4.0,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new SecondHome()));

                      // Navigator.of(context).pushNamedAndRemoveUntil("/second",
                      // (route) => true,);// Function is executed on tap.
                    },
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      //mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        //first row of application list
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Newsfeed Application Button
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.brightness_4,
                                    color: Colors.blue[700],
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'Newsfeed',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),

                            //Charity Application Button
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.all_inclusive,
                                    color: Colors.yellow[600],
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'Charity',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),

                            //Asnaf Application Button
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.people,
                                    color: Colors.green,
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'Asnaf',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),

                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.people,
                                    color: Colors.green,
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'Asnaf',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),

                        //second row of application service
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //Newsfeed Application Button
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.brightness_4,
                                    color: Colors.blue[700],
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'Newsfeed',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),

                            //Charity Application Button
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.all_inclusive,
                                    color: Colors.yellow[600],
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'Charity',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),

                            //Asnaf Application Button
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.people,
                                    color: Colors.green,
                                    size: 30.0,
                                  ),
                                  SizedBox(
                                    height: 8.0,
                                  ),
                                  Text(
                                    'Asnaf',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight + expandedHeight / 2;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

// class SecondHome extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Second Home'),
//       ),
//       body: new Center(
//         child: RaisedButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           child: Text('Go Back'),
//         ),
//       ),
//     );
//   }
// }

//Newsfeeed Homepage

class SecondHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: "Networking", home: NewsList());
  }
}
