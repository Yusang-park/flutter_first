import 'package:flutter/material.dart';
import 'package:hi/main.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:fluid_slider/fluid_slider.dart';

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
class AssessDialog extends StatefulWidget {
  AssessDialog({
    this.cstlist,
    this.moneyMax,
    this.moneyMin,
  });

  final moneyMax;
  final moneyMin;
  final List<String> cstlist;

  @override
  _AssessDialogState createState() => _AssessDialogState();
}

class _AssessDialogState extends State<AssessDialog> {
  final List<AssessCst> _profileCst = [];
  //클래스밖에 있으면 유지가 되고, 클래스 내부에 있으면 창이 닫히면 소멸한다.
  bool _trigger = false;
  @override
  void initState() {
    super.initState();
    print(widget.cstlist.length);
    if (_trigger == false) {
      _trigger = true;
      for (int i = 0; i < widget.cstlist.length; i++) {
        _profileCst.insert(
            0,
            AssessCst(
              id: widget.cstlist[i],
              moneyMax: widget.moneyMax,
              moneyMin: widget.moneyMin,
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height / 1.3,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  '컨설팅은 만족스러우셨나요?\n컨설턴트를 평가하고 비용을 분배하세요!',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              Divider(),
              Expanded(
                  child: ListView.builder(
                itemBuilder: (context, index) => _profileCst[index],
                itemCount: _profileCst.length,
              )),
              Container(
                  alignment: Alignment.center,
                  height: 47,
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: FlatButton(
                    color: Color(0xFFECECEC),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                        side: BorderSide(
                            color: Colors.black26, style: BorderStyle.none)),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (context) => MainApp()),
                          (route) => false);
                    },
                    child: Text(
                      '확인',
                      style: TextStyle(color: Colors.black),
                    ),
                  ))
            ],
          ),
        ));
  }
}

class AssessCst extends StatefulWidget {
  AssessCst({this.id, this.moneyMax, this.moneyMin});
  final id;
  final moneyMax;
  final moneyMin;

  @override
  _AssessCstState createState() => _AssessCstState();
}

class _AssessCstState extends State<AssessCst> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 10, right: 10),
        padding: EdgeInsets.only(top: 10, bottom: 9, left: 10, right: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Color(0xFFECECEC)),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Image.asset(cstMap[widget.id]),
                    Text(
                      widget.id,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Stack(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        child: starRating(),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Slider(
                        moneyMax: widget.moneyMax,
                        moneyMin: widget.moneyMin,
                      ),
                    )
                  ],
                ))
              ],
            ),
            Divider(
              height: 1,
              color: Colors.transparent,
            ),
          ],
        ));
  }
}

Widget starRating() {
  return SmoothStarRating(
      rating: 5,
      isReadOnly: false,
      color: Color(0xFFFEC107),
      borderColor: Colors.black,
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

class Slider extends StatefulWidget {
  Slider({this.moneyMax, this.moneyMin});

  final moneyMax;
  final moneyMin;

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  var _result;
  @override
  void initState() {
    super.initState();
    _result = int.parse(widget.moneyMin);
  }

  @override
  Widget build(BuildContext context) {
    var _gap = int.parse(widget.moneyMax) - int.parse(widget.moneyMin);
    var _value = 0;

    void reload(var value) {
      setState(() {
        _value = value;
        _result = (int.parse(widget.moneyMin) + (_gap / 100 * _value)).toInt();
      });
    }

    return Column(children: <Widget>[
      FluidSlider(
        min: 0,
        max: 100,
        sliderColor: Colors.indigo,
        textColor: Colors.white,
        onValue: (value) => {
          reload(value),
        },
        onSlide: (value) => {
          reload(value),
        },
      ),
      SizedBox(
        height: 5,
      ),
      Align(
        alignment: Alignment.centerRight,
        child: Text(
          '지불 금액 : ' + _result.toString() + ' 원',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    ]);
  }
}
