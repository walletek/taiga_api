/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

abstract class ListBehavior implements Endpoint, Authenticator {

    Future<List> list({Map parameters}) async {
        http.Response response = await http.get(getUrl(parameters: parameters), headers: auth.authHeader);
        if (response.statusCode == HttpStatus.OK) {
            return JSON.decode(response.body) as List<Map>;
        }
        return null;
    }

}