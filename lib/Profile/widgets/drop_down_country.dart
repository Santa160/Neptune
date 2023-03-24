import 'package:flutter/material.dart';

import '../../core/core.dart';

class DropDownCountry extends StatelessWidget {
  final String country;
  final String? countryData;
  final List<DropdownMenuItem<String>>? items;
  final Function(String?)? onChanged;
  const DropDownCountry(
      {super.key,
      required this.country,
      required this.countryData,
      this.items,
      this.onChanged});

  @override
  Widget build(BuildContext context) {
    final sizeData = MediaQuery.of(context).size;
    return Container(
      width: sizeData.width * 0.15,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: ColorManager.conatinerColors,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          hint: Text(country),
          // Initial Value
          // Down Arrow Icon
          value: countryData,
          icon: const Icon(Icons.keyboard_arrow_down),
          // Array list of items
          items: items,
          // After selecting the desired option,it will
          // change button value to selected value
          onChanged: onChanged,
        ),
      ),
    );
  }
}
