import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hi/screen/dialog.dart';

List<String> name = ['김정현', '강혜원', '박시은', '김민수', '박은수'];
List<String> profile = [
  'images/profile1.png',
  'images/profile2.png',
  'images/profile3.png',
  'images/profile4.png',
  'images/profile5.png'
];

final chatController = TextEditingController();

Map<String, String> cstMap = Map.fromIterables(name, profile);
List<String> coment = [
  '선택해주셔서 감사합니다.',
  '편하게 상담해주세요.',
  '궁금증이 해소될 때까지 도와드리겠습니다.'
];

String nowTime() {
  var now = new DateTime.now();
  //now = now.add(new Duration(hours: 9));
  var _hour = now.hour;
  var ampm = '오전';
  if (now.hour > 12) {
    ampm = '오후';
    _hour = _hour - 12;
  }

  return ampm + ' ' + _hour.toString() + ':' + now.minute.toString();
}

class RealChatScreen extends StatefulWidget {
  const RealChatScreen({
    Key key,
    this.moneyMin,
    this.moneyMax,
    this.jobValue,
    this.career,
    this.license,
    this.numMin,
    this.numMax,
    this.cstlist,
  }) : super(key: key);

  final List<String> cstlist;
  final moneyMin;
  final moneyMax;
  final jobValue;
  final career;
  final license;
  final numMin;
  final numMax;

  @override
  _RealChatScreenState createState() => _RealChatScreenState();
}

class _RealChatScreenState extends State<RealChatScreen> {
  @override
  void initState() {
    int _start = 0;

    super.initState();
    for (int i = 0; i < widget.cstlist.length; i++)
      handleInChat(widget.cstlist[i]);
    Future.delayed(Duration(milliseconds: 1500)).then((value) {
      Timer.periodic(Duration(seconds: 3), (timer) {
        setState(() {
          handleGetMessage(
              widget.cstlist[_start],
              coment[_start] +
                  widget.jobValue +
                  ' 컨설턴트 ' +
                  widget.cstlist[_start] +
                  '입니다.');
          _start++;
          if (_start >= widget.cstlist.length) timer.cancel();
        });
      });
    });
  }

  final List<ChatMessage> _messages = [];

