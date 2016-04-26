/**
  * Created by guitte_a on 26/04/16.
  */

part of taiga_api;

class Issues extends Endpoint with Authenticator, ListBehavior {
  Issues(String apiUrl) : super(apiUrl, "issues");

  Future <num> pushIssue(String project, String subject, String description, String type) async {
    http.Response response = await http.post(getUrl(),
    body: JSON
    .encode({"project": project, "subject": subject, "description": description, "tags": type }),
    headers: auth.authHeader);
    if (response.statusCode != HttpStatus.CREATED) {
      print({"status": response.statusCode, "body": response.body});
    }
    return response.statusCode;
  }
}