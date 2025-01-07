import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class User {
  final String id;
  final String pseudonym;
  final int subscriber;
  final String passWord;
  final List interest;
  final String? profilePicture;
  final String? publication;

  // Constructeur nommé
  User({
    required this.id,
    required this.pseudonym,
    required this.subscriber,
    required this.passWord,
    required this.interest,
    this.profilePicture,
    this.publication,
  });

static User? sessionUser;

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? '',
      pseudonym: json['pseudonym'] ?? '',
      subscriber: json['subscriber'] ?? '',
      passWord: json['passWord'] ?? '',
      interest: json['interest'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
      publication: json['publication'] ?? '',
    );
  }
  Map<String, dynamic> toMap()  {
    return {
      'id': id,
      'pseudonym': pseudonym,
      'subscriber': subscriber,
      'passWord': passWord,
      'interest': interest,
      'profilePicture': profilePicture,
      'publication': publication,
    };
  }

static void saveUser(User user) async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  var data = json.encode(user.toMap());
  pref.setString("user", data);
  pref.commit();
}

static void getUser() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
var data = pref.getString("user");
if(data != null){
var decode = json.decode(data);
var user = User.fromJson(decode);
sessionUser = user;
}else{
  sessionUser = null ;
}


}

static void logOut() async{
  SharedPreferences pref = await SharedPreferences.getInstance();
  await pref.remove("user");
  sessionUser = null;
}

}