  void handleInChat(String _id) {
    ChatMessage message = ChatMessage(
      type: 2,
      id: _id,
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void handleGetMessage(String _id, String _textMeassage) {
    ChatMessage message = ChatMessage(
      type: 0,
      id: _id,
      messageText: _textMeassage,
      time: nowTime(),
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void handleMyMessage(String _textMessage) {
    ChatMessage message = ChatMessage(
      type: 1,
      id: null,
      messageText: _textMessage,
      time: nowTime(),
    );
    setState(() {
      chatController.clear();
      _messages.insert(0, message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        home: CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              leading: CupertinoButton(
                  child: Icon(CupertinoIcons.back),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  }),
              middle: Column(
                children: <Widget>[
                  Text(
                    '컨설팅 채팅',
                  ),
                  RemainTime(),
                ],
              ),
              trailing: CupertinoButton(
                  child: Icon(Icons.exit_to_app),
                  onPressed: () {
                    showDialog(
                        //Stateful Dialog 생성하기
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder:
                              (BuildContext context, StateSetter setState) {
                            return AssessDialog(
                              cstlist: widget.cstlist,
                              moneyMax: widget.moneyMax,
                              moneyMin: widget.moneyMin,
                            );
                          });
                        });
                  }),
            ),
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 10,
                  child: ListView.builder(
                    reverse: true, //무엇인가
                    itemBuilder: (context, index) => _messages[index],
                    itemCount: _messages.length,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 10),
                  height: 50,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          flex: 9,
                          child: CupertinoTextField(
                            controller: chatController,
                            style: TextStyle(
                                fontSize: 17, color: Color(0xFF093687)),
                            textAlign: TextAlign.left,
                            placeholder: '대화를 입력하세요',
                          )),
                      Expanded(
                          flex: 1,
                          child: CupertinoButton(
                            onPressed: () {
                              handleMyMessage(chatController.text);
                            },
                            child: Icon(
                              Icons.send,
                              //    color: Color(0xFF093687),
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            )));
  }
}

class RemainTime extends StatefulWidget {
  @override
  _RemainTimeState createState() => _RemainTimeState();
}

class _RemainTimeState extends State<RemainTime> {
  int remain = 3600; //남은시간
  var minute = 60;
  var second = 0;

  String outMinute = '';
  String outSecond = '';

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        remain--;
        minute = remain ~/ 60;
        outMinute = minute.toString();
        second = (remain % 60).toInt();
        outSecond = second.toString();
        if (remain == 0) timer.cancel();
        if (minute < 10) {
          outMinute = '0' + outMinute;
        }
        if (second < 10) {
          outSecond = '0' + outSecond;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Flexible(flex: 4, child: Container()),
          Flexible(
              flex: 7,
              child: Row(
                children: <Widget>[
                  Text(
                      '남은 시간 ' +
                          outMinute.toString() +
                          ':' +
                          outSecond.toString(),
                      style: TextStyle(fontSize: 12)),
                  Container(
                    width: 60,
                    margin: EdgeInsets.only(left: 10, top: 1, bottom: 1),
                    padding: EdgeInsets.only(left: 0, right: 3),
                    child: FlatButton(
                      padding: EdgeInsets.only(bottom: 1),
                      onPressed: () {
                        remain = remain + 3600;
                      },
                      child: Text(
                        '연장',
                        style: TextStyle(fontSize: 11),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                          side: BorderSide(color: Colors.black54)),
                      //color: Colors.blue,
                    ),
                  )
                ],
              )),
        ],
      )),
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.type, this.id, this.messageText, this.time});
  final String time;
  final int type; //false가 타인
  final String id;
  final String messageText;

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    if (type == 1) {
      return Container(
        margin: EdgeInsets.only(bottom: 10, right: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Text(
                (time.toString()),
                style: TextStyle(fontSize: 11),
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              constraints: BoxConstraints(maxWidth: 250), //max, min, 유동적 크기
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Color(0xFF00A192),
              ),
              child: Text(messageText,
                  overflow: TextOverflow.clip, //줄넘김
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      );
    } else if (type == 0) {
      return Container(
        margin: EdgeInsets.only(bottom: 10, left: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(cstMap[id]),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  id,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      constraints:
                          BoxConstraints(maxWidth: 250), //max, min, 유동적 크기
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Color(0xFFECECEC),
                      ),

                      child: Text(
                        messageText,
                        overflow: TextOverflow.clip, //줄넘김
                      ),
                    ),
                    Text(
                      (time.toString()), //시간 수정할 것.
                      style: TextStyle(fontSize: 11),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
    } else {
      return Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              margin: EdgeInsets.only(bottom: 5, top: 15),
              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 9),
              child: Text(
                '컨설턴트 ' + id + '님이 입장하셨습니다',
                style: TextStyle(fontSize: 11),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                color: Color(0xFFECECEC),
              )));
    }
  }
}

/* setState 함수가 호출이 되지 않는 이슈로 주석처리 후
Screen과 합병
class InputBox extends StatefulWidget {
  @override
  _InputBoxState createState() => _InputBoxState();
}

class _InputBoxState extends State<InputBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      height: 50,
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 9,
              child: CupertinoTextField(
                style: TextStyle(fontSize: 17, color: Color(0xFF093687)),
                textAlign: TextAlign.left,
                placeholder: '대화를 입력하세요',
              )),
          Expanded(
              flex: 1,
              child: CupertinoButton(
                onPressed: () {
                  //   handleMyMessage('hi');
                },
                child: Icon(
                  Icons.send,
                  //    color: Color(0xFF093687),
                ),
              ))
        ],
      ),
    );
  }
}
*/
/*
    body: Column(
        children: <Widget>[
          Expanded(
            //!--스크롤바 추가하기
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[],
            ),
          ),
          Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 10),
              height: 50,
              decoration: BoxDecoration(
                //container에 side 넣는 법
                border: Border.all(
                    color: Color(0xFF093687), style: BorderStyle.solid),
              ),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextField(
                      style: TextStyle(fontSize: 17, color: Color(0xFF093687)),
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(hintText: '대화를 입력하세요'),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                      ),
                      color: Color(0xFF093687),
                      onPressed: () {})
                ],
              ))
        ],
      ),*/
