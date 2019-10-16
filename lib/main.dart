/**
 * 作者：leavesC
 * 时间：2019/10/15 10:32
 * 描述：
 */
import 'package:flutter/material.dart';
import 'package:flutter_do/routes/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      onGenerateRoute: hh,
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _generateButton(context, RoutePageAll.route_text),
              _generateButton(context, RoutePageAll.route_button),
              _generateButton(context, RoutePageAll.route_image),
              _generateButton(context, RoutePageAll.route_switchCheckbox),
              _generateButton(context, RoutePageAll.route_progress),
              _generateButton(context, RoutePageAll.route_input),
              _generateButton(context, RoutePageAll.route_form),
              _generateButton(context, RoutePageAll.route_row_column),
              _generateButton(context, RoutePageAll.route_flex),
              _generateButton(context, RoutePageAll.route_align),
              _generateButton(context, RoutePageAll.route_padding),
              _generateButton(context, RoutePageAll.route_wrap),
              _generateButton(context, RoutePageAll.route_listView),
              _generateButton(context, RoutePageAll.route_gridView),
            ],
          ),
        ),
      ),
    );
  }
}

String getRouteTag(String routePath) {
  List<String> temp = routePath.split("/");
  return temp[temp.length - 1];
}

Widget _generateButton(BuildContext context, String routePath, {String title}) {
  return RaisedButton(
    child: Text(title ?? getRouteTag(routePath)),
    onPressed: () {
      Navigator.of(context).pushNamed(routePath);
    },
  );
}
