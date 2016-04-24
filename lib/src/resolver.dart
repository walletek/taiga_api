/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

class Resolver {
  String uri = "resolver";

  Future<num> getProjectId(String name) async {
    http.Response response = await http.get(
        "$apiUrl/$uri?project=${Uri.encodeComponent(name)}",
        headers: authHeader);
    if (response.statusCode == HttpStatus.OK) {
      Map body = JSON.decode(response.body);
      return body["project"] as num;
    }
    return null;
  }
}
