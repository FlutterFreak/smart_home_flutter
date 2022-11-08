import 'dart:async';

import 'package:chopper/chopper.dart';

class Interceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) {
    final Request modified = Request(
      request.method,
      request.path,
      request.origin,
      body: request.body,
      headers: request.headers,
      multipart: request.multipart,
      parameters: request.parameters,
      parts: request.parts,
    );
    return modified;
  }
}
