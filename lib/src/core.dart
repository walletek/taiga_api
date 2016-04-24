/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

String get apiUrl => "https://api.taiga.io/api/v1";

Map<String, String> get defaultHeader => {"Content-Type": "application/json"};
Map<String, String> get authHeader =>
    defaultHeader..addAll({"Authorization": "Bearer ${Auth.authToken}"});

class TaigaApi {
  Auth auth;
  Resolver resolver;

  TaigaApi() {
    auth = new Auth();
    resolver = new Resolver();
  }
}
