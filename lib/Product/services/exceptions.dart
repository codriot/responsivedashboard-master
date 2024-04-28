class PageLoadException implements Exception {
  final String message;

  PageLoadException([this.message = "Failed to load page"]);

  @override
  String toString() => message;
}
