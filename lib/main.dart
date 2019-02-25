import 'package:flutter/material.dart';
import 'package:flutter_lht_news/widget/news_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,// скрываем надпись debug
      title: 'Flutter Demo',
      theme: new ThemeData(
        primaryColor: Color.fromRGBO(58, 66, 86, 1.0),
        scaffoldBackgroundColor: Colors.black12,
        cardColor:Color.fromRGBO(58, 66, 86, 1.0),
        buttonColor: Colors.pink.shade700,
        canvasColor: Colors.grey.shade700,
        accentTextTheme:
        TextTheme(button: TextStyle(color: Colors.pink.shade200)),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade700)),
        )
      ),
      home: MyHomePage(title: 'LHT News'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: ListNews('technology'
      ),
      bottomNavigationBar: makeBottom,

    );
  }

  final makeBottom = Container(
    height: 55.0,
    child: BottomAppBar(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.home, color: Colors.pinkAccent),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.settings, color: Colors.white),
            onPressed: () {},
          ),

        ],
      ),
    ),
  );
}

