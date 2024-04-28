import 'package:flutter_test/flutter_test.dart';
import 'package:html/dom.dart' as dom;
import 'package:http/http.dart' as http;
import 'package:responsivedashboard/Product/model/github_repo_model.dart';

// * daha iyi bir yöntem buldum kendi api yi varmış
void main() {
  test('Scrape Github', () async {
    List<GithubModel> result = await scrapeGithub();
    expect(result, isNotEmpty); // Check that the result is not empty
  });
}

Future<List<GithubModel>> scrapeGithub() async {
  final response =
      await http.get(Uri.parse('https://github.com/codriot?tab=repositories'));
  List<GithubModel> repos = [];

  if (response.statusCode == 200) {
    dom.Document document = dom.Document.html(response.body);
    List links = document.querySelectorAll('h3.wb-break-all');

    for (var link in links) {
      String title = link.text.trim() ?? '';
      String href = link.querySelector('h3 a')?.attributes['href'] ?? '';

      repos.add(GithubModel(
        name: title,
        url: 'https://github.com' + href,
      ));
    }
  } else {
    print('Failed to load page');
  }

  return repos;
}
