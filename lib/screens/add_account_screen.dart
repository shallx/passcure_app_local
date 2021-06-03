import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:passcure/models/accounts.dart';
import 'package:passcure/models/category.dart';
import 'package:passcure/models/emails.dart';
import 'package:passcure/services/db_services.dart';
import 'package:passcure/shared/constant.dart';
import 'package:passcure/shared/textfield_unfocus.dart';
import 'package:passcure/widgets/text_field.dart';
import '../shared/themedata.dart' show Margin;

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
      child: Scaffold(
        appBar: AppBar(),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
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
                            "Add Account",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ),
                        Container(
                          margin: margin.bottom,
                          child: FormBuilderDropdown(
                            name: 'emailId',
                            initialValue: emails[0].id,
                            decoration: Constants.inputDec,
                            items: emails
                                .map((e) => DropdownMenuItem(
                                    value: e.id, child: Text(e.email)))
                                .toList(),
                          ),
                        ),
                        Container(
                          margin: margin.bottom,
                          child: FormBuilderDropdown(
                            name: 'categoryId',
                            initialValue: categories[0].id,
                            decoration: Constants.inputDec,
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
                            FormBuilderValidators.required(context),
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
                        ElevatedButton(
                          onPressed: () async {
                            _formKey.currentState.save();
                            if (_formKey.currentState.validate()) {
                              print(_formKey.currentState.value);
                              Account account =
                                  Account.fromMap(_formKey.currentState.value);
                              DBService().addAccount(account);
                              _formKey.currentState.reset();
                            }
                          },
                          child: Text("Add this shit"),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            // await DBService().dropTable();
                            List<Account> list = await DBService().getAccounts();
                            list.forEach((e) {
                              print("ID: ${e.id}");
                              print("Email Id: ${e.emailId}");
                              print("Cat Id: ${e.categoryId}");
                              print("userName: ${e.userName}");
                              print("Password: ${e.password}");
                            });
                          },
                          child: Text("Get"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
