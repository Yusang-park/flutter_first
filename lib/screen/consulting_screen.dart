import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hi/screen/selectChat_screen.dart';
import 'package:progress_dialog/progress_dialog.dart';

//*************************************************** */
//정보 변수 선언부
final numMinController = TextEditingController();
final numMaxController = TextEditingController();
final moneyMinController = TextEditingController();
final moneyMaxController = TextEditingController();
var careerValue = 1;
var jobValue = '음악';
var licenseValue = '상관 없음';

//************************************************** */

class ConsultingScreen extends StatefulWidget {
  @override
  _ConsultingScreenState createState() => _ConsultingScreenState();
}

class _ConsultingScreenState extends State<ConsultingScreen> {
  ProgressDialog pr;

  // ignore: unused_element
  void _btnClick() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => (SelectChatScreen(
              jobValue: jobValue,
              career: careerValue,
              license: licenseValue,
              moneyMin: moneyMinController.text,
              moneyMax: moneyMaxController.text,
              numMax: numMaxController.text,
              numMin: numMinController.text,
            )),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      isDismissible: false,
      showLogs: true,
    );
    pr.style(
      message: '컨설턴트를 모집하고 있습니다',
    );
    return Scaffold(
        appBar: AppBar(
          title: Text('컨설팅 시작하기'),
          backgroundColor: Color(0xFFF9F9F9),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Text(
                  '1. 컨설팅을 원하는 분야를 선택하세요',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 25), child: JobDropDown()),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Text(
                  '2. 원하는 컨설턴트의 경력을 선택하세요',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.only(left: 25), child: CareerRadio()),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Text(
                  '3. 컨설턴트의 관련 자격증 유뮤를 선택하세요',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: LicenseRadio(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  '4. 컨설턴트의 인원을 선택하세요',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: NumTextField(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: Text(
                  '5. 1인당 지불할 비용의 범위를 입력하세요.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25),
                child: MoneyTextField(),
              ),
              Padding(
                padding: EdgeInsets.all(30),
              ),
              Center(
                child: Container(
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
                      pr.show();
                      Future.delayed(Duration(seconds: 2)).then((value) {
                        pr.hide();
                        _btnClick();
                      });
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
                            'START',
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
              ),
            ],
          ),
        ));
  }
}

class MoneyTextField extends StatefulWidget {
  @override
  _MoneyTextFieldState createState() => _MoneyTextFieldState();
}

class _MoneyTextFieldState extends State<MoneyTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 250,
        //margin: EdgeInsets.only(left: 0, right: 180),
        child: Row(
          children: <Widget>[
            Flexible(
              //      fit: FlexFit.tight,
              child: TextField(
                style: TextStyle(fontSize: 17, color: Color(0xFF093687)),
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: '30000'),
                controller: moneyMinController,
                keyboardType: TextInputType.number,
              ),
            ),
            Text('\t~\t'),
            //     FlatButton()
            Flexible(
              //      fit: FlexFit.tight,
              child: TextField(
                style: TextStyle(fontSize: 17, color: Color(0xFF093687)),
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: '50000'),
                controller: moneyMaxController,
                keyboardType: TextInputType.number,
              ),
            ),
            Text('\t\t\t\t원'),
          ],
        ));
  }
}

class NumTextField extends StatefulWidget {
  @override
  _NumTextFieldState createState() => _NumTextFieldState();
}

class _NumTextFieldState extends State<NumTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: 250,
        //margin: EdgeInsets.only(left: 0, right: 180),
        child: Row(
          children: <Widget>[
            Flexible(
              //      fit: FlexFit.tight,
              child: TextField(
                style: TextStyle(fontSize: 17, color: Color(0xFF093687)),
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: '1'),
                controller: numMinController,
                keyboardType: TextInputType.number,
              ),
            ),
            Text('\t~\t'),
            Flexible(
              //      fit: FlexFit.tight,
              child: TextField(
                style: TextStyle(fontSize: 17, color: Color(0xFF093687)),
                textAlign: TextAlign.center,
                decoration: InputDecoration(hintText: '5'),
                controller: numMaxController,
                keyboardType: TextInputType.number,
              ),
            ),
            Text('\t\t\t\명'),
          ],
        ));
  }
}

/*
class NumDropDown extends StatefulWidget {
  @override
  _NumDropDownState createState() => _NumDropDownState();
}

class _NumDropDownState extends State<NumDropDown> {
  var _value = '1명';
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
      items: <DropdownMenuItem<dynamic>>[
        DropdownMenuItem(
          child: Text('1명'),
          value: '1명',
        ),
        DropdownMenuItem(
          child: Text('2명'),
          value: '2명',
        ),
        DropdownMenuItem(
          child: Text('3명'),
          value: '3명',
        ),
        DropdownMenuItem(child: Text('4명'), value: '4명'),
        DropdownMenuItem(
          child: Text('5명'),
          value: '5명',
        ),
      ],
      value: _value,
    );
  }
}
*/

