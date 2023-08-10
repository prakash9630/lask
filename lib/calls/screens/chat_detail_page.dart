import 'dart:convert';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/core/extension/extension.dart';
import 'package:lask_client/features/profile/model/profile_model.dart';
import 'dart:io';
import '../../core/consts/colors.dart';
import '../../features/profile/provider/profile_provider.dart';
import '../../widgets/custom_cached_image.dart';
import '../model/chat_detail_data_model.dart';
import '../provider/message_notifier.dart';
import '../widgets/chat_bubble_widget.dart';
import '../widgets/chat_detail_send_widget.dart';

@RoutePage()
class ChatDetailPage extends ConsumerStatefulWidget {
  const ChatDetailPage({Key? key,required this.userName}) : super(key: key);
  final String userName;

  @override
  ConsumerState<ChatDetailPage> createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends ConsumerState<ChatDetailPage> {

   ProfileModel? user;
  @override
  void initState() {
    super.initState();
    // listenMessage();
  }

  // Future<void> listenMessage() async {
  //   try {
  //     user = ref.read(profileProvider).model;
  //      final messageProv= ref.read(messageNotifyProvider.notifier);
  //
  //     ref.read(messageNotifyProvider).channel?.stream.listen((message){
  //       log("$message");
  //       ChatDetailDataModel? parsedData;
  //       try {
  //         parsedData = ChatDetailDataModel.fromJson(
  //             jsonDecode(message));
  //         log("Parsed Dataa is ${parsedData.message}");
  //       } catch (e) {
  //         log("Unable To Parse $e");
  //       }
  //        messageProv.addMessage(
  //          parsedData??
  //                ChatDetailDataModel(
  //                  message: "$message",
  //                  dateTime: DateTime.now(),
  //                  username: user?.username,
  //                  showProcessing: true,
  //                ),
  //        );
  //       setState(() {});
  //     }).onError((e) {});
  //   } catch (e) {
  //     showErrorToast(text: "Disconnected Socket");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final messageProv= ref.watch(messageNotifyProvider);
    ProfileModel? user = ref.read(profileProvider).model;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: ListView.builder(
          reverse: true,
          padding: const EdgeInsets.fromLTRB(23, 10, 23, 86),
          itemCount: messageProv.messageList?.length,
          itemBuilder: (context, index) {
            ChatDetailDataModel da = messageProv.messageList![index];
            bool isSender = (da.username == user?.username);
            return ChatBubbleCard(
              isSender: isSender,
              model: da,
            );
          },
        ),
        bottomSheet: ChatDetailSendWidget(onSend: (String msg, File? file) {
          sendMessage(msg,file: file);
        },
        ),
      ),
    );
  }

  AppBar _buildAppBar(){
    return AppBar(
      toolbarHeight: 84,
      backgroundColor: AppColors.whiteColor,
      iconTheme: const IconThemeData(
        color: AppColors.primaryColor, //change your color here
      ),
      title: const Row(
        children: [
          CircleAvatar(
            radius: 27,
            child: CustomCachedImage(
              borderRadius: 27,
              imageUrl:
                  "https://s3-alpha-sig.figma.com/img/2a36/75cb/0d455e0e73abc5df35c50a51974cee30?Expires=1686528000&Signature=XKKBu5kzGzarEGhYpstAGAYwptTqEcaLPZvck2GPo9-~Pn-WCsz-Z2XligFDcO7ko5QSBuiRBZNfitaYjUrMaFxnHl2wQfUpjxjxNA8wN9AOXjR071qj8UDt2nyaVz5SEqs40AY3LHIq9YlSNEZCmggQTfKVDBDpUBav9qMPtmfk1UDSS5tp22i1Mx7pPOQ-dUJQ90XgjHCfznTW2c-15OgoEotuH-Czm6kSxdAtsRD8wCp~AcDYJV0DxDEBJsgdf5Zh6NsRN8rdAQScBrbz84427erBepbw9CFmjAQhKv9dRbdL7oHMtmAmNzLoY0kGT2dmPyXUzQMBACa0w-x9Nw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4",
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  "Shreya Shrestha",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: AppColors.headerBlack),
                ),
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: AppColors.greenColor,
                    radius: 5,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "In Call",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: AppColors.greenColor,
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  sendMessage(String text, {File? file}) {
    var data = {
      "sender_id": 2,
      "receiver_id": 1,
      "message": text,
      "dateTime": DateTime.now().toFormattedString(),
      if (file != null) "file": file.readAsBytesSync(),
      if(file!=null) "file_name": file.path.fileName,
    };
     //channel?.sink.add(jsonEncode(data));
     ref.read(messageNotifyProvider).channel?.sink.add(jsonEncode(data));

  }
}
