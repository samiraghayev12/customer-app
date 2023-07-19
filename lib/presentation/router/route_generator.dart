import 'package:customer/presentation/router/route_name.dart';
import 'package:customer/presentation/ui/create-customer/provider/create_customer_provider.dart';
import 'package:customer/presentation/ui/create-customer/view/create_customer_page.dart';
import 'package:customer/presentation/ui/main/model/card_model.dart';
import 'package:customer/presentation/ui/main/provider/main_provider.dart';
import 'package:customer/presentation/ui/main/view/main_page.dart';
import 'package:customer/presentation/ui/transfer/provider/transfer_provider.dart';
import 'package:customer/presentation/ui/transfer/view/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  RouteGenerator._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case RouteName.transfer:
        final cardModel = args as List<CardModel>;
        return push(
          ChangeNotifierProvider(
            create: (_) => TransferProvider(cardModel),
            child: const TransferPage(),
          ),
        );
      case RouteName.main:
        return push(
          ChangeNotifierProvider(
            create: (_) => MainProvider(),
            child: const MainPage(),
          ),
        );

      case RouteName.crateCustomer:
        return push(
          ChangeNotifierProvider(
            create: (_) => CreateCustomerProvider(),
            child: const CreateCustomerPage(),
          ),
        );
      default:
        return errorRoute();
    }
  }

  static push(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text("Tezliklə"),
          ),
          body: const Center(
            child: Text(
              "Bu səhifə hələ mövcud deyil.",
            ),
          ),
        );
      },
    );
  }
}
