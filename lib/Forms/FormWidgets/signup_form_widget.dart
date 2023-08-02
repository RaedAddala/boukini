import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hotel_booking/utils/forminput_formatters.dart';
import 'package:hotel_booking/utils/spaces.dart';
import 'package:hotel_booking/utils/style.dart';

class SignUpForm extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  const SignUpForm({super.key, required this.formKey});
  @override
  State<SignUpForm> createState() => SignUpFormState();
}

class SignUpFormState extends State<SignUpForm> {
  SignUpFormState();
  @override
  Widget build(BuildContext context) {
    final formKey = widget.formKey;

    final theme = Theme.of(context);
    final secondaryColor = theme.colorScheme.secondary;

    final TextEditingController pass = TextEditingController();
    final TextEditingController confirmPass = TextEditingController();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
      child: FormBuilder(
        key: formKey,
        child: Column(
          children: [
            Padding(
              padding: gElementVerticalSmallPadding,
              child: FormBuilderTextField(
                name: "Credit Card Number",
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(19),
                  CardNumberInputFormatter(),
                ],
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  label: const Text("Credit Card"),
                  prefixIcon: Icon(
                    Icons.credit_card_outlined,
                    color: secondaryColor,
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: TextStyle(color: secondaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.5,
                      color: secondaryColor,
                    ),
                  ),
                ),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: ('this field must be filled'),
                    ),
                    FormBuilderValidators.creditCard(
                      errorText: ('Enter a valid credit card number'),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: gElementVerticalSmallPadding,
              child: Row(
                children: [
                  Expanded(
                    child: FormBuilderTextField(
                      name: "Security code",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                      decoration: InputDecoration(
                        label: const Text("Security code"),
                        border: const OutlineInputBorder(),
                        labelStyle: TextStyle(color: secondaryColor),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.5,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  gBigHorSpace,
                  Expanded(
                    child: FormBuilderTextField(
                      name: "Expires",
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        CardMonthFilteringText(),
                        CardMonthInputFormatter(),
                      ],
                      decoration: InputDecoration(
                        label: const Text("MM/YY"),
                        border: const OutlineInputBorder(),
                        labelStyle: TextStyle(color: secondaryColor),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 2.5,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: gElementVerticalSmallPadding,
              child: FormBuilderTextField(
                name: 'Name on Card',
                decoration: InputDecoration(
                  label: const Text("Name on Card"),
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: secondaryColor,
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: TextStyle(color: secondaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.5,
                      color: secondaryColor,
                    ),
                  ),
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: "Field must be filled",
                    ),
                    (String? val) {
                      if (val != null &&
                          val.isNotEmpty &&
                          !RegExp(r'^[a-zA-Z]*( *[a-zA-Z]+)* *$')
                              .hasMatch(val.trim())) {
                        return "Invalid String for fullname field";
                      }
                      return null;
                    },
                  ],
                ),
              ),
            ),
            Padding(
              padding: gElementVerticalSmallPadding,
              child: FormBuilderTextField(
                name: 'Email',
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  label: const Text("Email"),
                  prefixIcon: Icon(
                    Icons.mail_outlined,
                    color: secondaryColor,
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: TextStyle(color: secondaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.5,
                      color: secondaryColor,
                    ),
                  ),
                ),
                validator: FormBuilderValidators.email(
                  errorText: 'Enter a valid email',
                ),
              ),
            ),
            Padding(
              padding: gElementVerticalSmallPadding,
              child: FormBuilderTextField(
                name: "Password",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: true,
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: ('this field must be filled'),
                    ),
                    FormBuilderValidators.minLength(
                      8,
                      errorText: ('must contain 8 characters or more'),
                    ),
                    (String? password) {
                      if (!password!.contains(RegExp(r"[a-z]"))) {
                        return "must contain atleast one lowercase letter";
                      }
                      if (!password.contains(RegExp(r"[A-Z]"))) {
                        return "must contain atleast one uppercase letter";
                      }
                      if (!password.contains(RegExp(r"[0-9]"))) {
                        return "must contain atleast one digit";
                      }
                      if (!password
                          .contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                        return "must contain atleast one special character";
                      }
                      return null;
                    },
                  ],
                ),
                controller: pass,
                decoration: InputDecoration(
                  hintText: "Enter New Password",
                  hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 8,
                      fontWeight: FontWeight.w100),
                  label: const Text("Password"),
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: secondaryColor,
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: TextStyle(color: secondaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.5,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: gElementVerticalSmallPadding,
              child: FormBuilderTextField(
                name: "Confirm Password",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: true,
                controller: confirmPass,
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: ('this field must be filled'),
                    ),
                    (String? password) {
                      if (password != null && password.isEmpty) {
                        return "Please Re-Enter New Password";
                      }
                      if (password != pass.text) {
                        return 'Password must be same as above';
                      }
                      return null;
                    },
                  ],
                ),
                decoration: InputDecoration(
                  hintText: "Re-Enter New Password",
                  hintStyle: const TextStyle(
                      color: Colors.grey,
                      fontSize: 8,
                      fontWeight: FontWeight.w100),
                  label: const Text("Confirm Password"),
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: secondaryColor,
                  ),
                  border: const OutlineInputBorder(),
                  labelStyle: TextStyle(color: secondaryColor),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.5,
                      color: secondaryColor,
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
