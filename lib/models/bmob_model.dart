import 'dart:developer';

import 'package:data_plugin/bmob/bmob.dart';
import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:lego/data/user.dart';

class BmobModel {
  static void init() {
    Bmob.initMasterKey("96b4cd4dde5515f7c32b946ed0853cd7",
        "13cabf14a1544fea2461308e384e5ffd", "");
  }

  static void login(String userName, String pwd,Future ) {
    User bmobUserRegister = new User();
    bmobUserRegister.username = userName;
    bmobUserRegister.password = pwd;
    bmobUserRegister.login().then((BmobUser user) {
      log("bmob user login: ${user.objectId}", name: "Bmob");
    }).catchError((e) {

    });
  }
}
