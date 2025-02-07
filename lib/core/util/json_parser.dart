extension JsonParser on Map<String, dynamic> {
  String parseString(String key, {String defaultValue = ""}) {
    final value = this[key];

    if (value is String) return value;
    if (value != null) return value.toString();

    return defaultValue;
  }
}
