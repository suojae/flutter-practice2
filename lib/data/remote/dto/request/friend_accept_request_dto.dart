import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_accept_request_dto.freezed.dart';
part 'friend_accept_request_dto.g.dart';

@freezed
class FriendAcceptDto with _$FriendAcceptDto {
  const factory FriendAcceptDto({
    required String recipientNickname,
    required String friendNickname,
  }) = _FriendAcceptDto;

  factory FriendAcceptDto.fromJson(Map<String, dynamic> json) =>
      _$FriendAcceptDtoFromJson(json);
}

