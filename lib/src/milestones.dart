/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

class Milestones extends Endpoint with Authenticator {

    Milestones(String apiUrl) : super(apiUrl, "milestones");

    Future<List> list() async {
        http.Response response = await http.get(getUrl(), headers: auth.authHeader);
        if (response.statusCode == HttpStatus.OK) {
            return JSON.decode(response.body) as List<Map>;
        }
        return null;
    }


}