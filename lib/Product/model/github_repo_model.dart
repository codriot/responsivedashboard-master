class GithubModel {
  String? name;
  String? htmlUrl;
  String? description;

  GithubModel({this.name, this.htmlUrl, this.description});

  GithubModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    htmlUrl = json['html_url'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['html_url'] = htmlUrl;
    data['description'] = description;
    return data;
  }
}
