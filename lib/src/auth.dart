/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

class Auth {

    Map<String, dynamic> _authResponse;

    String uri = "auth";
    static String authToken;

    login(String username, String password, {String type: "normal"}) async {
        http.Response response = await http.post("$apiUrl/$uri",
            body: {"type": type, "password": password, "username": username}, headers: defaultHeader);
        if (response.statusCode == HttpStatus.OK) {
            _authResponse = JSON.decode(response.body);
            authToken = _authResponse["auth_token"];
        }
        return response;
    }

}