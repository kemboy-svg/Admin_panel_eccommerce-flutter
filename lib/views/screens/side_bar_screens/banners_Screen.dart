import 'package:flutter/material.dart';

class BannerScreen extends StatelessWidget {
   static const String routeName = '\BannerScreen';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              'Banners',
              style: TextStyle(
                  fontSize: 36,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w700),
            ),
          ),
          Divider(color: Colors.blueGrey.shade900,),

          Row(children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 140,
                width: 140,
                decoration: BoxDecoration(color: Colors.grey.shade400, borderRadius: BorderRadius.circular(14),border: Border.all(),),
                child: Center(
                  child: Text('Banners'),
                ),
              ),
            )
          ],)
        ],
      ),
    );
  }
}