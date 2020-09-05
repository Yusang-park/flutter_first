import 'package:flutter/material.dart';

class MycstScreen extends StatefulWidget {
  @override
  _MycstScreenState createState() => _MycstScreenState();
}

//버린

class _MycstScreenState extends State<MycstScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 12, top: 50),
              child: Text(
                '컨설팅\n━━━━━━━━━━━━━━━━━━━━━━━',
                style: TextStyle(
                  color: Color(0xFF093687),
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 7, left: 10),
              child: Text('1. 컨설팅을 원하는 분야를 선택하세요'),
            ),
            DropdownButton<String>(
              items: <String>['asdfA', 'adsfB', 'adfC', 'asdfD']
                  .map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              onChanged: (_) {},
            )
          ]),
    );
  }
}
