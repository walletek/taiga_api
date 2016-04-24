/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

class Users extends Endpoint with Authenticator, ListBehavior {
    Users(String apiUrl) : super(apiUrl, "users");
}