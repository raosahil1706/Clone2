// import 'package:flutter/material.dart';
// import 'package:flutter_app/Model/CountryModel.dart';
// import 'package:flutter_app/NewScreen/CountryPage.dart';
// import 'package:flutter_app/NewScreen/OtpScreen.dart';

// import '../Verify/Auth_service.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   int start = 30;
//   bool wait = false;
//   String buttonName = "Send";
//   TextEditingController phoneController = TextEditingController();
//   AuthClass authClass = AuthClass();
//   String verificationIdFinal = "";
//   String smsCode = "";
//   String countryname = "India";
//   String countryCode = "+91";
//   final TextEditingController _controller = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         title: const Text(
//           "Enter Your Phone number",
//           style: TextStyle(
//             color: Colors.teal,
//             fontSize: 18,
//             fontWeight: FontWeight.w700,
//             wordSpacing: 1,
//           ),
//         ),
//         centerTitle: true,
//         actions: const [
//           Icon(
//             Icons.more_vert,
//             color: Colors.black,
//           ),
//         ],
//       ),
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           children: [
//             const Text(
//               "WhatsApp will send an sms message to verify your number",
//               style: TextStyle(fontSize: 13.5),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             Text(
//               "What's my number?",
//               style: TextStyle(fontSize: 12.5, color: Colors.cyan[800]),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             countryCard(),
//             const SizedBox(
//               height: 15,
//             ),
//             textField(),
//             Expanded(child: Container()),
//             InkWell(
//               onTap: () {
//                 if (_controller.text.length != 10) {
//                   showMyDilogue1();
//                 } else {
//                   showMyDilogue();
//                 }
//               },
//               child: Container(
//                 color: Colors.tealAccent[400],
//                 height: 40,
//                 width: 70,
//                 child: const Center(
//                   child: Text(
//                     "NEXT",
//                     style: TextStyle(fontWeight: FontWeight.w600),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 40,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget countryCard() {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context,
//             MaterialPageRoute(
//                 builder: (builder) => CountryPage(
//                       setCountryData: setCountryData,
//                     )));
//       },
//       child: Container(
//         width: MediaQuery.of(context).size.width / 1.5,
//         padding: const EdgeInsets.symmetric(vertical: 5),
//         decoration: const BoxDecoration(
//             border: Border(bottom: BorderSide(color: Colors.teal, width: 1.8))),
//         child: Row(
//           children: [
//             Expanded(
//               child: Container(
//                 child: Center(
//                   child: Text(
//                     countryname,
//                     style: const TextStyle(
//                       fontSize: 16,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//             const Icon(
//               Icons.arrow_drop_down,
//               color: Colors.teal,
//               size: 28,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Widget number() {
//   //   return Container(
//   //     width: MediaQuery.of(context).size.width / 1.5,
//   //     height: 38,
//   //     padding: const EdgeInsets.symmetric(vertical: 5),
//   //     child: Row(
//   //       children: [
//   //         Container(
//   //           width: 70,
//   //           decoration: const BoxDecoration(
//   //               border:
//   //                   Border(bottom: BorderSide(color: Colors.teal, width: 1.8))),
//   //           child: Row(
//   //             children: [
//   //               const SizedBox(
//   //                 width: 10,
//   //               ),
//   //               const Text(
//   //                 "+",
//   //                 style: TextStyle(fontSize: 18),
//   //               ),
//   //               const SizedBox(
//   //                 width: 15,
//   //               ),
//   //               Text(
//   //                 countryCode.substring(1),
//   //                 style: const TextStyle(
//   //                   fontSize: 15,
//   //                 ),
//   //               ),
//   //             ],
//   //           ),
//   //         ),
//   //         const SizedBox(
//   //           width: 30,
//   //         ),
//   //         Container(
//   //           decoration: const BoxDecoration(
//   //               border:
//   //                   Border(bottom: BorderSide(color: Colors.teal, width: 1.8))),
//   //           width: MediaQuery.of(context).size.width / 1.5 - 100,
//   //           child: TextFormField(
//   //             controller: _controller,
//   //             keyboardType: TextInputType.number,
//   //             decoration: const InputDecoration(
//   //                 border: InputBorder.none,
//   //                 contentPadding: EdgeInsets.all(8),
//   //                 hintText: "phone number"),
//   //           ),
//   //         )
//   //       ],
//   //     ),
//   //   );
//   // }

//   Widget textField() {
//     return Container(
//       width: MediaQuery.of(context).size.width - 40,
//       height: 60,
//       decoration: BoxDecoration(
//         color: const Color(0xff1d1d1d),
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: TextFormField(
//         controller: phoneController,
//         decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: "Enter your number",
//             hintStyle: TextStyle(color: Colors.white54, fontSize: 17),
//             contentPadding: EdgeInsets.symmetric(vertical: 19, horizontal: 8),
//             prefixIcon: Padding(
//               padding: EdgeInsets.symmetric(vertical: 14, horizontal: 15),
//               child: Text(
//                 " (+91) ",
//                 style: TextStyle(color: Colors.white54, fontSize: 17),
//               ),
//             ),
//             suffixIcon: InkWell(
//               onTap: wait
//                   ? null
//                   : () async {
//                       // startTimer();
//                       setState(() {
//                         start = 30;
//                         wait = true;
//                         buttonName = "Resend";
//                       });
//                       await authClass.verifyPhoneNmber(
//                           "+91 ${phoneController.text}", context, setData);
//                     },
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//                 child: Text(
//                   buttonName,
//                   style: TextStyle(
//                       color: wait ? Colors.grey : Colors.white,
//                       fontSize: 17,
//                       fontWeight: FontWeight.bold),
//                 ),
//               ),
//             )),
//       ),
//     );
//   }

//   void setData(verificationId) {
//     setState(() {
//       verificationIdFinal = verificationId;
//     });
//     startTimer();
//   }

//   void setCountryData(CountryModel countryModel) {
//     setState(() {
//       countryname = countryModel.name;
//       countryCode = countryModel.code;
//     });
//     Navigator.pop(context);
//   }

//   Future<void> showMyDilogue() {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             content: SingleChildScrollView(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                   const Text(
//                     "We will be verifying your phone number",
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Text(countryCode + " " + _controller.text,
//                       style: const TextStyle(
//                           fontSize: 14, fontWeight: FontWeight.w500)),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   const Text("Is this ok,or would you like to edit the number",
//                       style: TextStyle(fontSize: 13.5))
//                 ])),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text("edit")),
//               TextButton(
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (builder) => OtpScreen(
//                                   countryCode: countryCode,
//                                   number: _controller.text,
//                                 )));
//                   },
//                   child: const Text("OK")),
//             ],
//           );
//         });
//   }

//   Future<void> showMyDilogue1() {
//     return showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             content: const SingleChildScrollView(
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                   Text(
//                     "Check the number you entered",
//                     style: TextStyle(fontSize: 14),
//                   ),
//                 ])),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Text("OK")),
//             ],
//           );
//         });
//   }
// }
