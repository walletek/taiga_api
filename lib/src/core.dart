/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

Map<String, String> get defaultHeader => {"Content-Type": "application/json"};

class TaigaApi {
  Auth auth;
  Resolver resolver;
  Milestones milestones;

  TaigaApi({ String apiUrl: "https://api.taiga.io/api/v1" }){
    auth = new Auth(apiUrl);
    resolver = new Resolver(apiUrl);
    milestones = new Milestones(apiUrl);

    resolver.auth = auth;
    milestones.auth = auth;
  }
}

abstract class Endpoint {
  String apiUrl;
  String uri;

  String getUrl({Map parameters}) {
    String url = "$apiUrl/$uri";
    if (parameters != null && parameters.isNotEmpty) {
      url += "?";
      parameters.forEach((key, value) {
        url += "${Uri.encodeQueryComponent(key)}=${Uri.encodeQueryComponent(value)}&";
      });
      return url.substring(0, url.length- 1);
    }
   return url;
  }

  Endpoint(this.apiUrl, this.uri);

}

abstract class Authenticator {
  Auth auth;
}