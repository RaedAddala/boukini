import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import 'controllers/input_formatters.dart';
import 'controllers/page_controller.dart';

class OTPverificationForm extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  final String phoneNumber;
  const OTPverificationForm({
    super.key,
    required this.formKey,
    required this.phoneNumber,
  });
  @override
  State<OTPverificationForm> createState() => _OTPverificationFormState();
}

class _OTPverificationFormState extends State<OTPverificationForm> {
  final TextEditingController _field1 = TextEditingController();
  final TextEditingController _field2 = TextEditingController();
  final TextEditingController _field3 = TextEditingController();
  final TextEditingController _field4 = TextEditingController();
  late final GlobalKey<FormBuilderState> formKey;
  late final String phoneNumber;
  @override
  void dispose() {
    _field1.dispose();
    _field2.dispose();
    _field3.dispose();
    _field4.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    formKey = widget.formKey;
    phoneNumber = widget.phoneNumber;
  }

  bool busy = false;
  @override
  Widget build(BuildContext context) {
    final FormPageController controller = Get.find();
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 5,
            ),
            Text(
              "Confirm Your Phone Number",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 5,
            ),
            Text(
              "Enter the code we sent to the number XXXX-${phoneNumber.substring(3)}\n",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FormBuilder(
                key: formKey,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      OtpInput(_field1, true), // auto focus
                      OtpInput(_field2, false),
                      OtpInput(_field3, false),
                      OtpInput(_field4, false),
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
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
                          "Confirm",
                        ),
                      ),
              ),
              const SizedBox(
                height: 12,
              ),
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
                ),
              ),
            ],
          ),
        ),
      ],
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
