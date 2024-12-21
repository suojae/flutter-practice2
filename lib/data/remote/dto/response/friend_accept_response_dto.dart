import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_accept_response_dto.freezed.dart';
part 'friend_accept_response_dto.g.dart';

@freezed
class FriendAcceptResponseDto with _$FriendAcceptResponseDto {
  const factory FriendAcceptResponseDto({
    required String message,
  }) = _FriendAcceptResponseDto;

  factory FriendAcceptResponseDto.fromJson(Map<String, dynamic> json) =>
      _$FriendAcceptResponseDtoFromJson(json);
}
