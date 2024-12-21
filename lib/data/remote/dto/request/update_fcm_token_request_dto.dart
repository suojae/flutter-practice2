import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_fcm_token_request_dto.freezed.dart';
part 'update_fcm_token_request_dto.g.dart';

@freezed
class UpdateFcmTokenRequestDto with _$UpdateFcmTokenRequestDto {
  const factory UpdateFcmTokenRequestDto({
    required String userUuid,
    required String fcmToken,
  }) = _UpdateFcmTokenRequestDto;

  factory UpdateFcmTokenRequestDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateFcmTokenRequestDtoFromJson(json);
}

