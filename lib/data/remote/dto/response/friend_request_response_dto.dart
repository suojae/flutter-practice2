import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_request_response_dto.freezed.dart';
part 'friend_request_response_dto.g.dart';

@freezed
class FriendRequestResponseDto with _$FriendRequestResponseDto {
  const factory FriendRequestResponseDto({
    required String message,
  }) = _FriendRequestResponseDto;

  factory FriendRequestResponseDto.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestResponseDtoFromJson(json);
}
