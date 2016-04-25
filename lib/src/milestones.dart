/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

class Milestones extends Endpoint with Authenticator, ListBehavior {
    Milestones(String apiUrl) : super(apiUrl, "milestones");

    Future<Map> get(num id) async {
        http.Response response = await http.get("${getUrl()}/$id", headers: auth.authHeader);
        if (response.statusCode == HttpStatus.OK) {
            return JSON.decode(response.body) as Map;
        } else {
            print(response);
        }
        return null;
    }
}