/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

class Milestones extends Endpoint with Authenticator {

    Milestones(String apiUrl) : super(apiUrl, "milestones");


}