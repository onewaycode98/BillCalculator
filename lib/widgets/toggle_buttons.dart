import 'package:flutter/material.dart';
import 'package:bill_calculator/colors.dart';

class ToggleButton extends StatefulWidget {
  List<bool> isSelected;
  static List<int> tipsToCalculate = [0];
  // int tipsAmount;
  ToggleButton({this.isSelected});

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  List<int> amountTip = [0, 10, 15, 20];
  int indexButton;
  Color textColor = Colors.grey[400];
  int tipsAmount;

  void selectedButtonsToggle(index) {
    for (indexButton = 0;
        indexButton < widget.isSelected.length;
        indexButton++) {
      if (indexButton == index) {
        widget.isSelected[indexButton] = !widget.isSelected[indexButton];
        // return amountTip[index];
      } else {
        widget.isSelected[indexButton] = false;
      }
    }
  }

  List<int> selectedTip(index) {
    for (indexButton = 0;
        indexButton < widget.isSelected.length;
        indexButton++) {
      if (indexButton == index) {
        tipsAmount = amountTip[index];
        ToggleButton.tipsToCalculate.add(tipsAmount);
        return ToggleButton.tipsToCalculate;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ToggleButtons(
        // borderRadius: BorderRadius.circular(5.0),
        borderColor: Colors.grey[200],
        selectedBorderColor: kFirstColor,
        color: Colors.grey.shade400,
        selectedColor: Colors.white,
        isSelected: widget.isSelected,
        borderWidth: 2.0,
        fillColor: kFirstColor,
        // focusNodes: focusToggle,
        children: <Widget>[
          Container(
              width: (MediaQuery.of(context).size.width) / 6,
              child: Text(
                "0%",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  letterSpacing: -0.5,
                ),
              )),
          Container(
              width: (MediaQuery.of(context).size.width) / 6,
              child: Text(
                "10%",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  letterSpacing: -0.5,
                ),
              )),
          Container(
              width: (MediaQuery.of(context).size.width) / 6,
              child: Text(
                "15%",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  letterSpacing: -0.5,
                ),
              )),
          Container(
              width: (MediaQuery.of(context).size.width) / 6,
              child: Text(
                "20%",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16.0,
                  letterSpacing: -0.5,
                ),
              )),
        ],
        onPressed: (int index) {
          setState(() {
            selectedButtonsToggle(index);
            selectedTip(index);
          });
        },
      ),
    );
  }
}
