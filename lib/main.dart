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
    final CarouselSlider manualCarouselDemo = CarouselSlider(
      items: child,
      autoPlay: false,
      enlargeCenterPage: true,
      viewportFraction: 0.9,
      aspectRatio: 2.0,
    );

    Paint paintRed = Paint();
    paintRed.color = Colors.red;
    Paint paintYellow = Paint();
    paintYellow.color = Colors.yellow;
    Paint paintGreen = Paint();
    paintGreen.color = Colors.green;
    return new Stack(
      children: <Widget>[
        // The containers in the background
        new Column(
          children: <Widget>[
            new Container(
              height: MediaQuery.of(context).size.height * .30,
              decoration: BoxDecoration(
                border: null,
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple,
                    Colors.purple,
                  ],
                ),
              ),
              child: Center(
                child: Text(
                  ' MyMasjid \nAhmad Kazim',
                  textDirection: TextDirection.ltr,
                  style: TextStyle(
                    fontFamily: 'RobotoMono',
                    decoration: TextDecoration.none,
                    fontSize: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            new Container(
              height: MediaQuery.of(context).size.height * .70,
              color: Colors.white,
            )
          ],
        ),

        // The card widget with top padding,
        // incase if you wanted bottom padding to work,
        // set the `alignment` of container to Alignment.bottomCenter

        new Container(
          alignment: Alignment.topCenter,
          padding: new EdgeInsets.only(
              top: MediaQuery.of(context).size.height * .20,
              right: 20.0,
              left: 20.0),

          //size of application list box
          child: new Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
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
              )),
        ),

ListView(
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.0),
                                  child: Column(children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                        child: Text(
                                          'Highlights : Newsfeed',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.0),
                                  child: Column(children: [
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Container(
                                        padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                        child: Text(
                                          'Highlights : Newsfeed',
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
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
      
  ],),
      ],
    );
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
