import 'package:customer/presentation/ui/create-customer/view/create_customer_button.dart';
import 'package:customer/presentation/ui/create-customer/view/create_customer_fields.dart';
import 'package:flutter/material.dart';

class CreateCustomerBody extends StatelessWidget {
  const CreateCustomerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CreateCustomerFields(),
          Spacer(flex: 5),
          CreateCustomerButton(),
          Spacer(),
        ],
      ),
    );
  }
}
