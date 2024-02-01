import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

Future<Uint8List?> pickImageFromDevice() async {
  Uint8List? image = await pickImageFromMobile();
  if (image != null) {
    return image;
  }
  return null;
}

Future<Uint8List?> pickImageFromMobile() async {
  XFile? xFile;
  final ImagePicker imagePicker = ImagePicker();
  xFile = await imagePicker.pickImage(source: ImageSource.gallery);
  if (xFile != null) {
    return await xFile.readAsBytes();
  }
  return null;
}
