import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

final eventsStreamProvider = StreamProvider.autoDispose((ref) {
  final _stream = ref.watch(eventsChannelProvider).stream;
  return _stream;
});

final eventsChannelProvider = Provider((ref) {
  final _channel =
      WebSocketChannel.connect(Uri.parse('wss://echo.websocket.events'));

  ref.onDispose(() {
    _channel.sink.close();
  });

  return _channel;
});
