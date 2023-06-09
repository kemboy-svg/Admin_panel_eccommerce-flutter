import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class BannerScreen extends StatefulWidget {
  static const String routeName = '\BannerScreen';

  @override
  State<BannerScreen> createState() => _BannerScreenState();
}

class _BannerScreenState extends State<BannerScreen> {
  dynamic _image;

  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  String? fileName;

  PickBannerImage() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowMultiple: false, type: FileType.image);

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    } else {
      // The user did not pick  the image
    }
  }

  uploadImageToBanners(dynamic image) async {
    Reference ref = _storage.ref().child('Banners').child(fileName!);
    UploadTask uploadTask = ref.putData(_image!);

    TaskSnapshot snapshot = await uploadTask;
    String downloadurl = await snapshot.ref.getDownloadURL();
    return downloadurl;
  }

  upLoadImageTocloudFirestore() async {
    EasyLoading.show();
    if (_image != null) {
      String imageUrl = await uploadImageToBanners(_image);
      await _firestore
          .collection('banners')
          .doc(fileName)
          .set({'image': imageUrl}).whenComplete(() => EasyLoading.dismiss());
      setState(() {
        _image = null;
      });
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
                          child: _image != null
                              ? Image.memory(
                                  _image,
                                  fit: BoxFit.cover,
                                )
                              : Center(
                                  child: Text('Banner'),
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
                    onPressed: () {
                      upLoadImageTocloudFirestore();
                    },
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
