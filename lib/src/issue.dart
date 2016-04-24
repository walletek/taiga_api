/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

class Issues extends Endpoint with Authenticator, ListBehavior {
    Issues(String apiUrl) : super(apiUrl, "issues");

}