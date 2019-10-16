/**
 * 作者：leavesC
 * 时间：2019/10/15 10:32
 * 描述：
 */
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_do/common/page.dart';

const String _tip1 = "hello world,I am leavesc";

const String _tip2 =
    """晋太元中，武陵人捕鱼为业。缘溪行，忘路之远近。忽逢桃花林，夹岸数百步，中无杂树，芳草鲜美，落英缤纷。渔人甚异之，复前行，欲穷其林。林尽水源，便得一山，山有小口，仿佛若有光。便舍船，从口入。初极狭，才通人。复行数十步，豁然开朗。土地平旷，屋舍俨然，有良田美池桑竹之属。""";

class TextPage extends BaseDemoPage {
  TextPage() : super('Flutter Text Demo');

  @override
  Widget generateChildren(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            _tip1,
            textAlign: TextAlign.start,
            textScaleFactor: 1,
            style: TextStyle(
              fontSize: 18,
              color: Colors.deepOrange[400],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Text(
            _tip1,
            textAlign: TextAlign.start,
            textScaleFactor: 1.1,
            style: TextStyle(
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed,
                fontSize: 18,
                color: Colors.brown[400]),
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Text(
            _tip2,
            textAlign: TextAlign.start,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            textScaleFactor: 1.2,
            style: TextStyle(
                fontSize: 18,
                color: Colors.blue[400],
                shadows: [Shadow(offset: Offset(2, 2), blurRadius: 2.0)]),
          ),
        ),
        TextSpanWidget(),
        Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Text(
            _tip2,
            textAlign: TextAlign.start,
            textScaleFactor: 1.4,
            style: TextStyle(
              fontSize: 18,
              color: Colors.green[400],
              fontFamily: 'Light',
            ),
          ),
        ),
      ],
    );
  }
}

class TextSpanWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextSpanWidgetState();
  }
}

class _TextSpanWidgetState extends State<TextSpanWidget> {
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer()
    ..onTap = () {
      print("被点击了");
    };

  @override
  void dispose() {
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: "带手势识别的文本：",
            style: TextStyle(fontSize: 18, color: Colors.black)),
        TextSpan(
            text: "https://github.com/leavesC",
            style: TextStyle(fontSize: 18, color: Colors.blue),
            recognizer: _tapGestureRecognizer)
      ])),
    );
  }
}
