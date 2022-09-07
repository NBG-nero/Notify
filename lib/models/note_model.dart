// import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Note {
  @HiveField(0)
  String? title;
  @HiveField(1)
  String? id;
  @HiveField(2)
  String? desc;
  @HiveField(3)
  bool? complete;
  Note({
    this.title,
    this.id,
    this.desc,
    this.complete = false,
  });
   factory Note.from(Map<String, dynamic> json) => _$NoteFromJson(json);
  Map<String, dynamic> toJson() => _$NoteToJson(this);
 
}






































