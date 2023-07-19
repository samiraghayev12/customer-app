import 'package:customer/presentation/components/delegate/pickable.dart';
import 'package:customer/presentation/router/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectorModal extends StatelessWidget {
  final List<Pickable> pickables;
  final dynamic selectedValue;
  final String title;

  const SelectorModal({
    Key? key,
    required this.pickables,
    required this.selectedValue,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        color: Colors.white,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: IconButton(
                  splashRadius: 22,
                  onPressed: () => Navigation.pop(),
                  icon: const Icon(CupertinoIcons.clear),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: pickables
                  .map(
                    (item) => ListTile(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      selected: item.value == selectedValue,
                      title: Text(item.value),
                      onTap: () {
                        Navigator.pop(context, item);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
