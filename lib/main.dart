import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hotel_booking/Forms/FormPageLayout/authentication_layout.dart';
import 'package:hotel_booking/Forms/FormWidgets/signup_form_widget.dart';

import './utils/style.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: gThemePrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SafeArea(
          child: AuthenticationLayout(
            title: 'Sign Up',
            subtitle: 'Create your account here',
            form: SignUpForm(formKey: formKey),
            formKey: formKey,
            onMainButtonTapped: () {},
            mainButtonTitle: "Sign Up",
            onBackPressed: () {},
          ),
        ),
      ),
    );
  }
}
