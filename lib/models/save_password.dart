class PasswordModel {
  String? username;
  String? accountType;
  // ignore: non_constant_identifier_names
  String? accountProvider;
  String? password;

  // ignore: non_constant_identifier_names
  PasswordModel(
      {this.username, this.accountProvider, this.accountType, this.password});

  PasswordModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    accountProvider = json['accountProvider'];
    accountType = json['accountType'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['password'] = password;
    data['accountProvider'] = accountProvider;
    data['accountType'] = accountType;
    return data;
  }
}
