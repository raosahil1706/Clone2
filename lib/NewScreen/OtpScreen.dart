// import 'package:flutter/material.dart';
// import 'package:otp_text_field/otp_text_field.dart';
// import 'package:otp_text_field/style.dart';

// class OtpScreen extends StatefulWidget {
//   const OtpScreen({super.key, required this.countryCode, required this.number});
//   final String number;
//   final String countryCode;

//   @override
//   State<OtpScreen> createState() => _OtpScreenState();
// }

// class _OtpScreenState extends State<OtpScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         centerTitle: true,
//         title: Text(
//           "Verify +${widget.countryCode}${widget.number}",
//           style: TextStyle(fontSize: 16.5, color: Colors.teal),
//         ),
//         actions: [
//           IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.more_vert,
//                 color: Colors.black,
//               )),
//         ],
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         padding: EdgeInsets.symmetric(horizontal: 35),
//         child: Column(
//           children: [
//             SizedBox(
//               height: 60,
//             ),
//             RichText(
//                 text: TextSpan(children: [
//               TextSpan(
//                 text: "We have sent an SMS with a code to",
//                 style: TextStyle(fontSize: 14.5, color: Colors.black),
//               ),
//               TextSpan(
//                 text: "+" + widget.countryCode + " " + widget.number,
//                 style: TextStyle(
//                     fontSize: 14.5,
//                     color: Colors.black,
//                     fontWeight: FontWeight.bold),
//               ),
//               TextSpan(
//                 text: "Wrong number ?",
//                 style: TextStyle(fontSize: 14.5, color: Colors.cyan[800]),
//               ),
//             ])),
//             SizedBox(
//               height: 5,
//             ),
//             OTPTextField(
//               length: 6,
//               width: MediaQuery.of(context).size.width,
//               fieldWidth: 30,
//               style: TextStyle(fontSize: 17),
//               textFieldAlignment: MainAxisAlignment.spaceAround,
//               fieldStyle: FieldStyle.underline,
//               onCompleted: (pin) {
//                 print("Completed: " + pin);
//               },
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "Enter 6-digit Code",
//               style: TextStyle(fontSize: 14, color: Colors.grey[600]),
//             ),
//             SizedBox(
//               height: 30,
//             ),
//             bottomButton(
//               "Resend SMS",
//               Icons.message,
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             Divider(
//               thickness: 1.5,
//             ),
//             SizedBox(
//               height: 12,
//             ),
//             bottomButton("Call Me", Icons.call),
//             SizedBox(
//               height: 12,
//             ),
//             InkWell(
//               onTap: () {
//                 authClass.signInwithPhoneNumber(
//                     verificationIdFinal, smsCode, context);
//               },
//               child: Container(
//                 height: 60,
//                 width: MediaQuery.of(context).size.width - 60,
//                 decoration: BoxDecoration(
//                     color: Color(0xffff9601),
//                     borderRadius: BorderRadius.circular(15)),
//                 child: Center(
//                   child: Text(
//                     "Sign In",
//                     style: TextStyle(
//                       fontSize: 17,
//                       fontWeight: FontWeight.w700,
//                       color: Color(0xfffbe2ae),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget bottomButton(String text, IconData icon) {
//     return Row(
//       children: [
//         Icon(
//           icon,
//           color: Colors.teal,
//           size: 24,
//         ),
//         SizedBox(
//           width: 25,
//         ),
//         Text(
//           text,
//           style: TextStyle(color: Colors.teal, fontSize: 14.5),
//         ),
//       ],
//     );
//   }
// }
