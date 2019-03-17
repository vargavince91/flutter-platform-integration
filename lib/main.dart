import 'package:flutter/material.dart';
import 'package:meetup_flutter_platform_integration/example_slide_A.dart';
import 'package:meetup_flutter_platform_integration/example_slide_B.dart';
import 'package:meetup_flutter_platform_integration/example_slide_C.dart';

void main() => runApp(MyApp());

const placeholder = 'Flutter Munich';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: placeholder,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: placeholder),
      debugShowCheckedModeBanner: false,
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
  int index = 0;
  final List<Widget> slides = [
    ExampleSlideA(),
    ExampleSlideB(),
    ExampleSlideC(),
  ];

  get prev {
    bool active = index > 0;
    if (active) {
      return () {
        setState(() {
          index--;
        });
      };
    }
    return null;
  }

  get next {
    bool active = index < slides.length - 1;
    if (active) {
      return () {
        setState(() {
          index++;
        });
      };
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.navigate_before), onPressed: prev),
            Text(placeholder),
            IconButton(icon: Icon(Icons.navigate_next), onPressed: next),
          ]
        ),
      ),
      body: slides[index],
    );
  }
}
