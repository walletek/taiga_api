/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

class Milestones extends CoffeeRequestBehavior {
  Milestones(CoffeeRequester mainRequester) : super("milestones", new CoffeeHttpRequest("/milestones"), mainRequester) {
    _request["getById"] = new Get("/{id}");
  }

  Future<Map<String, dynamic>> get(num id) async {
    CoffeeResponse res = await _request["getById"].execute(parameters: {"id": id});
    if (res.statusCode == HttpStatus.OK) {
      return res.decodedBody;
    }
    return null;
  }
}
