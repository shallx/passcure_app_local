import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:passcure/models/emails.dart';
import 'package:passcure/services/db_services.dart';
import 'package:passcure/shared/textfield_unfocus.dart';
import 'package:passcure/widgets/text_field.dart';
import '../shared/themedata.dart' show Margin;

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);
  final Margin margin = Margin();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            margin: margin.all,
            child: FormBuilder(
              key: _formKey,
              // autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  Container(
                    margin: margin.bottom,
                    child: Text(
                      "Add Email",
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  MCTextField(
                    'email',
                    keyboardType: TextInputType.emailAddress,
                    isRequired: true,
                    validators: [
                      FormBuilderValidators.required(context),
                      FormBuilderValidators.email(context)
                    ],
                  ),
                  MCTextField('provider',
                      validators: [FormBuilderValidators.required(context)]),
                  MCTextField(
                    'password',
                    validators: [FormBuilderValidators.required(context)],
                    isRequired: true,
                  ),
                  MCTextField('refNumber', label: 'Number'),
                  MCTextField(
                    'refEmail',
                    label: 'Reference Email',
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
                            List<Email> list = await DBService().getEmails();
                            list.forEach((e) {
                              print("Name: ${e.email}");
                              print("Roll: ${e.password}");
                            });
                          },
                          child: Text("Get"),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//   Widget buildTF(BuildContext context, String name,
//       {String label,
//       TextInputType keyboardType,
//       var validators,
//       bool isRequired = false,
//       double bottomMargin}) {
//     return Container(
//       margin: Margin(bottomMargin ?? 15).bottom,
//       child: FormBuilderTextField(
//         name: name,
//         keyboardType: keyboardType ?? TextInputType.text,
//         // validator: FormBuilderValidators.compose([
//         //   FormBuilderValidators.required(context),
//         // ]),
//         validator: FormBuilderValidators.compose(validators ?? []),
//         decoration: Constants.inputDec.copyWith(
//           labelText: Helper.toUC(label ?? name),
//           suffix: isRequired
//               ? Text(
//                   "required",
//                   style: TextStyle(color: Colors.red),
//                 )
//               : SizedBox(),
//         ),
//       ),
//     );
//   }
}
