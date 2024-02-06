import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../constants/global_variables.dart';

class CustomDropDown extends StatefulWidget {
  final String dropDownTitle;
  final List<String> items;

  final Function(String?) onValueChanged; // Add this line

  const CustomDropDown(
      {Key? key,
      required this.dropDownTitle,
      required this.items,
      required this.onValueChanged})
      : super(key: key);

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isExpanded: true,
        hint: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            widget.dropDownTitle,
            style: bodyNormal.copyWith(
                color: Colors.white54, fontFamily: "PoppinsSemiBold"),
          ),
        ),
        items: widget.items
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Text(
                      item,
                      style: bodyNormal.copyWith(
                          color: Colors.white,
                          fontFamily: "PoppinsSemiBold",
                          fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
          widget.onValueChanged(selectedValue); // Add this line
        },
        iconStyleData: IconStyleData(
          icon: const Icon(
            Icons.arrow_downward_sharp,
            color: AppColors.greyIcon,
          ),
        ),
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(left: 5, right: 10),
          elevation: 2,
        ),
        dropdownStyleData: DropdownStyleData(
          padding: null,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: AppColors.secondaryColor,
              border: Border.all(width: 2, color: Colors.white24)),
          maxHeight: 135,
          elevation: 8,
          offset: const Offset(-1, -3),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all<double>(6),
            thumbVisibility: MaterialStateProperty.all<bool>(true),
          ),
        ),
        style: TextStyle(
            fontSize: 14,
            color: AppColors.greyIcon,
            fontFamily: 'PoppinsRegular'),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
        ),
      ),
    );
  }
}
