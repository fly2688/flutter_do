/**
 * 作者：leavesC
 * 时间：2019/10/16 12:14
 * 描述：
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_do/common/page.dart';

class ListViewPage extends BaseDemoPage {
  ListViewPage() : super('ListView', includeScrollView: false);

  @override
  Widget generateChildren(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            child: Text("SimpleListViewPage"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return _SimpleListViewPage();
              }));
            },
          ),
          RaisedButton(
            child: Text("ListViewPage"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return _ListViewPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}

class _ListViewPage extends BaseDemoPage {
  _ListViewPage() : super('ListView', includeScrollView: false);

  @override
  Widget generateChildren(BuildContext context) {
    return _ListView();
  }
}

class _ListView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListViewState();
  }
}

class _ListViewState extends State<_ListView> {
  static const MAX_SIZE = 80;

  static const loadEndTag = "##loadEndTag#";

  var _dataList = <String>[loadEndTag];

  Color _color1 = Colors.grey[100];

  Color _color2 = Colors.grey[200];

  Widget _divider1 = Divider(
    color: Colors.lightBlue,
    height: 2,
  );

  Widget _divider2 = Divider(
    color: Colors.lightGreen,
    height: 2,
  );

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        child: ListView.separated(
      itemCount: _dataList.length,
//        itemExtent: 40.0,
      separatorBuilder: (BuildContext context, int index) {
        return index % 2 == 0 ? _divider1 : _divider2;
      },
      itemBuilder: (BuildContext context, int index) {
        if (_dataList[index] == loadEndTag) {
          if (_dataList.length < MAX_SIZE) {
            _generateData();
            return Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: SizedBox(
                  width: 28,
                  height: 28,
                  child: CircularProgressIndicator(strokeWidth: 2)),
            );
          } else {
            return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "加载完毕",
                  style: TextStyle(color: Colors.grey),
                ));
          }
        }
        return Container(
          height: 50,
          color: index % 2 == 0 ? _color1 : _color2,
          child: Center(
            child: Text("$index"),
          ),
        );
      },
    ));
  }

  void _generateData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      setState(() {
        List<String> list = List<String>();
        for (int i = 0; i < 20; i++) {
          list.add((_dataList.length + i).toString());
        }
        _dataList.insertAll(_dataList.length - 1, list);
      });
    });
  }
}

class _SimpleListViewPage extends BaseDemoPage {
  _SimpleListViewPage() : super('Simple ListView', includeScrollView: false);

  @override
  Widget generateChildren(BuildContext context) {
    return Scrollbar(
      child: ListView(
        children: _generateListView(),
      ),
    );
  }

  List<Widget> _generateListView() {
    List<Widget> list = List<Widget>();
    for (int i = 0; i < 40; i++) {
      list.add(Padding(
        padding: EdgeInsets.all(10),
        child: Text("$i"),
      ));
    }
    return list;
  }
}
