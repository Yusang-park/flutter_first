import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hi/screen/cst_screen.dart';
import 'package:hi/screen/home_screen.dart';
import 'package:hi/widget/BottomBar.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color(0xFFF9F9F9)));
  runApp(MaterialApp(
    title: 'AA Consulting',
    theme: ThemeData(
      accentColor: Colors.green, //강조하는 색상
      brightness: Brightness.light, //밝기
      primaryColor: Colors.white, //기본 색상
    ),
    home: MyApp(title: 'AA Crowd Consulting'), //title변수에 내용 전달
  ));
}

class MyApp extends StatefulWidget {
  //매개변수를 받고, 매개변수를 선언하는 부분임
  const MyApp({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _logoPadding = 10;

//상태에 사용할 변수 선언과 함께 함수도 선언한다.

  void _btnClick() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MainApp(),
          ));
    });
  }

  void initState() {
    //생성자
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      //특정 시간마다 아래 함수를 실행
      setState(() {
        _logoPadding = (_logoPadding == 10) ? 80.0 : 10.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title, //stateful은 상위의 매개변수를 widget.로 로드
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 0, bottom: 0),
                child: AnimatedPadding(
                    padding: EdgeInsets.all(_logoPadding),
                    duration: Duration(seconds: 1),
                    child: Image.asset(
                      'images/Logo.png',
                      //  height: ,
                    )),
              ),
              Column(
                //최상단 Column에서 spacebetwwen을 사용하므로 하단 Column의
                //공간확보는 무시된다.
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 10, top: 0),
                    width: 250,
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
                      child: Text(
                        'SIGN UP NOW',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, top: 0),
                    width: 250,
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
                          Align(
                            child: FaIcon(
                              FontAwesomeIcons.facebook,
                              color: Colors.white,
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Align(
                            child: Text(
                              'CONTINUE\nWITH FACEBOOK',
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
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, top: 0),
                    width: 250,
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
                          Align(
                            child: FaIcon(
                              FontAwesomeIcons.google,
                              color: Colors.white,
                            ),
                            alignment: Alignment.centerLeft,
                          ),
                          Align(
                            child: Text(
                              'CONTINUE\nWITH GOOGLE',
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
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10, top: 0),
                    width: 250,
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
                              'LOG IN',
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
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        //홈을 탭 컨트롤러로 설정
        length: 4, //탭의 개수
        child: new Scaffold(
          resizeToAvoidBottomPadding: false,
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            //탭에 따라 화면이 바뀌도록 설정
            children: <Widget>[
              //탭 스크린
              HomeScreen(),
              MycstScreen(),
              //센터도 무조건 child
              Container(
                  child: //컨테이너는 무조건 child
                      Center(
                child: Text('기록'),
              )), //센터도 무조건 child
              Container(
                  child: //컨테이너는 무조건 child
                      Center(
                child: Text('더보기'),
              )), //센터도 무조건 child
            ],
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
