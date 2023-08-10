import 'package:flutter/material.dart';

import '../../../components/custom_datetime_picker.dart';
import '../../../components/custom_phone_field.dart';
import '../../../components/custom_textfield.dart';
import '../../../helper/utils/validators.dart';


class ProvideBasicDetails extends StatelessWidget {
  const ProvideBasicDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Provide Basic Details",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomTextField(
          labelText: "Name",
          showRequired: true,
          hintText: "e.g. Pablo Gabrielo Bilando ",
          validator: Validators.isRequired,
        ),
        const SizedBox(
          height: 15,
        ),
        const CustomPhoneField(
          labelText: "Phone Number",
          showRequired: true,
          hintText: "e.g. 9498234833",
          validator: Validators.isRequired,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            CustomDatetimePicker(
              labelText: "Date Of Birth",
              showRequired: true,
              onDatePicked: (v) {},
              hintText: "Select date",
            ),
            const SizedBox(
              width: 16,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            const CustomTextField(
              labelText: "OA ID Number",
              hintText: "Enter your OA ID",
              showRequired: true,
              validator: Validators.isRequired,
            ),
            const SizedBox(
              width: 16,
            ),
            CustomDatetimePicker(
              labelText: "OA Expiry Date",
              showRequired: true,
              onDatePicked: (v) {},
              hintText: "Select date",
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomTextField(
          labelText: "Address",
          hintText: "e.g. Av. da Liberdade, 1250-142, Lisbon, Portugal",
          showRequired: true,
          validator: Validators.isRequired,
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomTextField(
          labelText: "Bank Name",
          hintText: "Enter name of your bank",
          showRequired: true,
          validator: Validators.isRequired,
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomTextField(
          labelText: "Account Number",
          hintText: "Enter your bank account number",
          showRequired: true,
          validator: Validators.isRequired,
        ),
        const SizedBox(
          height: 20,
        ),
        const Row(
          children: [
            CustomTextField(
              labelText: "TFN/ABN",
              hintText: "Enter your TFN/ABN",
              showRequired: true,
              validator: Validators.isRequired,
            ),
            SizedBox(
              width: 16,
            ),
            CustomTextField(
              labelText: "BSB",
              hintText: "Enter your BSB",
              showRequired: true,
              validator: Validators.isRequired,
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomTextField(
          labelText: "NIF",
          hintText: "Enter your NIF",
          showRequired: true,
          validator: Validators.isRequired,
        ),
        const SizedBox(
          height: 20,
        ),
        const CustomTextField(
          labelText: "IBAN",
          hintText: "Enter your IBAN",
          showRequired: true,
          validator: Validators.isRequired,
        ),
      ],
    );
  }
}
