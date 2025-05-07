abstract class Failure {
  final String? messages;

  Failure({required this.messages});
}

class ServerFailure extends Failure {
  ServerFailure( {required super.messages});
}