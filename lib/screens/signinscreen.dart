// import 'dart:convert';
// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../widgets/showSnackbar.dart';
// import '../apis/apis.dart';
// import 'signupscreen.dart';
// import 'package:http/http.dart' as http;

// import 'package:shared_preferences/shared_preferences.dart';
// import 'home.dart';

// class SignIn extends StatefulWidget {
//   @override
//   _SignInState createState() => _SignInState();
// }

// class _SignInState extends State {
//   final _formKey = GlobalKey();
//   String email, password;
//   bool isLoading = false;
//   TextEditingController _emailController = new TextEditingController();
//   TextEditingController _passwordController = new TextEditingController();
//   var _scaffoldKey = GlobalKey();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: _scaffoldKey,
//         body: SingleChildScrollView(
//           child: Container(
//             width: MediaQuery.of(context).size.width,
//             height: MediaQuery.of(context).size.height,
//             child: Stack(
//               children: [
//                 Container(
//                   width: double.infinity,
//                   height: double.infinity,
//                   child: Image.asset(
//                     "assets/images/background.jpg",
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//                 Container(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Center(
//                           child: Image.asset(
//                         "assets/images/logo.png",
//                         height: 30,
//                         width: 30,
//                         alignment: Alignment.center,
//                       )),
//                       SizedBox(
//                         height: 13,
//                       ),
//                       Text(
//                         "Learn With Us",
//                         style: GoogleFonts.roboto(
//                             textStyle: TextStyle(
//                                 fontSize: 27,
//                                 color: Colors.white,
//                                 letterSpacing: 1)),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Container(
//                         width: 180,
//                         child: Text(
//                           "RRTutors, Hyderabad",
//                           textAlign: TextAlign.center,
//                           style: GoogleFonts.roboto(
//                             textStyle: TextStyle(
//                                 color: Colors.white54,
//                                 letterSpacing: 0.6,
//                                 fontSize: 11),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 40,
//                       ),
//                       Text(
//                         "Sign In",
//                         textAlign: TextAlign.center,
//                         style: GoogleFonts.roboto(
//                           textStyle: TextStyle(
//                             color: Colors.white,
//                             letterSpacing: 1,
//                             fontSize: 23,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 8,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             "Learn new Technologies ????",
//                             textAlign: TextAlign.center,
//                             style: GoogleFonts.roboto(
//                               textStyle: TextStyle(
//                                 color: Colors.white70,
//                                 letterSpacing: 1,
//                                 fontSize: 17,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Form(
//                         key: _formKey,
//                         child: Container(
//                           margin: EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 45),
//                           child: Column(
//                             children: [
//                               TextFormField(
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                                 controller: _emailController,
//                                 decoration: InputDecoration(
//                                   enabledBorder: UnderlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: Colors.white)),
//                                   hintText: "Email",
//                                   hintStyle: TextStyle(
//                                       color: Colors.white70, fontSize: 15),
//                                 ),
//                                 onSaved: (val) {
//                                   email = val;
//                                 },
//                               ),
//                               SizedBox(
//                                 height: 16,
//                               ),
//                               TextFormField(
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 ),
//                                 controller: _passwordController,
//                                 decoration: InputDecoration(
//                                   enabledBorder: UnderlineInputBorder(
//                                       borderSide:
//                                           BorderSide(color: Colors.white)),
//                                   hintText: "Password",
//                                   hintStyle: TextStyle(
//                                       color: Colors.white70, fontSize: 15),
//                                 ),
//                                 onSaved: (val) {
//                                   email = val;
//                                 },
//                               ),
//                               SizedBox(
//                                 height: 30,
//                               ),
//                               Stack(
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {
//                                       if (isLoading) {
//                                         return;
//                                       }
//                                       if (_emailController.text.isEmpty ||
//                                           _passwordController.text.isEmpty) {
//                                         ///////
//                                         return;
//                                       }
//                                       login(_emailController.text,
//                                           _passwordController.text);
//                                       setState(() {
//                                         isLoading = true;
//                                       });
//                                       //Navigator.pushReplacementNamed(context, "/home");
//                                     },
//                                     child: Container(
//                                       alignment: Alignment.center,
//                                       width: double.infinity,
//                                       padding: EdgeInsets.symmetric(
//                                           vertical: 10, horizontal: 0),
//                                       height: 50,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: Colors.white),
//                                         borderRadius: BorderRadius.circular(50),
//                                       ),
//                                       child: Text(
//                                         "SUBMIT",
//                                         textAlign: TextAlign.center,
//                                         style: GoogleFonts.roboto(
//                                             textStyle: TextStyle(
//                                                 color: Colors.white,
//                                                 fontSize: 16,
//                                                 letterSpacing: 1)),
//                                       ),
//                                     ),
//                                   ),
//                                   Positioned(
//                                     child: (isLoading)
//                                         ? Center(
//                                             child: Container(
//                                                 height: 26,
//                                                 width: 26,
//                                                 child:
//                                                     CircularProgressIndicator(
//                                                   backgroundColor: Colors.green,
//                                                 )))
//                                         : Container(),
//                                     right: 30,
//                                     bottom: 0,
//                                     top: 0,
//                                   )
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Text(
//                         "OR",
//                         style: TextStyle(fontSize: 14, color: Colors.white60),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       // Image.asset(
//                       //   "assets/images/fingerprint.png",
//                       //   height: 36,
//                       //   width: 36,
//                       // ),
//                       // SizedBox(
//                       //   height: 30,
//                       // ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => SignUp()));
//                         },
//                         child: Text(
//                           "Don't have an account?",
//                           style: GoogleFonts.roboto(
//                               textStyle: TextStyle(
//                                   color: Colors.white70,
//                                   fontSize: 13,
//                                   decoration: TextDecoration.underline,
//                                   letterSpacing: 0.5)),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }

//   //ShowSnackBar() => _scaffoldKey.currentState.showSnackBar(SnackBar(content:Text("Please Fill all fileds")));

//   login(email, password) async {
//     Map data = {'email': email, 'password': password};
//     print(data.toString());
//     final response = await http.post(LOGIN,
//         headers: {
//           "Accept": "/",
//           "Content-Type": "application/x-www-form-urlencoded"
//         },
//         body: data,
//         encoding: Encoding.getByName("utf-8"));
//     setState(() {
//       isLoading = false;
//     });
//     if (response.statusCode == 200) {
//       final Mapresposne = jsonDecode(response.body);
//       if (!Mapresposne['error']) {
//         final Mapuser = Mapresposne['data'];
//         print(" User name ${Mapuser['data']}");
//         savePref(1, Mapuser['name'], Mapuser['email'], Mapuser['id']);
//         //Navigator.pushReplacementNamed(context, "/home");
//       } else {
//         print(" ${Mapresposne['message']}");
//       }
//       //  _scaffoldKey.currentState
//       //   .showSnackBar(SnackBar(content: Text("${Mapresposne['message']}")));
//     } else {
//       //  _scaffoldKey.currentState
//       //    .showSnackBar(SnackBar(content: Text("Please Try again")));
//     }
//   }

//   // showSnackBar() => _scaffoldKey.currentState.showSnackBar(SnackBar(content:Text("${resposne['message']}")));
//   savePref(int value, String name, String email, int id) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();

//     preferences.setInt("value", value);
//     preferences.setString("name", name);
//     preferences.setString("email", email);
//     preferences.setString("id", id.toString());
//     preferences.commit();
//   }
// }

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// import '../main.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool _isLoading = false;

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light
//         .copyWith(statusBarColor: Colors.transparent));
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//               colors: [Colors.blue, Colors.teal],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter),
//         ),
//         child: _isLoading
//             ? Center(child: CircularProgressIndicator())
//             : ListView(
//                 children: <Widget>[
//                   headerSection(),
//                   textSection(),
//                   buttonSection(),
//                 ],
//               ),
//       ),
//     );
//   }

//   signin(String email, pass) async {
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     Map data = {'email': email, 'password': pass};
//     var jsonResponse = null;

//     var response =
//         await http.post("http://192.168.1.55:8000/api/login", body: data);
//     if (response.statusCode == 200) {
//       jsonResponse = json.decode(response.body);
//       print('Response status: ${response.statusCode}');
//       print('Response body: ${response.body}');
//       if (jsonResponse != null) {
//         setState(() {
//           _isLoading = false;
//         });
//         sharedPreferences.setString("token", jsonResponse['token']);
//         Navigator.of(context).pushAndRemoveUntil(
//             MaterialPageRoute(builder: (BuildContext context) => MainPage()),
//             (Route<dynamic> route) => false);
//       }
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//       print(response.body);
//     }
//   }

//   Container buttonSection() {
//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: 40.0,
//       padding: EdgeInsets.symmetric(horizontal: 15.0),
//       margin: EdgeInsets.only(top: 15.0),
//       child: RaisedButton(
//         onPressed: emailController.text == "" || passwordController.text == ""
//             ? null
//             : () {
//                 setState(() {
//                   _isLoading = true;
//                 });
//                 signin(emailController.text, passwordController.text);
//               },
//         elevation: 0.0,
//         color: Colors.purple,
//         child: Text("Sign ip", style: TextStyle(color: Colors.white70)),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
//       ),
//     );
//   }

//   final TextEditingController emailController = new TextEditingController();
//   final TextEditingController passwordController = new TextEditingController();

//   Container textSection() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
//       child: Column(
//         children: <Widget>[
//           TextFormField(
//             controller: emailController,
//             cursorColor: Colors.white,
//             style: TextStyle(color: Colors.white70),
//             decoration: InputDecoration(
//               icon: Icon(Icons.email, color: Colors.white70),
//               hintText: "Email",
//               border: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white70)),
//               hintStyle: TextStyle(color: Colors.white70),
//             ),
//           ),
//           SizedBox(height: 30.0),
//           TextFormField(
//             controller: passwordController,
//             cursorColor: Colors.white,
//             obscureText: true,
//             style: TextStyle(color: Colors.white70),
//             decoration: InputDecoration(
//               icon: Icon(Icons.lock, color: Colors.white70),
//               hintText: "Password",
//               border: UnderlineInputBorder(
//                   borderSide: BorderSide(color: Colors.white70)),
//               hintStyle: TextStyle(color: Colors.white70),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Container headerSection() {
//     return Container(
//       margin: EdgeInsets.only(top: 50.0),
//       padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
//       child: Text("Codigo Alpha Flutter",
//           style: TextStyle(
//               color: Colors.white70,
//               fontSize: 40.0,
//               fontWeight: FontWeight.bold)),
//     );
//   }
// }
