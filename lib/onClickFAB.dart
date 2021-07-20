import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class OnClickFAB extends StatefulWidget {
  @override
  _OnClickFABState createState() => _OnClickFABState();
}

class _OnClickFABState extends State<OnClickFAB> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  String title = "";
  String desc = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF00b9f5),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Add Items',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 23,
              ),
            ),
          ],
        ),
      ),
      body: Align(
        alignment: Alignment.center,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: 340,
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 45,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 200,
                  width: 360,
                  child: _image == null ? Center(
                    child: RawMaterialButton(
                      fillColor: Color(0x8000b9f5),
                      constraints: BoxConstraints(
                        minWidth: 150,
                        minHeight: 40,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0)),
                      child: Text('Click to add picture'),
                      onPressed: getImage,
                    ),
                  )
                  : Image.file(_image),
                  decoration: BoxDecoration(
                    color: Color(0x5400b9f5),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              TextField(
                maxLength: 40,
                onChanged: (text) {
                  title = text;
                },
                decoration: InputDecoration(
                  labelText: 'Object',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                maxLines: 6,
                onChanged: (text) {
                  desc = text;
                },
                decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: RawMaterialButton(
                  fillColor: Color(0xFF00b9f5),
                  constraints: BoxConstraints(
                    minWidth: 100,
                    minHeight: 50,
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {},
                  child: Text(
                    'Done',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
