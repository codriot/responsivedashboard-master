import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:responsivedashboard/Product/model/github_repo_model.dart';

class WebScraperService {
  Future<List<GithubModel>> fetchRepos() async {
    final response =
        await http.get(Uri.parse('https://api.github.com/users/codriot/repos'));

    if (response.statusCode == 200) {
      List<dynamic> repoList = jsonDecode(response.body);

      return repoList.map((repo) => GithubModel.fromJson(repo)).toList();
    } else {
      throw Exception('Failed to load repos');
    }
  }
}
