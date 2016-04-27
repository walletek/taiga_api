/**
 * Created by guitte_a on 26/04/16.
 */

part of taiga_api;

class Feedbacks extends CoffeeRequestBehavior {
  Feedbacks(CoffeeRequester mainRequester) : super("feedback", new CoffeeHttpRequest("/feedback"), mainRequester) {
    _request["push"] = new Post("");
  }

  Future<num> pushFeedback(String comment) async {
    CoffeeResponse res = await _request["push"].execute(body: {"comment": comment});
    return res.statusCode;
  }
}
