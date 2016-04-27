/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

class Users extends CoffeeRequestBehavior with ListBehavior {
Get get _listRequest => _request["list"];

    Users(CoffeeRequester mainRequester) : super ("users", new CoffeeHttpRequest("/users"), mainRequester) {
         _request["list"] = new Get("");
    }
}
