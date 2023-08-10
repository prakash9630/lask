import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../core/consts/colors.dart';

enum UserStatus { offline, online }

final offlineStatusProvider = StateProvider<UserStatus>((ref) {
  return UserStatus.offline;
});

class OfflineOnlineButton extends ConsumerWidget {
  const OfflineOnlineButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStatus = ref.watch(offlineStatusProvider);
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.white),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 23, vertical: 15),
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          _buildChild(
            label: "Offline",
            color: AppColors.red,
            isSelected: selectedStatus == UserStatus.offline,
            onTap: () {
              ref
                  .read(offlineStatusProvider.notifier)
                  .update((state) => UserStatus.offline);
            },
          ),
          _buildChild(
            label: "Online",
            color: AppColors.greenColor,
            isSelected: selectedStatus == UserStatus.online,
            onTap: () {
              ref
                  .read(offlineStatusProvider.notifier)
                  .update((state) => UserStatus.online);
            },
          ),
        ],
      ),
    );
  }

  Expanded _buildChild({
    required String label,
    required Color color,
    required VoidCallback onTap,
    required bool isSelected,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: isSelected ? Colors.white : null,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: isSelected ? color : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
