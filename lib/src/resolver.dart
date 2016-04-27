/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

class Resolver extends CoffeeRequestBehavior {
  Resolver(CoffeeRequester mainRequester) : super ("resolver", new CoffeeHttpRequest("/resolver"), mainRequester) {
    _request["getProjectId"] = new Get("");
    _request["getMilestoneId"] = new Get("");
  }

  Future<num> getProjectId(String name) async {
    CoffeeResponse res = await _request["getProjectId"].execute(queryParameters:{"project": name});
    if (res.statusCode == HttpStatus.OK) {
      return res.decodedBody["project"] as num;
    }
    return null;
  }

  Future<Map> getMilestoneId(String project, String name) async {
      CoffeeResponse res = await _request["getProjectId"].execute(queryParameters: {"project": project, "milestone": name});
      if (res.statusCode == HttpStatus.OK) {
        return res.decodedBody;
      }
      return null;
  }
}
