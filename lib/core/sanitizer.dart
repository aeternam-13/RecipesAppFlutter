import 'package:recipes_app/core/errors.dart';

///Tries to recover the data from a JSON field, since all strings all we need is this
///method from strings, it throws an exception if the value is not provided

String sanitizeString(
  Map<String, dynamic> json,
  String key, {
  required = false,
}) {
  if (!json.containsKey(key) && required) {
    throw RecipeParseError(message: "Missing value $key");
  }

  if (!json.containsKey(key)) return "";

  if (json[key] == null) return "";

  return json[key].toString();
}
