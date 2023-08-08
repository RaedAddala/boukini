import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PhoneNumberForm extends StatefulWidget {
  const PhoneNumberForm({super.key});
  @override
  State<PhoneNumberForm> createState() => _PhoneNumberFormState();
}

class _PhoneNumberFormState extends State<PhoneNumberForm> {
  bool busy = false;
  bool numberFound = false;
  bool notSameSession = false;
  final myController = TextEditingController();
  final formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Connect",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SafeArea(
        child: const Text("hi"),
      ),
    );
  }
}

//  child: Container(
//           padding: gWholePagePadding,
//           child: Padding(
//             padding: gElementHugePadding,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 gHugeVerSpace,
//                 const Text(
//                   "Enter Your Phone Number",
//                   style: gTitleTextStyle,
//                 ),
//                 gMidVerSpace,
//                 const Text(
//                   "We will send an OTP code to your phone",
//                   style: gTextStyle,
//                 ),
//                 gHugeVerSpace,
//                 Container(
//                   padding: gFormPadding,
//                   child: Column(
//                     children: [
//                       FormBuilder(
//                         key: formKey,
//                         child: Padding(
//                           padding: gElementHorizantalSmallPadding,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               const Padding(
//                                 padding: gElementHorizantalHugePadding,
//                                 child: Text(
//                                   "Phone Number :",
//                                   style: gSecondaryTitleTextStyle,
//                                 ),
//                               ),
//                               gMidVerSpace,
//                               FormBuilderTextField(
//                                 name: "phone_number",
//                                 controller: myController,
//                                 onTapOutside: (event) {
//                                   FocusManager.instance.primaryFocus
//                                       ?.unfocus();
//                                 },
//                                 keyboardType: TextInputType.number,
//                                 inputFormatters: [
//                                   FilteringTextInputFormatter.digitsOnly,
//                                   LengthLimitingTextInputFormatter(8),
//                                 ],
//                                 autovalidateMode:
//                                     AutovalidateMode.onUserInteraction,
//                                 decoration: const InputDecoration(
//                                   filled: true,
//                                   fillColor: formFillColor,
//                                   border: formBorder,
//                                   focusedBorder: formFocusedBorder,
//                                   prefixIcon: Icon(
//                                     Icons.phone_outlined,
//                                     color: gThemePrimaryColor,
//                                   ),
//                                 ),
//                                 validator: FormBuilderValidators.compose(
//                                   [
//                                     FormBuilderValidators.required(
//                                       errorText: "Field can't be empty",
//                                     ),
//                                     FormBuilderValidators.equalLength(
//                                       8,
//                                       errorText: 'Must be 8 digits',
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       gMidVerSpace,
//                       Container(
//                         padding: gElementSmallPadding,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: gThemePrimaryColor,
//                             minimumSize: const Size(double.infinity, 50),
//                             shape: const RoundedRectangleBorder(
//                               borderRadius: borderRadius,
//                             ),
//                           ),
//                           onPressed: () {
//                             if (formKey.currentState != null &&
//                                 formKey.currentState!.validate()) {
//                               if (numberFound) {
//                                 Get.to(
//                                   LogInForms(skipOtp: notSameSession),
//                                   transition: Transition.leftToRightWithFade,
//                                   arguments: <String, String>{
//                                     "phone_number": myController.text
//                                   },
//                                 );
//                               } else {
//                                 Get.to(
//                                   const SignUpForms(),
//                                   transition: Transition.leftToRightWithFade,
//                                   arguments: <String, String>{
//                                     "phone_number": myController.text
//                                   },
//                                 );
//                               }
//                             }
//                           },
//                           child: busy
//                               ? const CircularProgressIndicator(
//                                   valueColor:
//                                       AlwaysStoppedAnimation(Colors.white),
//                                 )
//                               : const Center(
//                                   child: Text(
//                                     "Validate",
//                                     style: gButtonTextStyle,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
      