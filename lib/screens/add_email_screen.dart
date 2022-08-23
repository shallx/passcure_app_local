import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:passcure/models/emails.dart';
import 'package:passcure/services/db_services.dart';
import 'package:passcure/shared/constant.dart';
import 'package:passcure/shared/textfield_unfocus.dart';
import 'package:passcure/widgets/text_field.dart';
import '../constants/constant.dart';
import '../shared/themedata.dart' show Margin;

class AddEmailScreen extends StatelessWidget {
  AddEmailScreen({Key key}) : super(key: key);
  final Margin margin = Margin();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Email",
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: margin.all,
            child: FormBuilder(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  MCTextField(
                    'email',
                    keyboardType: TextInputType.emailAddress,
                    isRequired: true,
                    validators: [
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.email(context)
                    ],
                  ),
                  Container(
                    margin: margin.bottom,
                    child: FormBuilderDropdown(
                        name: 'provider',
                        initialValue: emailCategories[0],
                        decoration: Constants.inputDec.copyWith(
                          labelText: "Vendor",
                        ),
                        items: emailCategories
                            .map((e) =>
                                DropdownMenuItem(value: e, child: Text(e)))
                            .toList()),
                  ),
                  MCTextField(
                    'password',
                    validators: [FormBuilderValidators.required(context)],
                    isRequired: true,
                  ),
                  MCTextField(
                    'refNumber',
                    label: 'Number',
                    keyboardType: TextInputType.number,
                  ),
                  MCTextField(
                    'refEmail',
                    label: 'Reference Email',
                    keyboardType: TextInputType.emailAddress,
                    validators: [
                      FormBuilderValidators.email(context),
                    ],
                  ),
                  MCTextField('notes'),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            _formKey.currentState.save();
                            if (_formKey.currentState.validate()) {
                              print(_formKey.currentState.value);
                              Email email =
                                  Email.fromMap(_formKey.currentState.value);
                              DBService().addEmail(email);
                              _formKey.currentState.reset();
                            }
                          },
                          child: Text("Add"),
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            // await DBService().dropTable();
                            List<Email> list = await DBService().getEmails();
                            list.forEach((e) {
                              print("Name: ${e.id}");
                              print("Name: ${e.email}");
                              print("Name: ${e.provider}");
                              print("Roll: ${e.password}");
                              print("Roll: ${e.notes}");
                            });
                          },
                          child: Text("Get"),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
