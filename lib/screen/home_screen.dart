import 'package:flutter/material.dart';
import 'package:flutter_banner_swiper/flutter_banner_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'consulting_screen.dart';

const List<String> imgList = ['images/banner1.png', 'images/banner2.png'];
const List<String> profileList = [
  'images/profile1.png',
  'images/profile2.png',
  'images/profile3.png'
];

class Profile {
  int number;
  String name;
  String job;

  Profile(this.number, this.name, this.job);
}

class ProfileTile extends StatelessWidget {
  ProfileTile(this._profile); //매개변수를 설정
  final Profile _profile;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ProfileIcon(_profile.number),
      title: Text(_profile.name),
      subtitle: Text("${_profile.job}"),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  ProfileIcon(this._number);
  final _number;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      profileList[_number],
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  get crossAxisAlignment => null;

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    //  title: Text('알림'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    content: SingleChildScrollView(
                      child: Text('현재 진행중인 컨설팅이 없습니다.\n새로운 컨설팅을 시작할까요?'),
                    ),
                    actions: <Widget>[
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(context, MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                              return ConsultingScreen();
                            }));
                          },
                          child: Text('YES')),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('NO')),
                    ],
                  );
                });
          },
          label: Text('컨설팅'),
          icon: Icon(Icons.comment),
          backgroundColor: Colors.lightBlue[600],
        ),
        body: ListView(
          physics: BouncingScrollPhysics(),

          //crossAxisAlignment: CrossAxisAlignment.start, //최상단 Column에 삽입해야 정렬이 동작
          children: <Widget>[
            //최상단 Column chilren
            //배너
            Padding(
                padding: EdgeInsets.only(top: 0),
                child: BannerSwiper(
                    width: 150,
                    height: 400,
                    length: imgList.length,
                    getwidget: (index) {
                      return new GestureDetector(
                        child: Image.asset(
                          imgList[index % imgList.length],
                          fit: BoxFit.contain,
                        ),
                        onTap: () {},
                      );
                    })),

            Padding(
              padding:
                  EdgeInsets.only(left: 12, top: 25, right: 12), //패딩을 한쪽에만 넣는 법
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'AA에서 진행되었던 컨설팅들을 볼 수 있어요',
                      style: TextStyle(
                        color: Color(0xFF093687),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Divider(color: Color(0xFF093687)),
                  ]),
            ),

            Container(
                height: 40,
                margin: EdgeInsets.only(left: 30, right: 20, bottom: 10),
                child: Row(
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        style:
                            TextStyle(fontSize: 17, color: Color(0xFF093687)),
                        textAlign: TextAlign.left,
                        decoration: InputDecoration(hintText: 'Search'),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.search),
                        color: Color(0xFF093687),
                        onPressed: () {})
                  ],
                )),

            Padding(
              padding: EdgeInsets.only(left: 17, right: 17),
              child: mainMenu(),
            ),

            Padding(
                padding: EdgeInsets.only(left: 12, top: 50), //패딩을 한쪽에만 넣는 법
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'AA에서 활동하는 컨설턴트들이에요',
                      style: TextStyle(
                        color: Color(0xFF093687),
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    Divider(
                      color: Color(0xFF093687),
                    ),
                    ListTile(
                      leading: Image.asset('images/profile1.png'),
                      title: Text('최승훈\n마케팅'),
                    ),
                    ListTile(
                      leading: Image.asset('images/profile2.png'),
                      title: Text('강나영\n경영'),
                    ),
                    ListTile(
                      leading: Image.asset('images/profile3.png'),
                      title: Text('이창민\n비즈니스'),
                    ),
                    ListTile(
                      leading: Image.asset('images/profile4.png'),
                      title: Text('박유상\nIT/프로그래밍'),
                    ),
                    ListTile(
                      leading: Image.asset('images/profile5.png'),
                      title: Text('하상원\n마케팅'),
                    ),
                    ListTile(
                      leading: Image.asset('images/profile6.png'),
                      title: Text('권재헌\nIT/프로그래밍'),
                    ),
                  ],
                )),
          ],
        ));
  }
}

Widget mainProfile() {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: Image.asset('images/profile1.png'),
        title: Text('hi'),
      )
    ],
  );
}

Widget mainMenu() {
  return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, //행에서의 간격을 알아서 띄워줌
            children: <Widget>[
              Column(
                //음악
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.headset),
                    color: Color(0xFF093687),
                    onPressed: () {},
                  ),
                  Text(
                    '음악',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.laptop_windows),
                    color: Color(0xFF093687),
                    onPressed: () {},
                  ),
                  Text(
                    'IT/프로그래밍',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.bookOpen),
                    color: Color(0xFF093687),
                    onPressed: () {},
                  ),
                  Text(
                    '법률',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: FaIcon(FontAwesomeIcons.handshake),
                    color: Color(0xFF093687),
                    onPressed: () {},
                  ),
                  Text(
                    '비즈니스',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.attach_money),
                    color: Color(0xFF093687),
                    onPressed: () {},
                  ),
                  Text(
                    '재무',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
//======================================================================//
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween, //행에서의 간격을 알아서 띄워줌
            children: <Widget>[
              Column(
                //음악
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.image),
                    color: Color(0xFF093687),
                    onPressed: () {},
                  ),
                  Text(
                    '디자인',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.people_outline),
                    color: Color(0xFF093687),
                    onPressed: () {},
                  ),
                  Text(
                    '마케팅',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.airplanemode_active),
                    color: Color(0xFF093687),
                    onPressed: () {},
                  ),
                  Text(
                    '여행',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.g_translate),
                    color: Color(0xFF093687),
                    onPressed: () {},
                  ),
                  Text(
                    '언어',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.local_hospital),
                    color: Color(0xFF093687),
                    onPressed: () {},
                  ),
                  Text(
                    '건강',
                    style: TextStyle(fontSize: 11),
                  ),
                ],
              ),
            ],
          ),
        ],
      ));
}
