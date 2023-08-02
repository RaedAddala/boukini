import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:hotel_booking/utils/spaces.dart';
import 'package:hotel_booking/utils/style.dart';

// Generic Widget used to build The forms Interfaces using widgets that define the forms
class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subtitle;

  /// The text to show in the main button on the view
  final String mainButtonTitle;

  /// The form to show in the middle of the layout
  //final WidgetBuilder formBuilder;
  final Widget form;
  final GlobalKey<FormBuilderState> formKey;

  /// Called when the main button is pressed
  final Function onMainButtonTapped;

  /// Called when the on screen back button is tapped
  final Function? onBackPressed;

  /// Indicates if the form is busy or not
  final bool busy;

  const AuthenticationLayout({
    required this.title,
    required this.subtitle,
    required this.form,
    required this.formKey,
    required this.onMainButtonTapped,
    this.onBackPressed,
    this.mainButtonTitle = 'CONTINUE',
    this.busy = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: gWholePagePadding,
        child: Padding(
          padding: gElementHorizantalSmallPadding,
          child: Column(
            children: [
              if (onBackPressed == null) gSmallVerSpace,
              if (onBackPressed != null)
                Row(
                  children: [
                    IconButton(
                      iconSize: gTitleTextSize * 1.4,
                      onPressed: () {
                        onBackPressed!();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: gThemeOnSecondaryTextColor,
                      ),
                      padding: EdgeInsets.zero,
                      alignment: Alignment.centerLeft,
                    ),
                    Padding(
                      padding: gElementHorizantalHugePadding,
                      child: Expanded(
                        child: Text(
                          title,
                          style: gTitleTextStyle,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ],
                ),
              gMidVerSpace,
              SizedBox(
                width: screenWidthPercentage(context, percentage: 0.95),
                child: Text(
                  subtitle,
                  style: gSecondaryTitleTextStyle,
                ),
              ),
              gSmallVerSpace,
              form,
              gTinyVerSpace,
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: gThemePrimaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState != null &&
                        formKey.currentState!.validate()) {
                      onMainButtonTapped();
                    }
                  },
                  child: busy
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(Colors.white),
                        )
                      : Text(
                          mainButtonTitle,
                          style: gButtonTextStyle,
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//     return SingleChildScrollView(
//       child: Container(
//         padding: const EdgeInsets.all(25),
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               if (onBackPressed == null) gBigVerSpace,
//               if (onBackPressed != null) gMidVerSpace,
//               if (onBackPressed != null)
//                 Row(
//                   children: [
//                     IconButton(
//                       padding: EdgeInsets.zero,
//                       alignment: Alignment.centerLeft,
//                       onPressed: () {
//                         onBackPressed!();
//                       },
//                       icon: const Icon(
//                         Icons.arrow_back,
//                         color: gThemeOnSecondaryTextColor,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Center(
//                       child: Text(
//                         title,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 18,
//                         ),
//                       ),
//                     )
//                   ],
//                 ),
//               gSmallVerSpace,
//               Center(
//                 child: Text(
//                   title,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 36,
//                   ),
//                 ),
//               ),
//               gSmallVerSpace,
//               SizedBox(
//                 width: screenWidthPercentage(context, percentage: 0.7),
//                 child: Text(
//                   subtitle,
//                   style: gBodyTextStyle,
//                 ),
//               ),
//               gSmallVerSpace,
//               form,
//               gSmallVerSpace,
//               ElevatedButton(
//                 onPressed: () {
//                   if (formKey.currentState!.validate()) {
//                     onMainButtonTapped();
//                   }
//                 },
//                 child: Container(
//                   width: double.infinity,
//                   height: 50,
//                   alignment: Alignment.center,
//                   decoration: BoxDecoration(
//                     color: themeColor.onPrimary,
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: busy
//                       ? const CircularProgressIndicator(
//                           valueColor: AlwaysStoppedAnimation(Colors.white),
//                         )
//                       : Text(
//                           mainButtonTitle,
//                           style: TextStyle(
//                             color: themeColor.onSecondary,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
