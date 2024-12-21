import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_entity.freezed.dart';
part 'step_entity.g.dart';

@freezed
class StepEntity with _$StepEntity {
  const factory StepEntity({
    required String uuid, // 사용자 UUID
    required String date, // 날짜
    required int steps, // 걸음 수
  }) = _StepEntity;

  factory StepEntity.fromJson(Map<String, dynamic> json) => _$StepEntityFromJson(json);
}
