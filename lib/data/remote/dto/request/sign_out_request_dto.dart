import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_out_request_dto.freezed.dart';
part 'sign_out_request_dto.g.dart';

@freezed
class SignOutRequestDto with _$SignOutRequestDto {
  const factory SignOutRequestDto({
    required String refreshToken,
  }) = _SignOutRequestDto;

  factory SignOutRequestDto.fromJson(Map<String, dynamic> json) => _$SignOutRequestDtoFromJson(json);
}
