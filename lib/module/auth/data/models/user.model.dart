import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.model.g.dart';

@JsonSerializable(createToJson: false)
class UserModel extends Equatable {
  const UserModel({
    required this.id,
    required this.role,
    required this.isPro,
    required this.quizez,
    required this.playlists,
    required this.name,
    required this.email,
  });

  @JsonKey(name: '_id')
  final String? id;
  final String? role;
  final bool? isPro;
  final num? quizez;
  final num? playlists;
  final String? name;
  final String? email;

  factory UserModel.fromJson(Map<String, dynamic>? json) =>
      _$UserModelFromJson(json ?? {});

  @override
  List<Object?> get props => [id];
}
