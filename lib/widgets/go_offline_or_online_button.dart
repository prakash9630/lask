import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_outline.dart';

import '../components/offline_online_button.dart';
import '../core/consts/colors.dart';


class GoOfflineOrOnlineButton extends ConsumerWidget {
  const GoOfflineOrOnlineButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userStatus = ref.watch(offlineStatusProvider);

    return InkWell(
      onTap: () {
        ref.read(offlineStatusProvider.notifier).update((state) {
          return userStatus == UserStatus.offline
              ? UserStatus.online
              : UserStatus.offline;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
            color: userStatus == UserStatus.offline
                ? AppColors.greenColor
                : AppColors.red,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 17,
              backgroundColor: userStatus == UserStatus.offline
                  ? AppColors.greenColor
                  : AppColors.red,
              child: userStatus == UserStatus.offline
                  ? const Iconify(
                      HeroiconsOutline.status_online,
                      color: Colors.white,
                    )
                  : const Iconify(
                      HeroiconsOutline.status_offline,
                      color: Colors.white,
                    ),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              "Go ${userStatus == UserStatus.offline ? "Online" : "Offline"}",
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
