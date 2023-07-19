import 'package:customer/presentation/router/navigation.dart';
import 'package:customer/presentation/router/route_generator.dart';
import 'package:customer/presentation/ui/main/provider/main_provider.dart';
import 'package:customer/presentation/ui/main/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
      navigatorKey: Navigation.navigatorKey,
      home: ChangeNotifierProvider(
        create: (_) => MainProvider(),
        child: const MainPage(),
      ),
    );
  }
}
