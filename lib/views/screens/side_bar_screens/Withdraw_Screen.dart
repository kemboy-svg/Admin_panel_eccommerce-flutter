import 'package:flutter/material.dart';

class WithdrawScreen extends StatelessWidget {
  static const String routeName = '\WithdrawScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topLeft,
        padding: EdgeInsets.all(10),
        child: Text(
          'Withdrawals',
          style: TextStyle(
              fontSize: 36,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
