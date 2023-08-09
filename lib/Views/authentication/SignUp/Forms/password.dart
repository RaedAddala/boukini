import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../utils/spaces.dart';
import '../../../../utils/theme.dart';
import '../../controllers/page_controller.dart';
import '../../../../utils/material_theme.dart';

class PasswordForm extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  const PasswordForm({super.key, required this.formKey});
  @override
  State<PasswordForm> createState() => PasswordFormState();
}

class PasswordFormState extends State<PasswordForm> {
  bool busy = false;
  @override
  Widget build(BuildContext context) {
    final formKey = widget.formKey;
    final FormPageController controller = Get.find();

    const requiredMessage = "Field can't be empty";
    final TextEditingController pass = TextEditingController();
    final TextEditingController confirmPass = TextEditingController();

    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Set Your Password",
            style: gTitleTextStyle,
          ),
          gMidVerSpace,
          const Text(
            '''Your Password must contain atleast:
8 characters, 1 uppercase letter, 1 lowercase letter, 1 digit, 1 special character''',
            style: gTextStyle,
          ),
          gMidVerSpace,
          Container(
            padding: gFormPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormBuilder(
                  key: formKey,
                  child: Padding(
                    padding: gElementHorizantalSmallPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: gElementHorizantalHugePadding,
                          child: Text(
                            "Set Your Password :",
                            style: gSecondaryTitleTextStyle,
                          ),
                        ),
                        gSmallVerSpace,
                        FormBuilderTextField(
                          name: "Password",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
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
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: formFillColor,
                            border: formBorder,
                            focusedBorder: formFocusedBorder,
                            hintText: "Enter New Password",
                            hintStyle: gBodyTextStyle,
                            prefixIcon: const Icon(
                              Icons.lock_outlined,
                              color: gThemePrimaryColor,
                            ),
                          ),
                        ),
                        gHugeVerSpace,
                        const Padding(
                          padding: gElementHorizantalHugePadding,
                          child: Text(
                            "Confirm Your Password :",
                            style: gSecondaryTitleTextStyle,
                          ),
                        ),
                        gSmallVerSpace,
                        FormBuilderTextField(
                          name: "ConfirmPassword",
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          obscureText: true,
                          controller: confirmPass,
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                errorText: requiredMessage,
                              ),
                              passwordCheck,
                            ],
                          ),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: formFillColor,
                            border: formBorder,
                            focusedBorder: formFocusedBorder,
                            hintText: "Re-Enter New Password",
                            hintStyle: gBodyTextStyle,
                            prefixIcon: const Icon(
                              Icons.lock_outlined,
                              color: gThemePrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                gBigVerSpace,
                Container(
                  padding: gElementSmallPadding,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: gThemePrimaryColor,
                      minimumSize: const Size(double.infinity, 50),
                      shape: const RoundedRectangleBorder(
                        borderRadius: borderRadius,
                      ),
                    ),
                    onPressed: () {
                      if (formKey.currentState != null &&
                          formKey.currentState!.validate()) {
                        controller.nextPage();
                      }
                    },
                    child: busy
                        ? const CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                        : const Center(
                            child: Text(
                              "Validate",
                              style: gButtonTextStyle,
                            ),
                          ),
                  ),
                ),
                gHugeVerSpace,
              ],
            ),
          ),
        ],
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
