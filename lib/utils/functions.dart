class Functions {
  bool isValidUrl(String url) {
    if (url.contains('[') || url.contains(']')) {
      return false;
    } else {
      return true;
    }
  }
}
