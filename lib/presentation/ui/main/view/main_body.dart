import 'package:customer/presentation/components/button/primary_button.dart';
import 'package:customer/presentation/router/navigation.dart';
import 'package:customer/presentation/router/route_name.dart';
import 'package:customer/presentation/ui/main/provider/main_provider.dart';
import 'package:customer/presentation/ui/main/view/main_button.dart';
import 'package:customer/presentation/ui/main/view/main_customer_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainBody extends StatelessWidget {
  const MainBody({super.key});

  @override
  Widget build(BuildContext context) {
    final mainProvider = context.watch<MainProvider>();
    if (mainProvider.cards.isEmpty) {
      return Center(
        child: PrimaryButton(
            title: "create customer".toUpperCase(),
            didTap: () async {
              final result = await Navigation.push(RouteName.crateCustomer);
              if (result != null) {
                mainProvider.addCard(result);
              }
            }),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(height: 20),
              itemCount: mainProvider.cards.length,
              itemBuilder: (context, index) {
                final card = mainProvider.cards[index];
                return Dismissible(
                  key: Key(card.cardNumber),
                  onDismissed: (direction) {
                    mainProvider.removeCard(card);
                  },
                  behavior: HitTestBehavior.opaque,
                  background: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        "Delete Card",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                  child: MainCustomerCard(card: card),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          if (mainProvider.cards.length > 1) const MainButton(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
