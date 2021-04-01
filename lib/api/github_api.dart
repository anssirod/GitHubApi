import 'package:http/http.dart' as http;

class GitHubAPI {
  static const BASE_URL = 'https://api.github.com/';

  Future getListOfRepositories(String keyword) async {
    final url = BASE_URL + 'search/repositories?q=$keyword&per_page=100';
    final response = await http.get(url);
    switch (response.statusCode) {
      case 200:
        return response.body;
        break;
      default:
        print(response.body);
        break;
    }
  }
}
