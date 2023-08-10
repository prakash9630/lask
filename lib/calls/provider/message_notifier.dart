import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../model/chat_detail_data_model.dart';

final messageNotifyProvider =
    StateNotifierProvider<MessageNotifier, MessageModel>((ref) {
  return MessageNotifier();
});

class MessageModel {
  WebSocketChannel? channel;
  List<ChatDetailDataModel>? messageList = [];

  MessageModel({
    this.channel,
    this.messageList,
  });

  MessageModel copyWith(
      {WebSocketChannel? channel, List<ChatDetailDataModel>? messageList}) {
    return MessageModel(
        channel: channel ?? this.channel,
        messageList: messageList ?? this.messageList);
  }
}

class MessageNotifier extends StateNotifier<MessageModel> {
  MessageNotifier() : super(MessageModel(channel: null, messageList: []));

  void addMessage(ChatDetailDataModel message) {
    final updatedList = [message, ...state.messageList!];
    state = state.copyWith(messageList: updatedList);
  }

  void setChannel(WebSocketChannel channel) {
    state = state.copyWith(channel: channel);
  }

  void clearChannel() {
    state = state.copyWith(channel: null, messageList: []);
  }
}
