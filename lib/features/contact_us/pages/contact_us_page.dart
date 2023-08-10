import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/features/contact_us/widget/contact_us_content.dart';
import '../../../core/consts/asset_path.dart';

@RoutePage()
class ContactUsPage extends ConsumerStatefulWidget {
  const ContactUsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends ConsumerState<ContactUsPage> {
  int flag = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: [
              Image.asset(AssetPath.contactUsBackground),
              const ContactUsContent()
            ],
          ),
        ),
      ),
    );
  }
}
