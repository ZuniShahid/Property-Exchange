import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../constants/custom_validators.dart';
import '../constants/global_variables.dart';

class CountryCodePicker extends StatefulWidget {
  final TextEditingController? phoneController;

  const CountryCodePicker({super.key, this.phoneController});

  @override
  State<CountryCodePicker> createState() => _CountryCodePickerState();
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  String _countryCode = '';
  String initialCountry = 'AE';
  PhoneNumber number = PhoneNumber(isoCode: 'AE');
  late TextEditingController _phoneController;

  @override
  void initState() {
    _phoneController = widget.phoneController!;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.borderColor, width: 0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          border: OutlineInputBorder(
            borderSide:
                const BorderSide(color: AppColors.borderColor, width: 0.7),
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 0.7,
            ),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24.0),
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            print(number.phoneNumber);
            print(number);
            if (_phoneController.text.isNotEmpty &&
                _phoneController.text.startsWith('0')) {
              print('_PHONECONTROLLER: ${_phoneController.text}');
              _phoneController.clear();
              setState(() {});
              return;
            }
            setState(() {
              _countryCode = number.dialCode.toString();
            });
          },
          onInputValidated: (bool value) {},
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            setSelectorButtonAsPrefixIcon: true,
          ),
          ignoreBlank: true,
          autoValidateMode: AutovalidateMode.disabled,
          selectorTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
          hintText: 'Phone Number',
          initialValue: number,
          inputDecoration: InputDecoration(
              border: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              hintText: 'Phone Number',
              hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          textStyle: const TextStyle(
            color: Colors.white,
          ),
          cursorColor: Colors.white,
          spaceBetweenSelectorAndTextField: 0,
          validator: (String? value) => CustomValidator.number(value),
          textFieldController: _phoneController,
          formatInput: true,
          keyboardType: const TextInputType.numberWithOptions(
              signed: false, decimal: false),
          inputBorder: InputBorder.none,
          onSaved: (PhoneNumber number) {
            print('On Saved: $number');
          },
        ),
      ),
    );
  }
}
