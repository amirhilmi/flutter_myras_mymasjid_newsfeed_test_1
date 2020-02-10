import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:networking_demo/widgets/newsList.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      '/': (context) => MyApp(),
      '/second': (context) => SecondHome(),
    },
  ));
}

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
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .30,

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
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .70,
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
                top: MediaQuery
                    .of(context)
                    .size
                    .height * .20,
                right: 20.0,
                left: 20.0),
           
            child: new Container(
              height: 100.0,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
             
              child: new Card(
                color: Colors.white,
                elevation: 4.0,

              child: InkWell(
                onTap: () {
                  
                  Navigator.push(context, new MaterialPageRoute(
                   builder: (context) =>
                  new SecondHome())
                );
                  
                  // Navigator.of(context).pushNamedAndRemoveUntil("/second",
                  // (route) => true,);// Function is executed on tap.
                },

                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: <Widget>[

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.brightness_4, color: Colors.blue[700], size: 30.0,),
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

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.all_inclusive, color: Colors.yellow[600], size: 30.0,),
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

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Icon(Icons.people, color: Colors.green, size: 30.0,),
                             
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
              )
            ),
          ),



          new Container(
              alignment: Alignment.topCenter,
              padding: new EdgeInsets.only(
                  top: MediaQuery
                      .of(context)
                      .size
                      .height * .40,

                  right: 20.0,
                  left: 20.0),


              child: new Container(
                height: 100.0,
                width: MediaQuery
                    .of(context)
                    .size
                    .width,


                child: new Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamedAndRemoveUntil("/second",
                              (route) => true,);// Function is executed on tap.
                      },



                  child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          //begin: Alignment.topRight,
                          //end: Alignment.bottomLeft,
                            colors: [
                              Colors.amberAccent,
                              Colors.amberAccent,
                              Colors.amber[100]
                            ]

                        )

                    ),


                    //elevation: 4.0,

                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[

                              SizedBox(
                                height: 35.0,
                              ),

                              Text(
                                'CONTENTS',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,

                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
              )
            )
           )
          )
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


class SecondHome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Networking",
      home: NewsList()
    );
  }

}

