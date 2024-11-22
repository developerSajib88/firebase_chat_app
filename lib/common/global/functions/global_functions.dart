import 'dart:io';
import 'dart:math';

import 'package:feature_first/utils/styles/color_palates.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class GlobalFunctions {

  static String generateRandomUserId() {
    return (100000 + Random().nextInt(900000)).toString();
  }


  static Future<File?> pickProfileImage()async{
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(image != null){
      CroppedFile? cropImage = await ImageCropper().cropImage(
        sourcePath: image.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: "Image Crop",
            toolbarColor: ColorPalates.primary,
            toolbarWidgetColor: Colors.white,
            cropStyle: CropStyle.circle,
            aspectRatioPresets: [
              CropAspectRatioPreset.original,
            ],
          ),

        ],
      );

      if(cropImage != null) return File(cropImage.path);
    }
    return null;

  }


}