import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static const String routeName = '\CategoryScreen';

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  uploadCategory() {
    if (_formkey.currentState!.validate()) {
      print('ok');
    } else {
      print('not really');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Text(
                'Category',
                style: TextStyle(
                    fontSize: 36,
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Divider(
              color: Colors.blueGrey.shade900,
            ),
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Container(
                            height: 140,
                            width: 140,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(),
                            ),
                            child: Center(
                              child: Text('Category'),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange.shade900),
                            onPressed: () {},
                            child: Text(
                              'Upload',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: SizedBox(
                        width: 200,
                        child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter some text';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Type of category',
                              labelStyle:
                                  TextStyle(fontSize: 17, color: Colors.black),
                              hintText: "Enter category",
                            )),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange.shade900),
                      onPressed: () {
                        uploadCategory();
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
