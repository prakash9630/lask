import 'package:flutter/material.dart';
import 'package:lask_client/core/extension/extension.dart';
import '../../../core/consts/colors.dart';
import '../model/support_model.dart';

class SupportReplyInfoCard extends StatelessWidget {
  const SupportReplyInfoCard({
    Key? key,
    required this.model,
  }) : super(key: key);
  final Support model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                "Ticket Information",
                style: TextStyle(
                  color: AppColors.lightFontGrey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Chip(
                visualDensity: const VisualDensity(
                  horizontal: 0.0,
                  vertical: -4,
                ),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                backgroundColor: model.ticketStatus?.toColor,
                label: Text(
                  model.ticketStatus?.toFormattedName??"",
                  style: const TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          _buildRichText(
            label: "Requester",
            subtitle: model.name?.toCapitalizeEachWord??"",
          ),
          const SizedBox(
            height: 10,
          ),
          _buildRichText(
            label: "Subject",
            subtitle: model.subject?.toCapitalizeFirst??"",
          ),
          const SizedBox(
            height: 10,
          ),
          _buildRichText(
            label: "Message",
            subtitle: model.message?.toCapitalizeFirst??"",
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: _buildRichText(
                  label: "Email",
                  subtitle: model.email??"-",
                ),
              ),
              Expanded(
                child: _buildRichText(
                  label: "Phone Number",
                  subtitle: model.phoneNumber??"-",
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  RichText _buildRichText({
    required String label,
    required String subtitle,
  }) {
    return RichText(
      text: TextSpan(
        text: "$label\n",
        style: const TextStyle(
          color: AppColors.fontGrey,
          fontFamily: "Inter",
          fontSize: 12,
        ),
        children: [
          TextSpan(
            text: subtitle,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
