import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_request_request_dto.freezed.dart';
part 'friend_request_request_dto.g.dart';

@freezed
class FriendRequestDto with _$FriendRequestDto {
  const factory FriendRequestDto({
    required String senderNickname,
    required String friendNickname,
  }) = _FriendRequestDto;

  factory FriendRequestDto.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestDtoFromJson(json);
}