import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/utils/style/material_theme.dart';

import '../../../../utils/style/spaces.dart';
import '../../../../utils/style/theme.dart';
import '../../controllers/page_controller.dart';

class VerifyPasswordForm extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  const VerifyPasswordForm({super.key, required this.formKey});
  @override
  State<VerifyPasswordForm> createState() => VerifyPasswordFormState();
}

class VerifyPasswordFormState extends State<VerifyPasswordForm>
    with AutomaticKeepAliveClientMixin {
  VerifyPasswordFormState();
  bool busy = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final formKey = widget.formKey;
    final FormPageController controller = Get.find();
    return SingleChildScrollView(
      child: Container(
        padding: gWholePagePadding,
        child: Padding(
          padding: gElementHugePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Enter Your Phone Number☎️",
                style: gTitleTextStyle,
              ),
              gMidVerSpace,
              const Text(
                "We will send an OTP code to your number",
                style: gTextStyle,
              ),
              gHugeVerSpace,
              Container(
                padding: gFormPadding,
                child: Column(
                  children: [
                    FormBuilder(
                      key: formKey,
                      child: Padding(
                        padding: gElementHorizantalSmallPadding,
                        child: FormBuilderTextField(
                          name: "phone_number",
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(8),
                          ],
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: formFillColor,
                            border: formBorder,
                            focusedBorder: formFocusedBorder,
                            label: const Text("Phone Number"),
                            prefixIcon: const Icon(
                              Icons.phone_outlined,
                              color: gThemePrimaryColor,
                            ),
                          ),
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(
                                errorText: "Field can't be empty",
                              ),
                              FormBuilderValidators.equalLength(
                                8,
                                errorText: 'Must be 8 digits',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    gMidVerSpace,
                    Container(
                      padding: gFormPadding,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: gThemePrimaryColor,
                          minimumSize: const Size(double.infinity, 50),
                          shape: const RoundedRectangleBorder(
                            borderRadius: borderRadius,
                          ),
                        ),
                        onPressed: () {
                          controller.nextPage();
                        },
                        child: busy
                            ? const CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation(Colors.white),
                              )
                            : const Center(
                                child: Text(
                                  "Send OTP",
                                  style: gButtonTextStyle,
                                ),
                              ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
