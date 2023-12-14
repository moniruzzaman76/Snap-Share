import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../utils/constant.dart';
import '../widget/upload_photo_alert_dialog.dart';

class UploadUserPhotoScreen extends StatefulWidget {
  const UploadUserPhotoScreen({super.key});

  @override
  State<UploadUserPhotoScreen> createState() => _UploadUserPhotoScreenState();
}

class _UploadUserPhotoScreenState extends State<UploadUserPhotoScreen> {



 @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
    uploadPhotoAlertDialog(context);
    });
  }


  @override
  Widget build(BuildContext context) {
    return  const Scaffold();
  }



}

