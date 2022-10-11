// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NoteAdapter extends TypeAdapter<Note> {
  @override
  final int typeId = 0;

  @override
  Note read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Note(
      title: fields[0] as String?,
      id: fields[1] as String?,
      desc: fields[2] as String?,
      complete: fields[3] as bool?,
      dateCreated: fields[4] as DateTime?,
      updatedDate: fields[5] as DateTime?,
      isEdited: fields[6] as bool?,
      altDate: fields[7] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Note obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.desc)
      ..writeByte(3)
      ..write(obj.complete)
      ..writeByte(4)
      ..write(obj.dateCreated)
      ..writeByte(5)
      ..write(obj.updatedDate)
      ..writeByte(6)
      ..write(obj.isEdited)
      ..writeByte(7)
      ..write(obj.altDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NoteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
      title: json['title'] as String?,
      id: json['id'] as String?,
      desc: json['desc'] as String?,
      complete: json['complete'] as bool? ?? false,
      dateCreated: json['dateCreated'] == null
          ? null
          : DateTime.parse(json['dateCreated'] as String),
      updatedDate: json['updatedDate'] == null
          ? null
          : DateTime.parse(json['updatedDate'] as String),
      isEdited: json['isEdited'] as bool?,
      altDate: json['altDate'] as String?,
    );

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'desc': instance.desc,
      'complete': instance.complete,
      'dateCreated': instance.dateCreated?.toIso8601String(),
      'updatedDate': instance.updatedDate?.toIso8601String(),
      'isEdited': instance.isEdited,
      'altDate': instance.altDate,
    };
