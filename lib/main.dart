import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key key, this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.book_solid), title: Text("Articles")),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.eye_solid), title: Text("Views")),
          ],
        ),
        tabBuilder: (context, i) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: (i == 0) ? Text('Articles') : Text('Views'),
                ),
                child: Center(
                  child: CupertinoButton(
                    child: Text('This is #$i'),
                    onPressed: () {
                      Navigator.of(context)
                          .push(CupertinoPageRoute(builder: (context) {
                        return DetailScreen(
                            topic: i == 0 ? "Articles" : "Views");
                      }));
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({this.topic});

  final String topic;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("Details"),
        ),
        child: Center(
          child:
              GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(CupertinoPageRoute(builder: (context) {
                      return MoreDetailScreen(
                          moretopic: 'More topic is here');
                    }));
                  },
                  child: Text("Details for $topic")),
        ));
  }
}

class MoreDetailScreen extends StatelessWidget {
  const MoreDetailScreen({this.moretopic});

  final String moretopic;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text("More Details"),
        ),
        child: Center(
          child: Text("More Details for $moretopic"),
        ));
  }
}
