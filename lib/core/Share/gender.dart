import 'package:docdoc_app/core/Utilis/units.dart';
import 'package:docdoc_app/core/style/ColorManager.dart';
import 'package:docdoc_app/core/style/TextStyleManager.dart';
import 'package:flutter/material.dart';

class GenderDropdownField extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onSelectionChanged;
  final FormFieldValidator<String>? validator;

  const GenderDropdownField({
    super.key,
    required this.value,
    required this.onSelectionChanged,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final double fieldRadius = 10;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Units.getHeight(
            context: context,
            value: 12,
          ),
        ),
        DropdownButtonFormField<String>(
          value: value,
          validator: validator,
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: ColorManager.GreyColor50,
          ),
          style: TextStyleManager.textStyleGreyColor70R16(
            context,
          ),
          dropdownColor: ColorManager.WhiteBackground,
          decoration: InputDecoration(
            hintText: 'Gender',
            hintStyle: TextStyleManager.textStyleGreyColor50M14(context),
            filled: true,
            fillColor: ColorManager.SecondaryForm,
            contentPadding: EdgeInsets.symmetric(
              horizontal: Units.getWidth(
                context: context,
                value: 20,
              ),
              vertical: Units.getHeight(
                context: context,
                value: 16,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(fieldRadius),
              borderSide: BorderSide(
                color: ColorManager.GreyColor30,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(fieldRadius),
              borderSide: BorderSide(
                color: ColorManager.PrimaryColor60,
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(fieldRadius),
              borderSide: BorderSide(
                color: ColorManager.SecondaryFillRed,
                width: 1,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(fieldRadius),
              borderSide: BorderSide(
                color: ColorManager.SecondaryFillRed,
                width: 1.5,
              ),
            ),
          ),
          items: const [
            DropdownMenuItem(
              value: 'male',
              child: Text('Male'),
            ),
            DropdownMenuItem(
              value: 'female',
              child: Text('Female'),
            ),
          ],
          onChanged: onSelectionChanged,
        ),
      ],
    );
  }
}