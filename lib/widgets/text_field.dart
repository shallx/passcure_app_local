import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:passcure/shared/constant.dart';
import 'package:passcure/shared/themedata.dart';

class MCTextField extends StatelessWidget {
  MCTextField(this.name, {this.label, this.keyboardType = TextInputType.text,this.isRequired = false, this.validators, this.bottomMargin});

  final String name, label;
  final TextInputType keyboardType;
  final validators;
  final bool isRequired;
  final double bottomMargin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: Margin(bottomMargin ?? 15).bottom,
      child: FormBuilderTextField(
        name: name,
        keyboardType: keyboardType,
        validator: FormBuilderValidators.compose(validators ?? []),
        decoration: Constants.inputDec.copyWith(
          labelText: Helper.toUC(label ?? name),
          suffix: isRequired
              ? Text(
                  "required",
                  style: TextStyle(color: Colors.red),
                )
              : SizedBox(),
        ),
      ),
    );
  }
}