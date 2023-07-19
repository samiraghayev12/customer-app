import 'package:customer/presentation/components/button/primary_button.dart';
import 'package:customer/presentation/router/navigation.dart';
import 'package:customer/presentation/router/route_name.dart';
import 'package:customer/presentation/ui/main/provider/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = context.read<MainProvider>();
    return PrimaryButton(
      title: "transfer".toUpperCase(),
      didTap: () async {
        final result = await Navigation.push(
          RouteName.transfer,
          arguments: mainProvider.cards,
        );
        if (result != null) {
          mainProvider.updateCards(result);
        }
      },
    );
  }
}
