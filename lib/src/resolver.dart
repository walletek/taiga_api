/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

class Resolver extends Endpoint with Authenticator {
  Resolver(String apiUrl) : super(apiUrl, "resolver");

  Future<num> getProjectId(String name) async {
    http.Response response = await http
        .get(getUrl(parameters: {"project": name}), headers: auth.authHeader);
    if (response.statusCode == HttpStatus.OK) {
      Map body = JSON.decode(response.body);
      return body["project"] as num;
    }
    return null;
  }
}
