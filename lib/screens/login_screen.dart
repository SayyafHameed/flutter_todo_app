// import 'package:flutter/material.dart';
// import 'package:todo_app/shared/components/components.dart';
//
// // ignore: must_be_immutable
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   var emailController = TextEditingController();
//
//   var passController = TextEditingController();
//
//   bool password = true;
//
//   final formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Form(
//               key: formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Login',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   // TextFormField(
//                   //   controller: emailController,
//                   //   keyboardType: TextInputType.emailAddress,
//                   //   onFieldSubmitted: (String value) {
//                   //     print(value);
//                   //   },
//                   //   onChanged: (String value) {
//                   //     print(value);
//                   //   },
//                   //   decoration: InputDecoration(
//                   //     labelText: 'Email Address',
//                   //     prefixIcon: Icon(
//                   //       Icons.email,
//                   //     ),
//                   //     border: const OutlineInputBorder(),
//                   //     hintText: 'Email Address',
//                   //   ),
//                   //   validator: (value) {
//                   //     if (value!.isEmpty) {
//                   //       return 'Please Enter Email Address';
//                   //     }
//                   //     return null;
//                   //   },
//                   // ),
//                   defaultFormField(
//                     controller: emailController,
//                     label: 'Enter Your Email Address',
//                     prefix: Icons.email,
//                     hint: 'Email Address',
//                     type: TextInputType.emailAddress,
//                     validate: (String value) {
//                       if (value.isEmpty)
//                       {
//                         return 'Please Enter Email Address';
//                       }
//                       return null;
//                     },
//                     onChange: (String value){
//                       print(value);
//                     },
//                   ),
//                   const SizedBox(
//                     height: 20.0,
//                   ),
//                   // TextFormField(
//                   //   controller: passController,
//                   //   keyboardType: TextInputType.visiblePassword,
//                   //   onFieldSubmitted: (String value) {
//                   //     print(value);
//                   //   },
//                   //   onChanged: (String value) {
//                   //     print(value);
//                   //   },
//                   //   decoration: InputDecoration(
//                   //     labelText: 'Password',
//                   //     prefixIcon: Icon(
//                   //       Icons.lock,
//                   //     ),
//                   //     suffixIcon: IconButton(
//                   //       icon: Icon(
//                   //           password ? Icons.visibility_off : Icons.visibility),
//                   //       onPressed: () {
//                   //         setState(() {
//                   //           password = !password;
//                   //         });
//                   //       },
//                   //     ),
//                   //     border: const OutlineInputBorder(),
//                   //     hintText: 'Password',
//                   //   ),
//                   //   obscureText: !password,
//                   //   validator: (value) {
//                   //     if (value!.isEmpty) {
//                   //       return 'Please Enter Email Address';
//                   //     }
//                   //     return null;
//                   //   },
//                   // ),
//                   defaultFormField(
//                     controller: passController,
//                     label: 'Enter Your Password',
//                     prefix: Icons.lock,
//                     onChange: (String value){
//                       print(value);
//                     },
//                     suffix: password ? Icons.visibility : Icons.visibility_off,
//                     hint: 'Email Password',
//                     type: TextInputType.visiblePassword,
//                     isPassword: password,
//                     suffixPressed: (){
//                       setState(() {
//                         password = !password;
//                       });
//                     },
//                     validate: (String value) {
//                       if (value.isEmpty)
//                       {
//                         return 'Please Enter Password';
//                       }
//                       return null;
//                     },
//                   ),
//
//                   // Theme(
//                   //   data: new ThemeData(
//                   //     primaryColor: Color.fromRGBO(84, 87, 90, 0.5),
//                   //     primaryColorDark: Color.fromRGBO(84, 87, 90, 0.5),
//                   //     hintColor:
//                   //         Color.fromRGBO(84, 87, 90, 0.5), //placeholder color
//                   //   ),
//                   //   child: TextFormField(
//                   //     controller: emailController,
//                   //     decoration: InputDecoration(
//                   //       focusedBorder: new OutlineInputBorder(
//                   //         borderSide: BorderSide(
//                   //           color: Color.fromRGBO(84, 87, 90, 0.5),
//                   //           style: BorderStyle.solid,
//                   //         ),
//                   //       ),
//                   //       enabledBorder: new OutlineInputBorder(
//                   //         borderSide: BorderSide(
//                   //           color: Color.fromRGBO(84, 87, 90, 0.5),
//                   //           style: BorderStyle.solid,
//                   //         ),
//                   //       ),
//                   //       errorBorder: new OutlineInputBorder(
//                   //         borderSide: BorderSide(
//                   //           color: Colors.red,
//                   //           width: 1.0,
//                   //           style: BorderStyle.solid,
//                   //         ),
//                   //       ),
//                   //       labelText: 'Enter User Name',
//                   //       prefixIcon: const Icon(
//                   //         Icons.person,
//                   //         color: Color.fromRGBO(84, 87, 90, 0.5),
//                   //       ),
//                   //       border: new OutlineInputBorder(
//                   //         borderSide: BorderSide(
//                   //           color: Color.fromRGBO(84, 87, 90, 0.5),
//                   //           style: BorderStyle.solid,
//                   //         ),
//                   //       ),
//                   //       hintText: 'User Name',
//                   //     ),
//                   //     validator: (value) {
//                   //       if (value == null || value.isEmpty) {
//                   //         return 'Please Enter User Name';
//                   //       }
//                   //       return null;
//                   //     },
//                   //   ),
//                   // ),
//                   // SizedBox(
//                   //   height: 20.0,
//                   // ),
//                   // Theme(
//                   //   data: new ThemeData(
//                   //     primaryColor: Color.fromRGBO(84, 87, 90, 0.5),
//                   //     primaryColorDark: Color.fromRGBO(84, 87, 90, 0.5),
//                   //     hintColor:
//                   //         Color.fromRGBO(84, 87, 90, 0.5), //placeholder color
//                   //   ),
//                   //   child: TextFormField(
//                   //     controller: passController,
//                   //     decoration: InputDecoration(
//                   //       suffixIcon: IconButton(
//                   //         icon: Icon(password
//                   //             ? Icons.visibility_off
//                   //             : Icons.visibility),
//                   //         onPressed: () {
//                   //           // setState(() {
//                   //           //   password_visiable = !password_visiable;
//                   //           // });
//                   //         },
//                   //       ),
//                   //       focusedBorder: new OutlineInputBorder(
//                   //         borderSide: BorderSide(
//                   //           color: Color.fromRGBO(84, 87, 90, 0.5),
//                   //           style: BorderStyle.none,
//                   //         ),
//                   //       ),
//                   //       enabledBorder: new OutlineInputBorder(
//                   //         borderSide: BorderSide(
//                   //           color: Color.fromRGBO(84, 87, 90, 0.5),
//                   //           style: BorderStyle.solid,
//                   //         ),
//                   //       ),
//                   //       errorBorder: new OutlineInputBorder(
//                   //         borderSide: BorderSide(
//                   //           color: Colors.red,
//                   //           width: 1.0,
//                   //           style: BorderStyle.none,
//                   //         ),
//                   //       ),
//                   //       border: new OutlineInputBorder(
//                   //         borderSide: BorderSide(
//                   //           color: Color.fromRGBO(84, 87, 90, 0.5),
//                   //           style: BorderStyle.none,
//                   //         ),
//                   //       ),
//                   //       labelText: 'Enter Password',
//                   //       prefixIcon: const Icon(
//                   //         Icons.lock,
//                   //         color: Color.fromRGBO(84, 87, 90, 0.5),
//                   //       ),
//                   //       hintText: 'Password',
//                   //     ),
//                   //     keyboardType: TextInputType.visiblePassword,
//                   //     obscureText: !password,
//                   //     validator: (value) {
//                   //       if (value == null || value.isEmpty) {
//                   //         return 'Please Enter Password';
//                   //       }
//                   //       return null;
//                   //     },
//                   //   ),
//                   // ),
//
//                   const SizedBox(
//                     height: 20.0,
//                   ),
//                   defaultButton(
//                     function: () {
//                       if (formKey.currentState!.validate()) {
//                         print(emailController.text);
//                         print(passController.text);
//                       }
//                     },
//                     text: 'login',
//                   ),
//                   // Container(
//                   //   padding: const EdgeInsets.symmetric(vertical: 10),
//                   //   alignment: Alignment.centerRight,
//                   //   child: const Text('Forgot Password ?',
//                   //       style: TextStyle(
//                   //           fontSize: 14, fontWeight: FontWeight.w500)),
//                   // ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
