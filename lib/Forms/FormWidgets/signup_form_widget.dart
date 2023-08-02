import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hotel_booking/utils/forminput_formatters.dart';
import 'package:hotel_booking/utils/spaces.dart';
import 'package:hotel_booking/utils/style.dart';

import 'form_style.dart';

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
    const requiredMessage = "Field can't be empty";
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
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: formFillColor,
                  border: formBorder,
                  focusedBorder: formFocusedBorder,
                  label: Text("Credit Card"),
                  prefixIcon: Icon(
                    Icons.credit_card_outlined,
                    color: gThemePrimaryColor,
                  ),
                  labelStyle: labelStyle,
                ),
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: requiredMessage,
                    ),
                    FormBuilderValidators.creditCard(
                      errorText: 'Enter a valid credit card number',
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
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(
                            errorText: requiredMessage,
                          ),
                          (String? val) {
                            if (val != null && val.length < 3) {
                              return "Must contain atleast 3 digits";
                            }
                            return null;
                          }
                        ],
                      ),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: formFillColor,
                        border: formBorder,
                        focusedBorder: formFocusedBorder,
                        label: Text("Security Code"),
                        labelStyle: labelStyle,
                      ),
                    ),
                  ),
                  gMidHorSpace,
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
                      validator: FormBuilderValidators.compose(
                        [
                          FormBuilderValidators.required(
                            errorText: requiredMessage,
                          ),
                          (String? val) {
                            if (val != null && val.length < 5) {
                              return "Fill this field";
                            }
                            return null;
                          }
                        ],
                      ),
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: formFillColor,
                        border: formBorder,
                        focusedBorder: formFocusedBorder,
                        label: Text("Expiry Date"),
                        labelStyle: labelStyle,
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
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: formFillColor,
                  border: formBorder,
                  focusedBorder: formFocusedBorder,
                  label: Text("Name on Card"),
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    color: gThemePrimaryColor,
                  ),
                  labelStyle: labelStyle,
                ),
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: FormBuilderValidators.compose(
                  [
                    FormBuilderValidators.required(
                      errorText: requiredMessage,
                    ),
                    (String? val) {
                      if (val != null &&
                          val.isNotEmpty &&
                          !RegExp(r'^[a-zA-Z]*( *[a-zA-Z]+)* *$')
                              .hasMatch(val.trim())) {
                        return "Invalid String for Fullname field";
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
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: formFillColor,
                  border: formBorder,
                  focusedBorder: formFocusedBorder,
                  label: Text("Email"),
                  prefixIcon: Icon(
                    Icons.mail_outlined,
                    color: gThemePrimaryColor,
                  ),
                  labelStyle: labelStyle,
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
                      errorText: requiredMessage,
                    ),
                    FormBuilderValidators.minLength(
                      8,
                      errorText: 'Must contain 8 characters or more',
                    ),
                    passwordCheck,
                  ],
                ),
                controller: pass,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: formFillColor,
                  border: formBorder,
                  focusedBorder: formFocusedBorder,
                  hintText: "Enter New Password",
                  hintStyle: gBodyTextStyle,
                  label: Text("Password"),
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: gThemePrimaryColor,
                  ),
                  labelStyle: labelStyle,
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
                      errorText: requiredMessage,
                    ),
                    passwordCheck,
                  ],
                ),
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: formFillColor,
                  border: formBorder,
                  focusedBorder: formFocusedBorder,
                  hintText: "Re-Enter New Password",
                  hintStyle: gBodyTextStyle,
                  label: Text("Confirm Password"),
                  prefixIcon: Icon(
                    Icons.lock_outlined,
                    color: gThemePrimaryColor,
                  ),
                  labelStyle: labelStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String? passwordCheck(String? password) {
  if (!password!.contains(RegExp(r"[a-z]"))) {
    return "Must contain atleast one lowercase letter";
  }
  if (!password.contains(RegExp(r"[A-Z]"))) {
    return "Must contain atleast one uppercase letter";
  }
  if (!password.contains(RegExp(r"[0-9]"))) {
    return "Must contain atleast one digit";
  }
  if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return "Must contain atleast one special character";
  }
  return null;
}
