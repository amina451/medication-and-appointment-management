import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:pharmacy_app/core/errors/faliure.dart';

abstract class ImagesRepo 
{
  Future<Either<Failure, String>> uploadImage(File image);
}