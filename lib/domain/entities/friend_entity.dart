import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_entity.freezed.dart';
part 'friend_entity.g.dart';

@freezed
class FriendEntity with _$FriendEntity {
  /// [1] 친구 요청 (message만 있음)
  const factory FriendEntity.request({
    required String message,
  }) = _FriendRequestEntity;

  /// [2] 친구 요청 수락 (message만 있음)
  const factory FriendEntity.accept({
    required String message,
  }) = _FriendAcceptEntity;

  /// [3] 친구 목록 (List<String> friendUuids)
  const factory FriendEntity.list({
    required List<String> friendUuids,
  }) = _FriendListEntity;

  /// [4] FCM 토큰 업데이트 (message만 있음)
  const factory FriendEntity.updateFcm({
    required String message,
  }) = _FriendFcmUpdateEntity;

  factory FriendEntity.fromJson(Map<String, dynamic> json) =>
      _$FriendEntityFromJson(json);
}
