import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';

import '../../../../utils/spaces.dart';
import '../../../../utils/theme.dart';
import '../../controllers/page_controller.dart';
import '../../styles/form_style.dart';

class CredentialForm extends StatefulWidget {
  final GlobalKey<FormBuilderState> formKey;
  const CredentialForm({super.key, required this.formKey});
  @override
  State<CredentialForm> createState() => CredentialFormState();
}

class CredentialFormState extends State<CredentialForm>
    with AutomaticKeepAliveClientMixin {
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
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: formFillColor,
                            border: formBorder,
                            focusedBorder: formFocusedBorder,
                            label: Text("Phone Number"),
                            prefixIcon: Icon(
                              Icons.phone_outlined,
                              color: gThemePrimaryColor,
                            ),
                            labelStyle: labelStyle,
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
