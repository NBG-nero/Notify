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
  @HiveField(4)
  DateTime? dateCreated;
  @HiveField(5)
  DateTime? updatedDate;
  @HiveField(6)
  bool? isEdited;
  @HiveField(7)
  String? altDate;

  Note({
    this.title,
    this.id,
    this.desc,
    this.complete = false,
    this.dateCreated,
    this.updatedDate,
    this.isEdited,
    this.altDate,
  });
  //  : dateCreated =dateCreated ?? DateTime.now();

  factory Note.from(Map<String, dynamic> json) => _$NoteFromJson(json);

  Map<String, dynamic> toJson() => _$NoteToJson(this);

  @override
  String toString() {
    return 'Note(title: $title, id: $id, desc: $desc, complete: $complete, dateCreated: $dateCreated, updatedDate: $updatedDate, isEdited: $isEdited, altDate: $altDate)';
  }
}
