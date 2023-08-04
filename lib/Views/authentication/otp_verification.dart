import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../utils/spaces.dart';
import '../../utils/theme.dart';
import 'controllers/input_formatters.dart';
import 'controllers/page_controller.dart';
import 'styles/form_style.dart';

class OTPverificationForm extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final String phoneNumber;
  const OTPverificationForm({
    super.key,
    required this.formKey,
    required this.phoneNumber,
  });
  @override
  State<OTPverificationForm> createState() => OTPverificationFormState();
}

class OTPverificationFormState extends State<OTPverificationForm> {
  final TextEditingController field1 = TextEditingController();
  final TextEditingController field2 = TextEditingController();
  final TextEditingController field3 = TextEditingController();
  final TextEditingController field4 = TextEditingController();

  bool busy = false;
  @override
  Widget build(BuildContext context) {
    final formKey = widget.formKey;
    final FormPageController controller = Get.find();
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          gBigVerSpace,
          const Text(
            "Confirm Your Number ☎️",
            style: gTitleTextStyle,
          ),
          gMidVerSpace,
          Text(
            "Enter the code we sent to the number XXXX-${widget.phoneNumber.substring(3)}",
            style: gTextStyle,
          ),
          gMidVerSpace,
          Container(
            padding: gFormPadding,
            child: Column(
              children: [
                FormBuilder(
                  key: formKey,
                  child: Padding(
                    padding: gElementHorizantalSmallPadding,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: gElementSmallPadding,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              OtpInput(field1, true), // auto focus
                              OtpInput(field2, false),
                              OtpInput(field3, false),
                              OtpInput(field4, false),
                            ],
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
                              "Check Code",
                              style: gButtonTextStyle,
                            ),
                          ),
                  ),
                ),
                gHugeVerSpace,
                TextButton(
                  onPressed: () {
                    Get.dialog(
                      AlertDialog(
                        title: const Text('Code'),
                        content: const Text('Code was resend to you'),
                        actions: [
                          TextButton(
                            child: const Text("Close"),
                            onPressed: () => Get.back(),
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Send Code Again",
                    style: gSecondaryTitleTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      child: FormBuilderTextField(
        name: "otp",
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(2),
          NewDigitReplaceOld(),
        ],
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: const InputDecoration(
          filled: true,
          fillColor: formFillColor,
          border: formBorder,
          focusedBorder: formFocusedBorder,
        ),
        validator: FormBuilderValidators.compose(
          [
            FormBuilderValidators.required(errorText: ""),
          ],
        ),
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        controller: controller,
        onChanged: (value) {
          if (value?.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
