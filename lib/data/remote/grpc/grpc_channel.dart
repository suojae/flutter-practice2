import 'package:grpc/grpc.dart';

final class GrpcChannel {
  static ClientChannel getChannel() {
    return ClientChannel(
      'localhost', // 서버 주소 (로컬 또는 원격 서버)
      port: 50051, // 서버 포트
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );
  }
}
