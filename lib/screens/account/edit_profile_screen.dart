import 'package:flutter/material.dart';
import 'package:phone_book/widgets/custom_button_full.dart';
import 'package:phone_book/widgets/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameCtrlr = TextEditingController();
  TextEditingController _emailCtrlr = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                keyboardType: TextInputType.text,
                controller: _nameCtrlr,
                label: 'Name',
              ),
              SizedBox(height: 15.0),
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailCtrlr,
                label: 'Email',
              ),
              SizedBox(height: 30.0),
              CustomButtonFull(
                label: 'Save'.toUpperCase(),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
