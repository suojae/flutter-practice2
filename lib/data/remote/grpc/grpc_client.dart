import 'generated/step.pbgrpc.dart';
import 'grpc_channel.dart';

final class GrpcClient {
  final StepServiceClient _grpcClient;

  GrpcClient() : _grpcClient = StepServiceClient(GrpcChannel.getChannel());

  /// 사용자 걸음수 기록 (단일 요청)
  Future<String> recordSteps(String userId, int steps, String date) async {
    final response = await _grpcClient.recordSteps(
      StepInput(userId: userId, steps: steps, date: date),
    );
    return response.message;
  }

  /// 여러 사용자(UUID)의 실시간 걸음수 스트리밍 받기
  Stream<StepRecord> requestUserSteps(List<String> userIds, String date) {
    return _grpcClient.streamSteps(
      GetStepsByUuidsInput(userIds: userIds, date: date),
    );
  }

  /// 사용자 걸음수 실시간 스트리밍 전송
  Future<StepResponse> streamUserSteps(Stream<StepInput> stepStream) async {
    final response = await _grpcClient.streamUserSteps(stepStream);
    return response;
  }
}
