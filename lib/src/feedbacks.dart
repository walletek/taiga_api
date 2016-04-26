/**
 * Created by guitte_a on 26/04/16.
 */

part of taiga_api;

class Feedbacks extends Endpoint with Authenticator {
  Feedbacks(String apiUrl) : super(apiUrl, "feedback");

    Future <num> pushFeedback(String comment) async {
    print (auth.authHeader);
    http.Response response = await http.post(getUrl(),
    body: JSON
    .encode({"comment": comment}),
    headers: auth.authHeader);
    if (response.statusCode != HttpStatus.OK) {
      print({"status": response.statusCode, "body": response.body});
    }
      return response.statusCode;
  }
}
