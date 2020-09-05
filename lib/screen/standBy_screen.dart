import 'package:flutter/material.dart';
import 'package:hi/screen/profile_dialog.dart';
import 'package:hi/screen/realChat_screen.dart';
import 'package:progress_dialog/progress_dialog.dart';

var loading = 0;

class StandByScreen extends StatefulWidget {
  const StandByScreen({
    Key key,
    this.job,
    this.career,
    this.license,
    this.numMin,
    this.numMax,
    this.moneyMin,
    this.moneyMax,
  }) : super(key: key);

  final job;
  final career;
  final license;
  final numMin;
  final numMax;
  final moneyMin;
  final moneyMax;

  @override
  _StandByScreenState createState() => _StandByScreenState();
}

class _StandByScreenState extends State<StandByScreen> {
  List<String> _list = List();
  bool _isProfile1 = false;
  bool _isProfile2 = false;
  bool _isProfile3 = false;
  bool _isProfile4 = false;
  bool _isProfile5 = false;
  String _islicense = '자격증 X';

  @override
  Widget build(BuildContext context) {
    void _btnClick() {
      ProgressDialog pr;
      pr = ProgressDialog(context,
          type: ProgressDialogType.Normal,
          isDismissible: false,
          showLogs: true);
      pr.style(message: '선택한 컨설턴트 \n채팅방을 생성중입니다.');

      pr.show();
      Future.delayed(Duration(seconds: 1)).then((value) {
        pr.hide();
        setState(() {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => (RealChatScreen(
                  cstlist: _list,
                  moneyMin: widget.moneyMin,
                  moneyMax: widget.moneyMax,
                  jobValue: widget.job,
                )),
              ));
        });
      });
    }

    if (widget.license == '있음') {
      _islicense = '자격증 O';
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('컨설턴트 선택'),
          backgroundColor: Color(0xFFF9F9F9),
        ),
        body: ListView(
          padding: EdgeInsets.all(25),
          //shrinkWrap: true,
          children: <Widget>[
            Row(
              //         mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Image.asset(
                  'images/profile1.png',
                ),
                Expanded(
                  child: Container(
                      //margin: EdgeInsets.only(left: 20),
                      //color: Colors.amber,
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '김정현',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      FlatButton(
                        color: Color(0xFFECECEC),
                        onPressed: () {
                          showDialog(
                              //Stateful Dialog 생성하기
                              context: context,
                              builder: (context) {
                                return StatefulBuilder(builder:
                                    (BuildContext context,
                                        StateSetter setState) {
                                  return ProfileDialog(
                                    id: '김정현',
                                    jobvalue: widget.job,
                                  );
                                });
                              });
                        },
                        child: Text('프로필 보기'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color: Colors.black26,
                                style: BorderStyle.none)),
                      )
                    ],
                  )),
                ),

                //Row에서의 오른쪽 밀착에 대해서 연구해야함.
                Checkbox(
                    value: _isProfile1,
                    onChanged: (value) {
                      setState(() {
                        _isProfile1 = value;
                        _isProfile1 ? _list.add("김정현") : _list.remove("김정현");
                      });
                    }),
              ],
            ),
            Divider(
              color: Colors.black45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'images/profile2.png',
                ),
                Expanded(
                  child: Container(
                      //margin: EdgeInsets.only(left: 20),
                      //color: Colors.amber,
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '강혜원',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      FlatButton(
                        color: Color(0xFFECECEC),
                        onPressed: () {},
                        child: Text('프로필 보기'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color: Colors.black26,
                                style: BorderStyle.none)),
                      )
                    ],
                  )),
                ),
                Checkbox(
                    value: _isProfile2,
                    onChanged: (value) {
                      setState(() {
                        _isProfile2 = value;
                        _isProfile2 ? _list.add("강혜원") : _list.remove("강혜원");
                      });
                    }),
              ],
            ),
            Divider(
              color: Colors.black45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'images/profile3.png',
                ),
                Expanded(
                  child: Container(
                      //margin: EdgeInsets.only(left: 20),
                      //color: Colors.amber,
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '박시은',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      FlatButton(
                        color: Color(0xFFECECEC),
                        onPressed: () {},
                        child: Text('프로필 보기'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color: Colors.black26,
                                style: BorderStyle.none)),
                      )
                    ],
                  )),
                ),
                Checkbox(
                    value: _isProfile3,
                    onChanged: (value) {
                      setState(() {
                        _isProfile3 = value;
                        _isProfile3 ? _list.add("박시은") : _list.remove("박시은");
                      });
                    }),
              ],
            ),
            Divider(
              color: Colors.black45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'images/profile4.png',
                ),
                Expanded(
                  child: Container(
                      //margin: EdgeInsets.only(left: 20),
                      //color: Colors.amber,
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '김민수',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      FlatButton(
                        color: Color(0xFFECECEC),
                        onPressed: () {},
                        child: Text('프로필 보기'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color: Colors.black26,
                                style: BorderStyle.none)),
                      )
                    ],
                  )),
                ),
                Checkbox(
                    value: _isProfile4,
                    onChanged: (value) {
                      setState(() {
                        _isProfile4 = value;
                        _isProfile4 ? _list.add("김민수") : _list.remove("김민수");
                      });
                    }),
              ],
            ),
            Divider(
              color: Colors.black45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  'images/profile5.png',
                ),
                Expanded(
                  child: Container(
                      //margin: EdgeInsets.only(left: 20),
                      //color: Colors.amber,
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        '박은수',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      FlatButton(
                        color: Color(0xFFECECEC),
                        onPressed: () {},
                        child: Text('프로필 보기'),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                                color: Colors.black26,
                                style: BorderStyle.none)),
                      )
                    ],
                  )),
                ),
                Checkbox(
                    value: _isProfile5,
                    onChanged: (value) {
                      setState(() {
                        _isProfile5 = value;
                        _isProfile5 ? _list.add("박은수") : _list.remove("박은수");
                      });
                    }),
              ],
            ),
            Divider(
              color: Colors.black45,
            ),
            SizedBox(
              height: 30,
            ),
            Align(
                child: Container(
              margin: EdgeInsets.only(bottom: 10, top: 0),
              width: 200,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  gradient: LinearGradient(colors: <Color>[
                    Color(0xFF0D47A1),
                    Color(0xFF1976D2),
                    Color(0xFF42A5F5),
                  ])),
              child: RaisedButton(
                onPressed: () {
                  _btnClick();
                },
                child: Stack(
                  children: <Widget>[
                    /*   Align(
                            child: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.white,
                            ),
                            alignment: Alignment.centerLeft,
                          ),*/
                    Align(
                      child: Text(
                        'SELECT',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      alignment: Alignment.center,
                    ),
                  ],
                ),
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            )),
          ],
        ));
  }
}
