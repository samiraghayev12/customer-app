import 'package:customer/presentation/components/page/base_page.dart';
import 'package:customer/presentation/ui/create-customer/view/create_customer_body.dart';
import 'package:flutter/material.dart';

class CreateCustomerPage extends StatelessWidget with BasePage {
  const CreateCustomerPage({super.key});

  @override
  Widget? title(BuildContext context) {
    return const Text("Create Customer");
  }

  @override
  Widget? body(BuildContext context) {
    return const CreateCustomerBody();
  }
}
