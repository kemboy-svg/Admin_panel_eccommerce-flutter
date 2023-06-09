import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  static const String routeName = '\CategoryScreen';

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  FirebaseStorage _storage = FirebaseStorage.instance;

  String? fileName;

  dynamic _image;

  late String CategoryName;

  PickCategoryImage() async {
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

  uploadCategory() async {
    if (_formkey.currentState!.validate()) {
      String imageUrl = await uploadCategoryImageToStorage(_image);
    } else {
      print('not really');
    }
  }

  uploadCategoryImageToStorage(dynamic image) async {
    Reference ref = _storage.ref().child('category/$fileName');
    UploadTask uploadTask = ref.putData(image!);

    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
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
                            child: _image != null
                                ? Image.memory(
                                    _image,
                                    fit: BoxFit.cover,
                                  )
                                : Center(
                                    child: Text('Category'),
                                  ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange.shade900),
                            onPressed: () {
                              PickCategoryImage();
                            },
                            child: Text(
                              'Upload Image',
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
                            onChanged: (value) {
                              CategoryName = value;
                            },
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
