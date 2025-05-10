import 'dart:io';
import 'package:pharmacy_app/core/services/storage_services.dart';
import 'package:pharmacy_app/core/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:path/path.dart' as b;

class SupabaseStoargeService implements StorageService {
  final  Supabase ? _supabase;

  SupabaseStoargeService(this._supabase);

  Future<void> createBuckets(String bucketName) async {
    var buckets = await _supabase!.client.storage.listBuckets();

    bool isBucketExits = false;

    for (var buckte in buckets) {
      if (buckte.id == bucketName) {
        isBucketExits = true;
        break;
      }
    }
    if (!isBucketExits) {
      await _supabase.client.storage.createBucket(bucketName);
    }
  }

  static initSupabase() async {
      await Supabase.initialize(url: urlSubaBase, anonKey: apiKey);

  }

  @override
  Future<String> uploadFile(File file, String path) async {
    String fileName = b.basename(file.path);
    String extensionName = b.extension(file.path);
    var result = await _supabase!.client.storage
        .from('doctors-images')
        .upload('$path/$fileName.$extensionName', file);

    return result;
  }
}