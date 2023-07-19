import 'package:customer/presentation/components/page/base_page.dart';
import 'package:customer/presentation/ui/transfer/view/transfer_body.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatelessWidget with BasePage {
  const TransferPage({super.key});

  @override
  Widget? title(BuildContext context) {
    return const Text("Transfer");
  }

  @override
  Widget? body(BuildContext context) {
    return const TransferBody();
  }
}
