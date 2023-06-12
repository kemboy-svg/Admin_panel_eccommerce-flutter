import 'package:flutter/material.dart';

class VendorScreen extends StatelessWidget {
  static const String routeName = '\VendorScreen';

  Widget _rowHeader(String text, int flex) {
    return Expanded(
      flex: flex,
        child: Container(
      decoration:
          BoxDecoration(border: Border.all(color: Color.fromARGB(255, 247, 211, 211)),
          color: const Color.fromARGB(255, 13, 150, 218),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
          ),
    )
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              'Vendors',
              style: TextStyle(
                  fontSize: 36,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Row(
            children: [
          _rowHeader('Logo', 1),
          _rowHeader('Business Name', 3),
          _rowHeader('City', 2),
          _rowHeader('State', 2),
          _rowHeader('Action', 1),
          _rowHeader('View more', 1),
            ],
          ),

        ],
      ),
    );
  }
}
