import 'package:customer/presentation/ui/main/model/card_model.dart';
import 'package:flutter/material.dart';

class MainCustomerCard extends StatelessWidget {
  final CardModel card;
  const MainCustomerCard({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${card.name} ${card.surname}",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  card.birthDate,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: Text(
                card.cardNumber,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Balance: ${card.balance} AZN",
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  card.phoneNumber,
                  style: const TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
