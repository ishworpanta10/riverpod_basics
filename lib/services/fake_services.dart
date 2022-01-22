import 'package:flutter/material.dart';
import 'package:riverpod_demo/model/user.dart';

class FakeService {
  static Future<User?> fetchUserData({required String username}) async {
    await Future.delayed(const Duration(seconds: 1));
    try {
      return userList.singleWhere((element) => element.username.toLowerCase() == username);
    } catch (err) {
      debugPrint("Error :$err");
    }
  }
}
