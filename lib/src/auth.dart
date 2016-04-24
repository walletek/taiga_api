/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

class Auth extends Endpoint {

    Map<String, dynamic> _authResponse;
    String get authToken => _authResponse != null ? _authResponse["auth_token"] : null;

    Map<String, String> get authHeader =>
        defaultHeader..addAll({"Authorization": "Bearer $authToken"});

    Auth(String apiUrl) : super(apiUrl, "auth");

    login(String username, String password, {String type: "normal"}) async {
        http.Response response = await http.post(getUrl(),
            body: JSON.encode({"type": type, "password": password, "username": username}), headers: defaultHeader);
        if (response.statusCode == HttpStatus.OK) {
            _authResponse = JSON.decode(response.body);
        }
        return response;
    }

}