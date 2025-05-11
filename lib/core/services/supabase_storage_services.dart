import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ImageUploadHelper {
  final picker = ImagePicker();
  final supabase = Supabase.instance.client;
  

  Future<File?> pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    return picked != null ? File(picked.path) : null;
  }

  Future<String?> uploadImage(File file, String bucketName,) async {
    final fileExt = file.path.split('.').last;
    final fileName = '${DateTime.now().millisecondsSinceEpoch}.$fileExt';
    final filePath = 'uploads/$fileName';   

    try {
      final bytes = await file.readAsBytes();

      await supabase.storage.from(bucketName).uploadBinary(
        filePath,
        bytes,
        fileOptions: const FileOptions(upsert: true),
      );

      final publicUrl = supabase.storage.from(bucketName).getPublicUrl(filePath);
      return publicUrl;
    } catch (e) {
      print("Upload Error: $e");
      return null;
    }
  }
}
