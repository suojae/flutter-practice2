import 'package:freezed_annotation/freezed_annotation.dart';

part 'use_entity.freezed.dart';
part 'use_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String uuid, // 사용자 UUID
    required String nickName, // 사용자 닉네임
    required List<String> friendUuids, // 친구 UUID 목록
    required String provider, // 소셜 로그인 제공자 (ex: Google, Kakao 등)
    required int dailyTargetSteps,
  }) = _User;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);
}
