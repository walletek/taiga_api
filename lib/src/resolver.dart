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
    } else {
      print({ "status": response.statusCode, "body": response.body });
    }
    return null;
  }

  Future<Map> getMilestoneId(String project, String name) async {
    http.Response response = await http
        .get(getUrl(parameters: {"project": project, "milestone": name}), headers: auth.authHeader);
    if (response.statusCode == HttpStatus.OK) {
      return JSON.decode(response.body);
    } else {
      print({ "status": response.statusCode, "body": response.body });
    }
    return null;
  }
}
