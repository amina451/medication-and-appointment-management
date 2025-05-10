import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/errors/faliure.dart';
import 'package:pharmacy_app/core/repo/images_repo.dart';
import 'package:pharmacy_app/core/services/storage_services.dart';

class ImagesRepoImpl implements ImagesRepo {
  final StorageService stoarageService;

  ImagesRepoImpl(this.stoarageService);
  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url =
          await stoarageService.uploadFile(image, "images");
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure(messages:   'Failed to uoload image'),
      );
    }
  }
}
