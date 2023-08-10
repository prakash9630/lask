
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:lask_client/core/extension/extension.dart';
import 'package:lask_client/core/routes/app_routes.dart';
import '../../../core/consts/colors.dart';
import '../model/support_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SupportTicketsStatus {
  none,
  open,
  close;

  static SupportTicketsStatus toStatus(String? val) {
    switch (val) {
      case "open":
        return SupportTicketsStatus.open;
      case "close":
        return SupportTicketsStatus.close;
      default:
        return SupportTicketsStatus.none;
    }
  }

  Color get toColor {
    switch (this) {
      case SupportTicketsStatus.close:
        return AppColors.red;
      case SupportTicketsStatus.open:
        return AppColors.greenColor;
      default:
    }
    return Colors.black;
  }

  String get toFormattedName {
    return name.wordToSentence.toCapitalizeEachWord;
  }
}

class SupportView extends StatelessWidget {
  const SupportView({Key? key,this.model}) : super(key: key);
   final Support? model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23,vertical: 12),
      child: ListTile(
        onTap: () {
          context.router.push(SupportTicketReplyRoute(model: model!));
        },
        contentPadding: EdgeInsets.zero,
        minLeadingWidth: 10.w,
        leading:  SizedBox(
          width: 10.w,
          child: Center(
            child: Container(
              width: 10.w,
              height: 10.h,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        title: Text(
          model?.subject ?? "-",
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          model?.message ?? "-",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Chip(
          backgroundColor: model?.ticketStatus?.toColor,
          label: Text(
            model?.ticketStatus?.toFormattedName ?? "",
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
