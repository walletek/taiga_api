/**
 * Created by lejard_h on 24/04/16.
 */

part of taiga_api;

bool is_debug = false;

class TaigaApi {
	CoffeeRequester _requester;

	Auth auth;
	Resolver resolver;
	Milestones milestones;
	Users users;
	Issues issues;
	Feedbacks feedbacks;
	Tasks tasks;

	TaigaApi({String apiUrl: "https://api.taiga.io/api/v1", http.Client client}) {
		_requester = new CoffeeRequester(middlewares: [
			new CoffeeMiddleware(request: (CoffeeRequest req) {
				req.url = "$apiUrl${req.url}";
				return req;
			}),
			new AuthMiddleware(),
			JSON_MIDDLEWARE,
			new LoggerMiddleware(logger: (CoffeeResponse res) =>
			is_debug ? print("${res.baseRequest.method.toUpperCase()} [${res.request.url}] [${res.statusCode}]") : null)
		], client: client);

		auth = new Auth(_requester);
		resolver = new Resolver(_requester);
		milestones = new Milestones(_requester);
		issues = new Issues(_requester);
		users = new Users(_requester);
		feedbacks = new Feedbacks(_requester);
		tasks = new Tasks(_requester);
	}
}

abstract class ListBehavior {
	Get get _listRequest;

	Future<List<dynamic>> list({Map queryParameters: const {}}) async {
		CoffeeResponse res = await _listRequest.execute(queryParameters: queryParameters);

		if (res != null && res.isSuccessful) {
			return res.decodedBody;
		}
		return null;
	}
}

abstract class DeleteBehavior {
	Delete get _deleteRequest;

	Future<num> delete({Map parameters: const {}, Map queryParameters: const {}}) async {
		CoffeeResponse res = await _deleteRequest.execute(parameters: parameters, queryParameters: queryParameters);

		if (res != null && res.isSuccessful) {
			return res.statusCode;
		}
		return HttpStatus.NOT_FOUND;
	}
}

abstract class CoffeeRequestBehavior {
	CoffeeRequester _mainRequester;
	CoffeeHttpRequest _request;
	String name;

	CoffeeRequestBehavior(this.name, this._request, this._mainRequester) {
		_mainRequester[name] = _request;
	}
}
