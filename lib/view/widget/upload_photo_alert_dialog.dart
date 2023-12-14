import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/constant.dart';

Uint8List? _profileImage;

Future<void> uploadPhotoAlertDialog(BuildContext context) async{

  return showDialog(
      context: context,
      builder: (context){
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
          ),
          child: SizedBox(
            height: 200,
            child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Select from',style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              selectImageFromCamera();
                            },
                            child: const Image(image:AssetImage(Constant.uploadImageFromCameraPNG),
                              height: 100,width: 100,
                              fit: BoxFit.fill,),
                          ),
                          GestureDetector(
                            onTap: (){
                              selectImageFromGallery();
                            },
                            child: const Image(image:AssetImage(Constant.uploadImageFromGalleryPNG),
                                height: 100,width: 100,
                                fit: BoxFit.fill),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Camera"),
                          Text("Gallery")
                        ],
                      ),
                    ]
                )
            ),
          ),
        );
      }
  );


}
Future<void> selectImageFromCamera() async {
  ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: ImageSource.camera);

  if (_file != null) {
    Uint8List image = await _file.readAsBytes();
    // setState(() {
    // });
    _profileImage = image;

  }
}
Future<void> selectImageFromGallery() async {
  ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: ImageSource.gallery);

  if (_file != null) {
    Uint8List image = await _file.readAsBytes();
    // setState(() {
    // });
    _profileImage = image;

  }
}