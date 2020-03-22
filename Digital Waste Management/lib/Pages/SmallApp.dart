import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'dart:io';

class smallapp extends StatefulWidget {
  @override
  _smallappState createState() => _smallappState();
}

class _smallappState extends State<smallapp> {
  File _image;
  @override
  Widget build(BuildContext context) {

    Future getImage() async{
      var image= await ImagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _image=image;
      });
    }

    Future uploadPic(BuildContext context) async{
      String fileName=basename(_image.path);
      StorageReference firebaseStorageRef=FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask=firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot= await uploadTask.onComplete;
      setState(() {
        print('Picture Uploaded');
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('Picture Uploaded')));

      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('Small Appliances'),

      ),
      body: Builder(
        builder: (context)=> Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                        radius: 100,
                        backgroundColor: Color(100),
                        child: ClipRect(
                          child: SizedBox(
                            width: 800.0,
                            height: 200.0,
                            child: (_image != null)?Image.file(_image,fit:BoxFit.fill)
                                :Image.asset(
                              "assets/images/uploadimage.png",
                              fit: BoxFit.fill,

                            ),
                          ),
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.camera,
                        size: 30.0,
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  )
                ],
              ),
              SizedBox(height: 50,),
              RaisedButton(
                onPressed: () {
                  uploadPic(context);
                },
                child: Text('Submit'),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
