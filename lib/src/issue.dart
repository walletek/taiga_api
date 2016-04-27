/**
  * Created by guitte_a on 26/04/16.
  */

part of taiga_api;

class Issues extends CoffeeRequestBehavior with ListBehavior {
Get get _listRequest => _request["list"];

  Issues(CoffeeRequester mainRequester) : super("issues", new CoffeeHttpRequest("/issues"), mainRequester) {
    _request["push"] = new Post("");
    _request["list"] = new Get("");
  }

  Future<num> pushIssue(String project, String subject, String description, String type) async {
    CoffeeResponse res = await _request["push"]
        .execute(body: {"project": project, "subject": subject, "description": description, "tags": type});
    return res.statusCode;
  }
}
