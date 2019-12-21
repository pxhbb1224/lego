import 'package:data_plugin/bmob/table/bmob_user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BmobUser {
  User();

  //此处与类名一致，由指令自动生成代码
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  //此处与类名一致，由指令自动生成代码
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  Map getParams() {
    return toJson();
  }

  @override
  bool operator ==(Object other) => other is User && other.objectId == objectId;

  @override
  int get hashCode {
    if (objectId != null) {
      return objectId.hashCode;
    }
    return super.hashCode;
  }
}
