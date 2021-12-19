// import 'package:flutter/material.dart';
// import 'package:timer_button/timer_button.dart';
//
// class MyHomePage extends StatefulWidget {
//   @override
//   MyHomePageState createState() {
//     return MyHomePageState();
//   }
// }
//
// class MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Timer Button Demo'),
//       ),
//       body: Material(
//         child: Center(
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: <Widget>[
//                 TimerButton(
//                   label: "Raised: Try Again",
//                   timeOutInSeconds: 20,
//                   onPressed: () {},
//                   disabledColor: Colors.red,
//                   color: Colors.deepPurple,
//                   buttonType: ButtonType.RaisedButton,
//                   disabledTextStyle: TextStyle(fontSize: 20.0),
//                   activeTextStyle:
//                       TextStyle(fontSize: 20.0, color: Colors.white),
//                 ),
//                 TimerButton(
//                   label: "Outline: Try Again",
//                   timeOutInSeconds: 10,
//                   onPressed: () {},
//                   disabledColor: Colors.yellow,
//                   activeTextStyle: TextStyle(color: Colors.yellow),
//                   buttonType: ButtonType.OutlineButton,
//                 ),
//                 TimerButton(
//                   label: "Flat: Try Again",
//                   timeOutInSeconds: 5,
//                   onPressed: () {},
//                   buttonType: ButtonType.FlatButton,
//                   color: Colors.green,
//                 ),
//                 TimerButton(
//                   label: "Elevated: Try Again",
//                   timeOutInSeconds: 5,
//                   onPressed: () {},
//                   buttonType: ButtonType.ElevatedButton,
//                   color: Colors.green,
//                 ),
//                 TimerButton(
//                   label: "Outlined: Try Again",
//                   timeOutInSeconds: 5,
//                   onPressed: () {},
//                   buttonType: ButtonType.OutlinedButton,
//                   disabledColor: Colors.deepOrange,
//                   color: Colors.green,
//                   activeTextStyle: TextStyle(color: Colors.yellow),
//                   disabledTextStyle: TextStyle(color: Colors.pink),
//                 ),
//                 TimerButton(
//                   label: "Text: Try Again",
//                   timeOutInSeconds: 5,
//                   onPressed: () {
//                     print("Time for some action!");
//                   },
//                   buttonType: ButtonType.TextButton,
//                   disabledColor: Colors.deepOrange,
//                   color: Colors.green,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
