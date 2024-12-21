import 'package:freezed_annotation/freezed_annotation.dart';

part 'friend_list_response_dto.freezed.dart';
part 'friend_list_response_dto.g.dart';

@freezed
class FriendListResponseDto with _$FriendListResponseDto {
  const factory FriendListResponseDto({
    required List<String> friendUuids,
  }) = _FriendListResponseDto;

  factory FriendListResponseDto.fromJson(Map<String, dynamic> json) =>
      _$FriendListResponseDtoFromJson(json);
}
