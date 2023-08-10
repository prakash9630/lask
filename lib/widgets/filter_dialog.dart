import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lask_client/components/components.dart';
import 'package:lask_client/core/consts/colors.dart';
import 'package:lask_client/core/provider/filter_provider.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showFilter(BuildContext context,
    {bool? showRating,
    bool showDate = false,
    required Function(Map<String, dynamic> map) onFilter}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(40.0)),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: SizedBox(
            height: 440.h,
            child: FilterDialog(
              showRatingContent: showRating,
              onFilter: onFilter,
              showDate: showDate,
            )),
      );
    },
  );
}

class FilterDialog extends ConsumerStatefulWidget {
  const FilterDialog(
      {Key? key,
      this.showRatingContent = true,
      required this.showDate,
      required this.onFilter})
      : super(key: key);
  final bool? showRatingContent;
  final bool showDate;
  final Function(Map<String, dynamic> map) onFilter;

  @override
  ConsumerState<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends ConsumerState<FilterDialog> {
  @override
  Widget build(BuildContext context) {
    final filterProv = ref.watch(filterProvider);
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 23.w, right: 23.w),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        ref.refresh(filterProvider.notifier).clearData();
                      },
                      child: Text(
                        "Clear",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primaryColor),
                      )),
                  const Spacer(),
                  Center(
                      child: Text(
                    "Filters",
                    style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.filterHeaderColor),
                  )),
                  const Spacer(),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.close,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            if (widget.showDate)
              Row(
                children: [
                  Expanded(
                    child: CustomDatetimePicker(
                        labelText: "Date from",
                        onDatePicked: filterProv.onFromDateSelected,
                        hintText: "e.g.2022/10/01"),
                  ),
                  SizedBox(
                    width: 16.w,
                  ),
                  Expanded(
                    child: CustomDatetimePicker(
                        labelText: "Date to",
                        onDatePicked: filterProv.onToDateSelected,
                        hintText: "e.g.2022/10/30"),
                  ),
                ],
              ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              child: CustomTextField(
                labelText: "Lawyer Name",
                hintText: "Enter Lawyer's Name",
                onChanged: filterProv.onLawyerNameChange,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 14.h),
              child: CustomTextField(
                labelText: "Lawyer License Id",
                hintText: "Enter Lawyer License Id",
                onChanged: filterProv.onLawyerLicenseIdChange,
              ),
            ),
            if (widget.showRatingContent == true)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.h),
                    child: const Text(
                      "Lawyer's Rating",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          color: AppColors.greyColor),
                    ),
                  ),
                  MultiSelectContainer(
                      itemsPadding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 10.h),
                      textStyles: MultiSelectTextStyles(
                          selectedTextStyle: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500),
                          textStyle: TextStyle(
                              color: AppColors.primaryColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500)),
                      itemsDecoration: MultiSelectDecorations(
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(10.r)),
                        selectedDecoration: BoxDecoration(
                            color: AppColors.primaryColor,
                            border: Border.all(color: AppColors.primaryColor),
                            borderRadius: BorderRadius.circular(10.r)),
                      ),
                      items: [
                        MultiSelectCard(value: '1', label: '1 Star'),
                        MultiSelectCard(value: '2', label: '2 Star'),
                        MultiSelectCard(value: '3', label: '3 Star'),
                        MultiSelectCard(value: '4', label: '4 Star'),
                        MultiSelectCard(value: '5', label: '5 Star'),
                      ],
                      onChange: (allSelectedItems, selectedItem) {
                        filterProv.onRatingChange(allSelectedItems);
                      }),
                ],
              ),
            SizedBox(
              height: 25.h,
            ),
            CustomButton(
                onPressed: () {
                  widget.onFilter(filterProv.filterData());
                  context.router.pop();
                },
                label: "Apply Filter"),
            SizedBox(
              height: 25.h,
            ),
          ],
        ),
      ),
    );
  }
}
