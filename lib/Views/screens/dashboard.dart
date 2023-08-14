import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("data");
  }
}


// BottomAppBar(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             IconButton(
//               icon: Icon(Icons.home),
//               onPressed: () {
//                 // Navigate to home
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.bookmark),
//               onPressed: () {
//                 // Navigate to saved items
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.list),
//               onPressed: () {
//                 // Navigate to catalogue
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.settings),
//               onPressed: () {
//                 // Navigate to settings
//               },
//             ),
//           ],
//         ),
//       ),