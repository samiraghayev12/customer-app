import 'package:customer/presentation/components/field/primary_text_field.dart';
import 'package:customer/presentation/ui/create-customer/provider/create_customer_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateCustomerFields extends StatelessWidget {
  const CreateCustomerFields({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CreateCustomerProvider>();
    return Column(
      children: [
        const SizedBox(height: 16),
        PrimaryTextField(
          label: "Name",
          errorText: provider.nameError,
          onChanged: provider.updateName,
        ),
        const SizedBox(height: 16),
        PrimaryTextField(
          onChanged: provider.updateSurname,
          label: "Surname",
          errorText: provider.surnameError,
        ),
        const SizedBox(height: 16),
        PrimaryTextField(
          onTap: () => provider.updateBirthDate(context),
          controller: provider.birthdateController,
          label: "Birth Date",
          readOnly: true,
        ),
        const SizedBox(height: 16),
        PrimaryTextField(
          onChanged: provider.updatePhoneNumber,
          label: "Phone Number",
          textInputType: TextInputType.phone,
          errorText: provider.birthDateError,
        ),
      ],
    );
  }
}
