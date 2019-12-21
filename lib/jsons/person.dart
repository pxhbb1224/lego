import 'package:data_plugin/bmob/table/bmob_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@JsonSerializable()
class Person extends BmobObject{
  String name;
  String address;

  Person(String name,String address){
    this.name = name;
    this.address = address;
  }

  //此处与类名一致，由指令自动生成代码
  factory Person.fromJson(Map<String, dynamic> json) =>
      _$PersonFromJson(json);



  //此处与类名一致，由指令自动生成代码
  Map<String, dynamic> toJson() => _$PersonToJson(this);

  @override
  Map getParams() {
    return toJson();
  }
}