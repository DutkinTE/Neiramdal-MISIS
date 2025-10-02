import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class UserModel {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final int experience;
  final int money;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.experience,
    required this.money,
  });

  String toJson() {
    return '''
    {
      "id": $id,
      "email": "$email",
      "first_name": "$firstName",
      "last_name": "$lastName",
      "experience": $experience,
      "money": $money
    }
    ''';
  }

  factory UserModel.fromJson(String jsonString) {
    final myjson = Map<String, dynamic>.from(json.decode(jsonString));
    return UserModel(
      id: myjson['id'],
      email: myjson['email'],
      firstName: myjson['first_name'],
      lastName: myjson['last_name'],
      experience: myjson['experience'],
      money: myjson['money'],
    );
  }
}

class UserStorage {
  static const _keyUserId = 'user_id';
  static const _keyUserData = 'user_data';

  Future<void> saveUserData(UserModel user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_keyUserId, user.id);
    await prefs.setString(_keyUserData, user.toJson());
  }

  static Future<UserModel?> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString(_keyUserData);
    if (userData != null) {
      return UserModel.fromJson(userData);
    }
    return null;
  }

  static Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyUserId);
    await prefs.remove(_keyUserData);
  }
}
