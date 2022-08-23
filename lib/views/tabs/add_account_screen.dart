import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:passcure/models/accounts.dart';
import 'package:passcure/models/category.dart';
import 'package:passcure/models/emails.dart';
import 'package:passcure/services/db_services.dart';
import 'package:passcure/shared/constant.dart';
import 'package:passcure/shared/textfield_unfocus.dart';
import 'package:passcure/widgets/fallback_widget.dart';
import 'package:passcure/widgets/text_field.dart';
import '../../../shared/themedata.dart' show Margin;

class AddAccountScreen extends StatefulWidget {
  AddAccountScreen({Key key}) : super(key: key);

  @override
  _AddAccountScreenState createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<AddAccountScreen> {
  final Margin margin = Margin();

  List<Category> categories = [
    Category(id: 1, accountType: 'Social'),
    Category(id: 2, accountType: 'Gaming'),
    Category(id: 3, accountType: 'Educational'),
    Category(id: 4, accountType: 'Other'),
  ];

  List<Email> emails;
  bool isLoading = true;

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void initState() {
    _getMails();
    super.initState();
  }

  _getMails() async {
    setState(() => isLoading = true);
    emails = await DBService().getEmails();
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Unfocus(
      child: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                margin: margin.all,
                child: FormBuilder(
                  key: _formKey,
                  // autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    children: [
                      FallbackWidget(
                        check: emails,
                        fallbackWidget: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            "Please Create and Email First\nTo Add Account",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        child: () => Container(
                          margin: margin.bottom,
                          child: FormBuilderDropdown(
                            name: 'emailId',
                            initialValue: emails.first.id,
                            decoration: Constants.inputDec,
                            items: emails
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(e.email),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                      Container(
                        margin: margin.bottom,
                        child: FormBuilderDropdown(
                          name: 'categoryId',
                          initialValue: categories[0].id,
                          decoration: Constants.inputDec
                              .copyWith(labelText: "Category"),
                          items: categories
                              .map((e) => DropdownMenuItem(
                                  value: e.id, child: Text(e.accountType)))
                              .toList(),
                        ),
                      ),
                      MCTextField(
                        'userName',
                      ),
                      MCTextField(
                        'password',
                        validators: [
                          FormBuilderValidators.required(),
                        ],
                      ),
                      MCTextField(
                        'domainName',
                        label: 'Domain Name',
                        keyboardType: TextInputType.number,
                      ),
                      MCTextField(
                        'domainLink',
                        label: 'Link',
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
                                  Account account = Account.fromMap(
                                      _formKey.currentState.value);
                                  DBService().addAccount(account);
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
                                List<Account> list =
                                    await DBService().getAccounts();
                                inspect(list);
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
    );
  }
}
