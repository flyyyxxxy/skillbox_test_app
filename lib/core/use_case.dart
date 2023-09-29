abstract class AsyncUsecase<REQUEST, RESPONSE> {
  Future<RESPONSE> execute(REQUEST? params);
}

abstract class SyncUsecase<Type, Params> {
  Type call(Params params);
}

class NoParams {}

class UseCaseFailure {
  String? errorMessage;
  UseCaseFailure({this.errorMessage});
}
