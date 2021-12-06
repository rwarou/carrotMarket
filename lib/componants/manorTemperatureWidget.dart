import 'package:flutter/material.dart';

class ManorTemperature extends StatelessWidget {
  double manorTemp;
  int level;
  ManorTemperature({Key key, this.manorTemp}) {
    _calcTempLevel();
  }

  void _calcTempLevel() {
    if (manorTemp <= 20) {
      level = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
