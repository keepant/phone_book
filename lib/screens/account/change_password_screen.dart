import 'package:flutter/material.dart';
import 'package:phone_book/widgets/custom_button_full.dart';
import 'package:phone_book/widgets/custom_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _passwordCtrlr = TextEditingController();

  bool _visiblePasswd = true;

  void _togglePasswd() => setState(() => _visiblePasswd = !_visiblePasswd);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Change Password'),
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
                obscureText: _visiblePasswd,
                controller: _passwordCtrlr,
                label: 'New password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _visiblePasswd ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey[700],
                    size: 20,
                  ),
                  onPressed: () => _togglePasswd(),
                ),
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
