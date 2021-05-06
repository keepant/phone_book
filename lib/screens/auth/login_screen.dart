import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:phone_book/providers/auth_provider.dart';
import 'package:phone_book/screens/auth/register_screen.dart';
import 'package:phone_book/widgets/custom_label_textfield.dart';
import 'package:phone_book/widgets/custom_modal_loading.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailCtrlr = TextEditingController();
  final _passwordCtrlr = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isHidePassword = true;

  _toggleHidePassword() {
    setState(() {
      _isHidePassword = !_isHidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthProvider>(context);

    return CustomModalLoading(
      inAsyncCall: _auth.isLoading,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Theme.of(context).primaryColor,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(26.0, 65.0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white70,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Login',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height / 6,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35.0),
                    topRight: Radius.circular(35.0),
                  ),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(26.0, 56.0, 26.0, 26.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomLabelTextField('Email'),
                          SizedBox(height: 5.0),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailCtrlr,
                            validator: (value) => value!.isEmpty
                                ? 'Email cannot be empty!'
                                : null,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'takeshi@kovacs.co',
                            ),
                          ),
                          SizedBox(height: 30.0),
                          CustomLabelTextField('Password'),
                          SizedBox(height: 5.0),
                          TextFormField(
                            controller: _passwordCtrlr,
                            obscureText: _isHidePassword,
                            validator: (value) => value!.isEmpty
                                ? 'Password cannot be empty!'
                                : value.length <= 5
                                    ? 'Password should be at least 6 characters'
                                    : null,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Password',
                              suffixIcon: IconButton(
                                icon: Icon(_isHidePassword
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () => _toggleHidePassword(),
                              ),
                            ),
                          ),
                          SizedBox(height: 40.0),
                          InkWell(
                            onTap: () async {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState!.validate()) {
                                await _auth.login(
                                  email: _emailCtrlr.text,
                                  password: _passwordCtrlr.text,
                                );
                              }
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Don\'t have an account? '),
                              InkWell(
                                onTap: () => Get.to(() => RegisterScreen()),
                                child: Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
