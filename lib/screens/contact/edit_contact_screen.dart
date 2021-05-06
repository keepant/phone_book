import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:phone_book/data/models/contact_model.dart';
import 'package:phone_book/providers/contact_provider.dart';
import 'package:phone_book/widgets/custom_button_full.dart';
import 'package:phone_book/widgets/custom_modal_loading.dart';
import 'package:phone_book/widgets/custom_text_field.dart';
import 'package:provider/provider.dart';

class EditContactScreen extends StatefulWidget {
  final ContactData contact;

  const EditContactScreen(this.contact);
  @override
  _EditContactScreenState createState() => _EditContactScreenState();
}

class _EditContactScreenState extends State<EditContactScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _nameCtrlr = TextEditingController();
  TextEditingController _phoneCtrlr = TextEditingController();
  TextEditingController _emailCtrlr = TextEditingController();
  TextEditingController _jobCtrlr = TextEditingController();
  TextEditingController _companyCtrlr = TextEditingController();

  @override
  void initState() {
    _nameCtrlr.text = widget.contact.name!;
    _phoneCtrlr.text = widget.contact.phone!;
    _emailCtrlr.text = widget.contact.email!;
    _jobCtrlr.text = widget.contact.job!;
    _companyCtrlr.text = widget.contact.company!;

    super.initState();
  }

  File? _image;
  final picker = ImagePicker();

  void _imagePicker() {
    Get.dialog(
      AlertDialog(
        title: Text('Pick one'),
        content: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () async {
                Get.back();
                final pickedFile =
                    await picker.getImage(source: ImageSource.gallery);

                setState(() {
                  if (pickedFile != null) {
                    _image = File(pickedFile.path);
                  } else {
                    print('No image selected.');
                  }
                });
              },
              icon: Icon(Icons.photo_library_rounded),
              label: Text('Gallery'),
            ),
            TextButton.icon(
              style: TextButton.styleFrom(
                primary: Colors.black,
              ),
              onPressed: () async {
                Get.back();
                final pickedFile =
                    await picker.getImage(source: ImageSource.camera);

                setState(() {
                  if (pickedFile != null) {
                    _image = File(pickedFile.path);
                  } else {
                    print('No image selected.');
                  }
                });
              },
              icon: Icon(Icons.camera_alt_rounded),
              label: Text('Camera'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final _contact = Provider.of<ContactProvider>(context);

    return CustomModalLoading(
      inAsyncCall: _contact.isLoading,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Edit contact'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        child: InkWell(
                          borderRadius: BorderRadius.circular(60.0),
                          onTap: () => _imagePicker(),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            radius: 50,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 46,
                              backgroundImage: (_image != null
                                  ? FileImage(_image!)
                                  : widget.contact.image != null
                                      ? CachedNetworkImageProvider(
                                          widget.contact.image!)
                                      : AssetImage('assets/images/avatar.png')
                                          as ImageProvider),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 3,
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.grey,
                          child: Icon(
                            Icons.camera_alt_rounded,
                            size: 18.0,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  controller: _nameCtrlr,
                  label: 'Name',
                ),
                SizedBox(height: 15.0),
                CustomTextField(
                  keyboardType: TextInputType.number,
                  controller: _phoneCtrlr,
                  label: 'Phone',
                ),
                SizedBox(height: 15.0),
                CustomTextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailCtrlr,
                  label: 'Email',
                ),
                SizedBox(height: 15.0),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  controller: _jobCtrlr,
                  label: 'Job',
                ),
                SizedBox(height: 15.0),
                CustomTextField(
                  keyboardType: TextInputType.text,
                  controller: _companyCtrlr,
                  label: 'Company',
                ),
                SizedBox(height: 30.0),
                CustomButtonFull(
                  label: 'Save'.toUpperCase(),
                  onPressed: () async {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate()) {
                      await _contact.updateContactById(
                        id: widget.contact.id!,
                        name: _nameCtrlr.text,
                        phone: _phoneCtrlr.text,
                        email: _emailCtrlr.text,
                        job: _jobCtrlr.text,
                        company: _companyCtrlr.text,
                        image: _image?.path,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
