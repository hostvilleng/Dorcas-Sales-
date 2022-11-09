
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:image_picker/image_picker.dart';

//import '../general/allExports.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({Key key}) : super(key: key);

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {

  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {



    return Dialog(
      child: Column(
        children: [
          AppBar(
            elevation: 1,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(color: Colors.black),
            title: Text(
              'Upload Images',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Stack(
                  children: [
                    if(_image !=null)
                      Positioned(
                        right: 0,
                        child: IconButton( icon: Icon(Icons.clear),
                          onPressed: (){
                            setState(() {
                              _image=null;
                            });
                          },),),
                    Container(
                      height: 120,
                      width: MediaQuery. of (context).size.width,
                      child: FittedBox(
                        child: _image == null ? Icon(
                          CupertinoIcons.photo_on_rectangle,
                          color: Colors.grey,
                        ) : Image.file(_image),

                      ),

                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(child:
                    NeumorphicButton(
                      style: NeumorphicStyle(color: Colors.green),
                      onPressed: (){


                      },
                      child: Text('Save', textAlign: TextAlign.center,),

                    ),
                    ),
                    SizedBox(width:10,),
                    Expanded(child:
                    NeumorphicButton(
                      style: NeumorphicStyle(color: Colors.red),
                      onPressed: (){},
                      child: Text('Cancel', textAlign: TextAlign.center,),

                    ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),


                Row(
                  children: [
                    Expanded(child:
                    NeumorphicButton(
                      onPressed: getImage,
                      style: NeumorphicStyle(color: Theme.of(context).primaryColor),
                      child: Text('Upload Image', textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),

                    ),
                    ),
                  ],
                ),

              ],
            ),
          )
        ],

      ),

    );
  }
}
