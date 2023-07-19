import 'package:customer/presentation/components/button/primary_button.dart';
import 'package:customer/presentation/router/navigation.dart';
import 'package:customer/presentation/ui/create-customer/provider/create_customer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateCustomerButton extends StatelessWidget {
  const CreateCustomerButton({super.key});

  @override
  Widget build(BuildContext context) {
    final createCustomerProvider = context.watch<CreateCustomerProvider>();
    return PrimaryButton(
      title: "create customer".toUpperCase(),
      didTap: createCustomerProvider.isFormValid
          ? () {
              Navigation.pop(result: createCustomerProvider.card);
            }
          : null,
    );
  }
}
