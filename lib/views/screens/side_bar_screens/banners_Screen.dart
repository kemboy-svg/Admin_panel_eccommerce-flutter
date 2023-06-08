

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class BannerScreen extends StatefulWidget {
  static const String routeName = '\BannerScreen';

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  dynamic _image;

  PickBannerImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
      });
    } else {
      // The user did not pick  the image
    }
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
              'Banners',
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
                            child: Text('Banners'),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange.shade900),
                          onPressed: () {
                            PickBannerImage();
                          },
                          child: Text(
                            'Upload',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade900),
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
