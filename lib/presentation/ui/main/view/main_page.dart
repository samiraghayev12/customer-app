import 'package:customer/presentation/components/page/base_page.dart';
import 'package:customer/presentation/router/navigation.dart';
import 'package:customer/presentation/router/route_name.dart';
import 'package:customer/presentation/ui/main/provider/main_provider.dart';
import 'package:customer/presentation/ui/main/view/main_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget with BasePage {
  const MainPage({super.key});

  @override
  Widget? title(BuildContext context) {
    return const Text("Main");
  }

  @override
  Widget? leading(BuildContext context) {
    return const SizedBox();
  }

  @override
  List<Widget>? actions(BuildContext context) {
    final mainProvider = context.watch<MainProvider>();
    return [
      IconButton(
        splashRadius: 24,
        onPressed: () async {
          final result = await Navigation.push(RouteName.crateCustomer);
          if (result != null) {
            mainProvider.addCard(result);
          }
        },
        icon: const Icon(
          Icons.add,
          color: Colors.black,
          size: 30,
        ),
      )
    ];
  }

  @override
  Widget? body(BuildContext context) {
    return const MainBody();
  }
}