class LicenseRadio extends StatefulWidget {
  @override
  _LicenseRadioState createState() => _LicenseRadioState();
}

class _LicenseRadioState extends State<LicenseRadio> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Radio(
          activeColor: Color(0xFF093687),
          groupValue: licenseValue,
          onChanged: (value) {
            setState(() {
              licenseValue = value;
            });
          },
          value: '있음',
        ),
        Text('있음'),
        Radio(
          activeColor: Color(0xFF093687),
          groupValue: licenseValue,
          onChanged: (value) {
            setState(() {
              licenseValue = value;
            });
          },
          value: '상관 없음',
        ),
        Text('상관 없음'),
      ],
    );
  }
}

class CareerRadio extends StatefulWidget {
  @override
  _CareerRadioState createState() => _CareerRadioState();
}

class _CareerRadioState extends State<CareerRadio> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5),
        child: DropdownButton(
            items: <DropdownMenuItem<dynamic>>[
              DropdownMenuItem(
                value: 0,
                child: Row(
                  children: <Widget>[
                    Text('경력 무관'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 1,
                child: Row(
                  children: <Widget>[
                    Text('경력 1년 이상'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 2,
                child: Row(
                  children: <Widget>[
                    Text('경력 2년 이상'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 3,
                child: Row(
                  children: <Widget>[
                    Text('경력 3년 이상'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 4,
                child: Row(
                  children: <Widget>[
                    Text('경력 4년 이상'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 5,
                child: Row(
                  children: <Widget>[
                    Text('경력 5년 이상'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: 6,
                child: Row(
                  children: <Widget>[
                    Text('그 이상'),
                  ],
                ),
              ),
            ],
            onChanged: (value) {
              setState(() {
                careerValue = value;
              });
            },
            value: careerValue));
  }
}

class JobDropDown extends StatefulWidget {
  @override
  _JobDropDownState createState() => _JobDropDownState();
}

class _JobDropDownState extends State<JobDropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      items: <DropdownMenuItem<dynamic>>[
        DropdownMenuItem(
          value: '음악',
          child: Row(
            children: <Widget>[
              Icon(
                Icons.headset,
                color: Color(0xFF093687),
              ),
              SizedBox(
                width: 10,
              ),
              Text('음악'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: 'IT/프로그래밍',
          child: Row(
            children: <Widget>[
              Icon(
                Icons.laptop_windows,
                color: Color(0xFF093687),
              ),
              SizedBox(
                width: 10,
              ),
              Text('IT/프로그래밍'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: '법률',
          child: Row(
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.bookOpen,
                color: Color(0xFF093687),
              ),
              SizedBox(
                width: 10,
              ),
              Text('법률'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: '비즈니스',
          child: Row(
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.handshake,
                color: Color(0xFF093687),
              ),
              SizedBox(
                width: 10,
              ),
              Text('비즈니스'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: '재무',
          child: Row(
            children: <Widget>[
              Icon(
                Icons.attach_money,
                color: Color(0xFF093687),
              ),
              SizedBox(
                width: 10,
              ),
              Text('재무'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: '디자인',
          child: Row(
            children: <Widget>[
              Icon(
                Icons.image,
                color: Color(0xFF093687),
              ),
              SizedBox(
                width: 10,
              ),
              Text('디자인'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: '마케팅',
          child: Row(
            children: <Widget>[
              Icon(
                Icons.people_outline,
                color: Color(0xFF093687),
              ),
              SizedBox(
                width: 10,
              ),
              Text('마케팅'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: '여행',
          child: Row(
            children: <Widget>[
              Icon(
                Icons.airplanemode_active,
                color: Color(0xFF093687),
              ),
              SizedBox(
                width: 10,
              ),
              Text('여행'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: '언어',
          child: Row(
            children: <Widget>[
              Icon(
                Icons.g_translate,
                color: Color(0xFF093687),
              ),
              SizedBox(
                width: 10,
              ),
              Text('언어'),
            ],
          ),
        ),
        DropdownMenuItem(
          value: '건강',
          child: Row(
            children: <Widget>[
              Icon(
                Icons.local_hospital,
                color: Color(0xFF093687),
              ),
              SizedBox(
                width: 10,
              ),
              Text('건강'),
            ],
          ),
        ),
      ],
      onChanged: (value) {
        setState(() {
          jobValue = value;
        });
      },
      value: jobValue,
    );
  }
}
