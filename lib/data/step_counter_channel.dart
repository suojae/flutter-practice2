import 'dart:async';
import 'package:flutter/services.dart';

final class StepCounterChannel {
  static const MethodChannel _channel = MethodChannel('step_counter_channel');

  final StreamController<int> _stepController = StreamController<int>.broadcast();

  // 걸음 수 스트림 노출
  Stream<int> get stepStream => _stepController.stream;

  StepCounterChannel() {
    // 네이티브에서 오는 데이터를 처리
    _channel.setMethodCallHandler((MethodCall call) async {
      if (call.method == 'onStepCount') {
        final int stepCount = call.arguments as int;
        _stepController.add(stepCount);
      }
    });
  }

  // 네이티브에서 걸음 수 수집 시작
  Future<void> startPedometer() async {
    try {
      await _channel.invokeMethod('startPedometer');
    } catch (e) {
      print('Error starting pedometer: $e');
    }
  }

  // 네이티브에서 걸음 수 수집 중지
  Future<void> stopPedometer() async {
    try {
      await _channel.invokeMethod('stopPedometer');
      _stepController.close();
    } catch (e) {
      print('Error stopping pedometer: $e');
    }
  }
}
