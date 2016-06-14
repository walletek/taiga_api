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

  Future<num> pushIssue(String project, String subject,
      {String description,
      String type,
      String assignedTo,
      String blockedNote,
      bool isBlocked,
      bool isClosed,
      String milestone,
      String status,
      String severity,
      String priority,
      List<String> tags,
      List<String> watchers}) async {
    CoffeeResponse res = await _request["push"].execute(body: {
      "project": project,
      "subject": subject,
      "description": description,
      "type": type,
      "assigned_to": assignedTo,
      "blocked_note": blockedNote,
      "is_blocked": isBlocked,
      "is_closed": isClosed,
      "milestone": milestone,
      "status": status,
      "severity": priority,
      "tags": tags,
      "watchers": watchers
    });
    return res.statusCode;
  }
}
