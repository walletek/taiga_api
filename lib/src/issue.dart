/**
 * Created by guitte_a on 26/04/16.
 */

part of taiga_api;

class TaigaIssue {
  bool isBlocked;
  bool isVoter;
  bool isWatcher;
  bool isClosed;

  String comment;
  String blockedNoteHtml;
  String description_html;
  String blockedNote;
  String subject;
  String description;
  List<String> tags;

  int totalVoter;
  int id;
  int version;
  int ref;
  int owner;
  int status;
  int severity;
  int priority;
  int type;
  int milestone;
  int project;
  int assignedTo;
  List<int> watchers;
  List<int> generatedUserStories;

  DateTime createdDate;
  DateTime modifiedDate;
  DateTime finishedDate;

  Map<String, dynamic> neighbors;
  Map<String, dynamic> previous;
  Map<String, dynamic> statusExtraInfo;
  Map<String, dynamic> assignedToExtraInfo;
  Map<String, dynamic> ownerExtraInfo;

  TaigaIssue.fromMap(Map data) {
    watchers = data["watchers"];
    generatedUserStories = data["generated_user_stories"];
    assignedTo = data["assigned_to"];
    project = data["project"];
    milestone = data["milestone"];
    type = data["type"];
    priority = data["priority"];
    severity = data["severity"];
    status = data["status"];
    totalVoter = data["total_voter"];
    id = data["id"];
    version = data["version"];
    ref = data["ref"];
    owner = data["owner"];

    isBlocked = data["is_blocked"];
    isVoter = data["is_voter"];
    isWatcher = data["is_watcher"];
    isClosed = data["is_closed"];

    comment = data["comment"];
    blockedNoteHtml = data["blocked_note_html"];
    description_html = data["description_html"];
    blockedNote = data["blocked_note"];
    subject = data["subject"];
    description = data["description"];
    tags = data["tags"];

    if (data["created_date"] != null) {
      createdDate = DateTime.parse(data["created_date"]);
    }
    if (data["modified_date"] != null) {
      modifiedDate = DateTime.parse(data["modified_date"]);
    }
    if (data["finished_date"] != null) {
      finishedDate = DateTime.parse(data["finished_date"]);
    }
    neighbors = data["neighbors"];
    previous = data["previous"];
    statusExtraInfo = data["status_extra_info"];
    assignedToExtraInfo = data["assigned_to_extra_info"];
    ownerExtraInfo = data["owner_extra_info"];
  }

  static dynamic decode(dynamic data) {
    if (data is List) {
      return data.map((Map issue) => TaigaIssue.decode(issue)).toList() as List<TaigaIssue>;
    }
    if (data is Map) {
      return new TaigaIssue.fromMap(data);
    }
  }
}

class Issues extends CoffeeRequestBehavior with ListBehavior {
  Get get _listRequest => _request["list"];

  Issues(CoffeeRequester mainRequester) : super("issues", new CoffeeHttpRequest("/issues"), mainRequester) {
    _request["push"] = new Post("", decoder: TaigaIssue.decode);
    _request["list"] = new Get("");
  }

  Future<TaigaIssue> pushIssue(int project, String subject,
      {String description,
      int type,
      int assignedTo,
      String blockedNote,
      bool isBlocked: false,
      bool isClosed: false,
      int milestone,
      int status,
      int severity,
      int priority,
      List<String> tags: const [],
      List<int> watchers: const []}) async {
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
    if (!res.isSuccessful) {
      throw "TaigaError: ${res.statusCode} : ${res.body}";
    }
    return res.decodedBody;
  }
}
