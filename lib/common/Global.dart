import 'package:lego/data/user.dart';
import 'package:lego/models/bmob_model.dart';
import 'package:lego/models/prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 管理APP的全局变量
class Global {

  static Future init() async {
    Prefs.init();
    BmobModel.init(); // 初始化BmobModel
  }

  /// 获取上一次登录的用户名
  static String getLastLoginUserName() {
    return Prefs.getLastLoginUserName();
  }


}
