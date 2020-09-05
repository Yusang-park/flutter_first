import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//하단 바를 만드는 파일

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF093687), //색상
      child: Container(
        height: 55,
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white54,
          indicatorColor: Colors.white, //선택된 탭의 밑줄
          indicatorSize: TabBarIndicatorSize.label, //밑줄 너비
          indicatorWeight: 2, //밑줄 길이
          //transparent은 투명

          //추가해야할 것
          //1. 아이콘 선택시 색상이 변하도록한다.
          tabs: <Widget>[
            //탭들을 생성
            Tab(
                //홈 탭
                child: Text(
                  '메인',
                  style: TextStyle(fontSize: 11),
                ),
                icon: FaIcon(
                  FontAwesomeIcons.home,
                  size: 15,
                  color: Colors.white,
                )),
            Tab(
                //컨설팅 탭
                child: Text(
                  'My 컨설팅',
                  style: TextStyle(fontSize: 11),
                ),
                icon: Icon(
                  Icons.library_books,
                  size: 15,
                  color: Colors.white,
                )),
            Tab(
                //컨설팅 기록 탭
                child: Text(
                  '커뮤니티',
                  style: TextStyle(fontSize: 11),
                ),
                icon: Icon(
                  Icons.account_balance,
                  size: 15,
                  color: Colors.white,
                )),
            Tab(
              //더보기
              child: Text(
                '내 정보',
                style: TextStyle(fontSize: 11),
              ),
              icon: Icon(
                Icons.account_circle,
                size: 15,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
