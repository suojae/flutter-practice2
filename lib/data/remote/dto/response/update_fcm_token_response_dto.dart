import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_fcm_token_response_dto.freezed.dart';
part 'update_fcm_token_response_dto.g.dart';

@freezed
class UpdateFcmTokenResponseDto with _$UpdateFcmTokenResponseDto {
  const factory UpdateFcmTokenResponseDto({
    required String message,
  }) = _UpdateFcmTokenResponseDto;

  factory UpdateFcmTokenResponseDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateFcmTokenResponseDtoFromJson(json);
}
