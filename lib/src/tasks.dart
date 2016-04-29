/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

class Tasks extends CoffeeRequestBehavior with ListBehavior {
  Get get _listRequest => _request["list"];
  Tasks(CoffeeRequester mainRequester) : super("tasks", new CoffeeHttpRequest("/tasks"), mainRequester) {
    _request["list"] = new Get("");
  }
}
