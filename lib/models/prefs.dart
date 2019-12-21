import 'dart:collection';
import 'dart:convert';
import 'dart:math';

import 'package:lego/data/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String KEY_USERS = "users";

class Prefs {
  static SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Queue<User> getLastLoginTenUsers() {
    assert(_prefs != null, "class Prefs not run init");
    List<String> jsonUsers = _prefs.getStringList(KEY_USERS);
    Queue<User> users = new ListQueue<User>();
    if (jsonUsers != null && jsonUsers.isNotEmpty) {
      try {
        int startIndex = max(jsonUsers.length - 10, 0);
        for (int i = startIndex; i < jsonUsers.length; i++) {
          User user = User.fromJson(jsonDecode(jsonUsers[i]));
          if (user != null) {
            users.add(user);
          }
        }
      } catch (e) {}
    }
    return users;
  }

  static String getLastLoginUserName() {
    Queue<User> users = getLastLoginTenUsers();
    if (users != null && users.isNotEmpty) {
      return users.last.username;
    }
    return null;
  }
  
  static void setLoginUsersCache(User user) {
    assert(_prefs != null, "class Prefs not run init");
    if (user == null) return;
    Queue<User> oldUsers = getLastLoginTenUsers();

    if (oldUsers.contains(user)) {
      oldUsers.remove(user);
      oldUsers.add(user);
    } else {
      if (oldUsers.length == 10) {
        // 把最顶上的移除
        oldUsers.removeFirst();
        oldUsers.add(user);
      } else {
        oldUsers.add(user);
      }
    }
  }
}
