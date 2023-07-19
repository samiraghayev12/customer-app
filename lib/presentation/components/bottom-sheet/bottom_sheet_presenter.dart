import 'package:customer/presentation/components/bottom-sheet/selector_bottom_sheet.dart';
import 'package:customer/presentation/components/delegate/pickable.dart';
import 'package:flutter/material.dart';

class BottomSheetPresenter {
  static showSelectorBottomSheet({
    required BuildContext context,
    required List<Pickable> pickables,
    dynamic selectedValue,
    required String title,
  }) async {
    return await showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(26)),
      ),
      context: context,
      builder: (context) {
        return SelectorModal(
          pickables: pickables,
          selectedValue: selectedValue,
          title: title,
        );
      },
    );
  }
}
