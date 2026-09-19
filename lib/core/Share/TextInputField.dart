import 'package:docdoc_app/core/Utilis/units.dart';
import 'package:docdoc_app/core/style/ColorManager.dart';
import 'package:docdoc_app/core/style/TextStyleManager.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final String label;
  final String? hint;
  final TextStyle? hintTextStyle;
  final Color? backgroundColor;
  final bool isPasswordField;
  final bool? defaultObscureState;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;

  const CustomTextFormField({
    super.key,
    required this.label,
    this.hint,
    this.hintTextStyle,
    this.backgroundColor,
    this.isPasswordField = false,
    this.defaultObscureState,
    this.validator,
    this.controller,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isTextHidden;

  @override
  void initState() {
    super.initState();
    _isTextHidden = widget.defaultObscureState ?? widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    final double fieldRadius = 10;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyleManager.textStyleGreyColor50M14(context),
        ),
        SizedBox(
          height: Units.getHeight(
            context: context,
            value: 12,
          ),
        ),
        TextFormField(
          controller: widget.controller,
          obscureText: _isTextHidden,
          cursorColor: ColorManager.PrimaryColor60,
          validator: widget.validator,
          decoration: InputDecoration(
            hintText: widget.hint ?? '',
            hintStyle: widget.hintTextStyle ??
                TextStyleManager.textStyleGreyColor70R16(context),
            filled: true,
            fillColor: widget.backgroundColor ?? ColorManager.SecondaryForm,
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
            suffixIcon: _buildPasswordVisibilityToggle(),
          ),
        ),
      ],
    );
  }

  Widget? _buildPasswordVisibilityToggle() {
    if (widget.isPasswordField) {
      return IconButton(
        icon: Icon(
          _isTextHidden
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
          color: ColorManager.GreyColor50,
        ),
        onPressed: () {
          setState(() {
            _isTextHidden = !_isTextHidden;
          });
        },
      );
    }
    return null;
  }
}