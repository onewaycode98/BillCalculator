import 'package:bill_calculator/colors.dart';
import 'package:bill_calculator/widgets/clear_button.dart';
import 'package:flutter/material.dart';
import 'package:bill_calculator/style.dart';
import 'package:bill_calculator/widgets/toggle_buttons.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String eachPayText = '--';
  String tipTotalText = '--';
  String tipEachText = '--';
  TextEditingController amountValue = TextEditingController();
  int splitBetween = 2;
  int tip;
  bool showCursor = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Split/Bill'),
        backgroundColor: kFirstColor,
      ),
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(
            left: 20.0, right: 20.0, top: 30.0, bottom: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: kSecondColor,
                    borderRadius: BorderRadius.circular(10.0)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Each Pay:',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            eachPayText,
                            style: TextStyle(
                                letterSpacing: 0,
                                color: Colors.white,
                                fontSize: 45.0,
                                fontWeight: FontWeight.w300),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 30.0,
                      ),
                      Container(
                        width: 200.0,
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Tip total: ',
                                  style: kTextStyleBold,
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  'Tip Each: ',
                                  style: kTextStyleBold,
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  'Split between: ',
                                  style: kTextStyleBold,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  tipTotalText,
                                  style: kTextStyleLight,
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  tipEachText,
                                  style: kTextStyleLight,
                                ),
                                SizedBox(height: 5.0),
                                Text(
                                  '$splitBetween people',
                                  style: kTextStyleLight,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Bill Amount',
                          style: kTextStyleBoldDark,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        TextField(
                          onTap: () {
                            setState(() {
                              showCursor = true;
                            });
                          },
                          controller: amountValue,
                          maxLength: 6,
                          inputFormatters: [
                            WhitelistingTextInputFormatter(RegExp("[,0-9]"))
                          ],
                          keyboardType:
                              TextInputType.numberWithOptions(decimal: true),
                          cursorColor: kFirstColor,
                          showCursor: showCursor,
                          decoration: InputDecoration(
                              counterText: '',
                              // contentPadding:
                              //     EdgeInsets.symmetric(horizontal: 0),
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(15),
                                child: Text(
                                  '\$',
                                  style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 50.0),
                                ),
                              ),
                              border: InputBorder.none,
                              hintText: '16,214'),
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 50.0,
                              fontWeight: FontWeight.w300),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.grey[300],
                        ),
                        SizedBox(height: 35.0),
                        Row(
                          children: <Widget>[
                            Container(
                              height: 100.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'Tip',
                                    style: kTextStyleBoldDark,
                                  ),
                                  SizedBox(height: 15.0),
                                  ToggleButton(),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 35.0),
                        Container(
                          width: double.infinity,
                          height: 1.0,
                          color: Colors.grey[300],
                        ),
                        SizedBox(
                          height: 35.0,
                        ),
                        Text(
                          'Split between',
                          style: kTextStyleBoldDark,
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.people_outline,
                              color: kFirstColor,
                              size: 30.0,
                            ),
                            Container(
                              width: 220.0,
                              child: Slider(
                                value: splitBetween.toDouble(),
                                activeColor: kSecondColor,
                                inactiveColor: Colors.grey.shade200,
                                min: 1,
                                max: 8,
                                onChanged: (double newValue) {
                                  setState(() {
                                    splitBetween = newValue.toInt();
                                  });
                                },
                              ),
                            ),
                            Text(
                              splitBetween.toString(),
                              style: TextStyle(
                                  letterSpacing: 0,
                                  color: Colors.black87,
                                  fontSize: 34.0,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: 182.0,
                      height: 50.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: RaisedButton(
                        elevation: 0.3,
                        onPressed: () {
                          setState(() {
                            amountValue.clear();
                            splitBetween = 2;
                            showCursor = false;
                          });
                        },
                        color: Colors.white,
                        child: Text(
                          'Clear Bill',
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 182.0,
                      height: 50.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      child: RaisedButton(
                        elevation: 0.3,
                        onPressed: () {
                          print(amountValue.text);
                        },
                        color: kFirstColor,
                        child: Text(
                          'Calculate',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
