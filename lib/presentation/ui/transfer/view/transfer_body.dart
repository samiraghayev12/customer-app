import 'package:customer/presentation/components/bottom-sheet/bottom_sheet_presenter.dart';
import 'package:customer/presentation/components/button/primary_button.dart';
import 'package:customer/presentation/components/field/primary_text_field.dart';
import 'package:customer/presentation/ui/transfer/provider/transfer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TransferBody extends StatelessWidget {
  const TransferBody({super.key});

  @override
  Widget build(BuildContext context) {
    final transferProvider = context.watch<TransferProvider>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 16),
          PrimaryTextField(
            label: "Card",
            readOnly: true,
            controller: transferProvider.fromCardController,
            onTap: () async {
              final result = await BottomSheetPresenter.showSelectorBottomSheet(
                context: context,
                pickables: transferProvider.cards,
                title: "Select the card",
              );
              if (result != null) {
                transferProvider.selectCard(result, CardSelection.fromCard);
              }
            },
            errorText: transferProvider.cardNumberError,
          ),
          const SizedBox(height: 16),
          PrimaryTextField(
            label: "To Card",
            controller: transferProvider.toCardController,
            onTap: () async {
              final result = await BottomSheetPresenter.showSelectorBottomSheet(
                context: context,
                pickables: transferProvider.cards,
                title: "Select the ",
              );
              if (result != null) {
                transferProvider.selectCard(result, CardSelection.toCard);
              }
            },
            readOnly: true,
            errorText: transferProvider.cardNumberError,
          ),
          const SizedBox(height: 16),
          PrimaryTextField(
            label: "Amount",
            textInputType: TextInputType.phone,
            onChanged: transferProvider.updateAmount,
            errorText: transferProvider.amountError,
          ),
          const SizedBox(height: 36),
          PrimaryButton(
            title: "transfer".toUpperCase(),
            didTap: transferProvider.isFormValid ? () => transferProvider.transfer() : null,
          ),
        ],
      ),
    );
  }
}
