import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class ImageUpload extends StatefulWidget {
  final String? initialImageUrl; // الصورة القديمة

  const ImageUpload({super.key, this.initialImageUrl});

  @override
  ImageUploadState createState() => ImageUploadState();
}

class ImageUploadState extends State<ImageUpload> {
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _pickImage(ImageSource.gallery);
      },
      child: selectedImage != null
          ? ClipRRect(
              borderRadius: BorderRadius.circular(16.sp),
              child: Image.file(
                selectedImage!,
                width: 125.w,
                height: 125.h,
                fit: BoxFit.cover,
              ),
            )
          : widget.initialImageUrl != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(16.sp),
                  child: Image.network(
                    widget.initialImageUrl!,
                    width: 125.w,
                    height: 125.h,
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  width: 125.w,
                  height: 125.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.grey[300],
                  ),
                  child: Icon(Icons.image, size: 50.sp, color: Colors.grey),
                ),
    );
  }
}
