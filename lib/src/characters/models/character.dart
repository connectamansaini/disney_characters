import 'package:json_annotation/json_annotation.dart';

part 'character.g.dart';

@JsonSerializable()
class Character {
  Character({
    this.id = 0,
    this.name = '',
    this.imageUrl = '',
  });

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
  Map<String, dynamic> toJson() => _$CharacterToJson(this);

  @JsonKey(name: '_id')
  final int id;

  final String name;
  final String imageUrl;
}
