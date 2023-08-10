import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../core/consts/asset_path.dart';
import '../core/consts/colors.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar(
      {Key? key,
      required this.title,
      this.onLeadingTap,
      this.actions,
      this.backgroundColor,
      this.snap = false,
      this.floating = false,
      this.pinned = false,
      this.titleWidget,
      this.bottom,
      this.bottomHeight = 56.0,
      this.flexibleSpace,
      this.forceElevated})
      : super(key: key);

  final String title;
  final Widget? titleWidget;
  final VoidCallback? onLeadingTap;
  final List<Widget>? actions;
  final bool snap;
  final bool floating;
  final bool pinned;
  final Color? backgroundColor;
  final Widget? bottom;
  final double bottomHeight;
  final Widget? flexibleSpace;
  final bool? forceElevated;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 3,
      backgroundColor: backgroundColor ?? AppColors.homeBackgroundColor,
      snap: snap,
      floating: floating,
      pinned: pinned,
      titleSpacing: 0,
      flexibleSpace: flexibleSpace,
      forceElevated: forceElevated ?? true,
      leading: InkWell(
        onTap: onLeadingTap ??
            () {
              Navigator.of(context).pop();
            },
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(
            AssetPath.iconBack,
          ),
        ),
      ),
      title: titleWidget ??
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: AppColors.black2CColor,
            ),
          ),
      centerTitle: true,
      bottom: bottom == null
          ? null
          : _CustomPrefSizeWidget(height: bottomHeight, child: bottom!),
      actions: [
        const SizedBox(
          width: 10.0,
        ),
        if (actions != null) ...{
          ...actions!,
        },
        const SizedBox(
          width: 20.0,
        )
      ],
    );
  }
}

class _CustomPrefSizeWidget extends StatelessWidget implements PreferredSizeWidget {
  const _CustomPrefSizeWidget(
      {Key? key, required this.child, required this.height})
      : super(key: key);
  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) {
    return child;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
