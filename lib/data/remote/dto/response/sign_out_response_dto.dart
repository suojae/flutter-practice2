import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_out_response_dto.freezed.dart';
part 'sign_out_response_dto.g.dart';

@freezed
class SignOutResponseDto with _$SignOutResponseDto {
  const factory SignOutResponseDto({
    required String message,
  }) = _SignOutResponseDto;

  factory SignOutResponseDto.fromJson(Map<String, dynamic> json) => _$SignOutResponseDtoFromJson(json);
}
