mixin FormValidator {
  bool isEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool isName(String name) {
    return RegExp(r'^[a-zA-Z0-9]([_](?![_])|[a-zA-Z0-9]){1,18}[a-zA-Z0-9]$')
        .hasMatch(name);
  }
}
