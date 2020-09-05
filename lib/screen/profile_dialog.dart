import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hi/screen/home_screen.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

List<String> name = ['김정현', '강혜원', '박시은', '김민수', '박은수'];
List<String> profile = [
  'images/profile1.png',
  'images/profile2.png',
  'images/profile3.png',
  'images/profile4.png',
  'images/profile5.png'
];

Map<String, String> cstMap = Map.fromIterables(name, profile);

//!--final과 var의 정확한 관계를 파악하기
class ProfileDialog extends StatefulWidget {
  ProfileDialog({this.id, this.jobvalue});
  final id;
  final jobvalue;

  @override
  _ProfileDialogState createState() => _ProfileDialogState();
}

class _ProfileDialogState extends State<ProfileDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.5,
          child: Container(
              child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  '컨설턴트 프로필',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ),
              Divider(
                height: 1,
              ),
              profileInfo(),
              bottomButton(),
            ],
          )),
        ));
  }

  Widget profileInfo() {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.all(13),
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      radius: 22,
                      child: Image.asset(
                        'images/profile1.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(widget.id,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25,
                                )),
                            SizedBox(
                              height: 2,
                            ),
                            Text(widget.jobvalue + ''),
                          ],
                        )),
                    Padding(
                      child: resultRating(),
                      padding: EdgeInsets.only(left: 5),
                    )
                  ],
                ),
                Divider(),
                Row(
                  children: <Widget>[
                    Icon(Icons.business_center),
                    Text('\t\t경력 3년'),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.account_box),
                    Text('\t\t자격증 없음'),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    FaIcon(FontAwesomeIcons.trophy),
                    Text('\t\t컨설팅 12회'),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.label),
                    Text('\t\t#진중한, #친절한'),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.border_color),
                    SizedBox(
                      width: 5,
                    ),
                    Flexible(
                      child: Container(
                          child: Text(
                        '"고객님의 든든한 아버지가 되어드리겠습니다!! 감사합니다."',
                        overflow: TextOverflow.clip,
                        softWrap: true,
                      )),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.event_note),
                      Text('\t컨설팅 내역'),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFFECECEC)),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Q. 20대 중반이 리스크없이 투자할 수 있는 상품은 어떤게 있나요?',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text('A. 안정적인 상품일수록..')
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  margin: EdgeInsets.only(top: 3),
                  padding: EdgeInsets.all(10),
                )
              ],
            )));
  }

  Widget resultRating() {
    return SmoothStarRating(
        rating: 4.5,
        isReadOnly: true,
        color: Color(0xFFFEC107),
        borderColor: Colors.grey,
        size: 30,
        filledIconData: Icons.star,
        halfFilledIconData: Icons.star_half,
        defaultIconData: Icons.star_border,
        starCount: 5,
        allowHalfRating: true,
        spacing: 2.0,
        onRated: (value) {
          //lating 넘겨주는 부분

          print("rating value -> $value");
        });
  }

  Widget bottomButton() {
    return Container(
      height: 47,
      padding: EdgeInsets.symmetric(vertical: 5),
      margin: EdgeInsets.only(bottom: 5),
      child: FlatButton(
        color: Color(0xFFECECEC),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.black26, style: BorderStyle.none)),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('닫기'),
      ),
    );
  }
}
