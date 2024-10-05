class Failure {
  final String errorMessage;
  const Failure(this.errorMessage);
}

class NetworkFailure extends Failure {
  NetworkFailure(super.errorMessage);
}
