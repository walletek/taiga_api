/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

class Auth extends CoffeeRequestBehavior {
  Auth(CoffeeRequester mainRequester) : super("auth", new CoffeeHttpRequest("/auth"), mainRequester) {
    _request["login"] = new Post("");
  }

  Future<Map> login(String username, String password, {String type: "normal"}) async {
    CoffeeResponse res =
        await _request["login"].execute(body: {"type": type, "password": password, "username": username});
    if (res.statusCode == HttpStatus.OK) {
      AuthMiddleware._authResponse = res.decodedBody;
      return AuthMiddleware._authResponse;
    }
    return null;
  }
}

class AuthMiddleware extends CoffeeMiddleware {
  static Map<String, dynamic> _authResponse;

  String get authToken => _authResponse != null ? _authResponse["auth_token"] : null;

  CoffeeRequest pre(CoffeeRequest req) {
    if (authToken != null) {
      req.headers["Authorization"] = "Bearer $authToken";
    }
    return req;
  }
}
