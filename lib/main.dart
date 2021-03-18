// import 'package:flutter/material.dart';

// import './screens/home.dart';
// import 'screens/signinscreen.dart';
// import 'screens/signupscreen.dart';

// import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(MaterialApp(
//     home: MyApp(),
//   ));
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getPref();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: (_loginStatus == 1) ? Home() : SignIn(),
//       theme: ThemeData.light(),
//       debugShowCheckedModeBanner: false,
//       routes: {
//         '/signin': (BuildContext context) => new SignIn(),
//         '/signup': (BuildContext context) => new SignUp(),
//         '/home': (BuildContext context) => new Home(),
//       },
//     );
//   }

//   var _loginStatus = 0;
//   getPref() async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     setState(() {
//       _loginStatus = preferences.getInt("value");
//     });
//   }
// }

// import 'dart:convert';

// import 'package:testapp/screens/signupscreen.dart';
// import 'package:testapp/screens/signupscreen.dart';

// import 'screens/signinscreen.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// import 'screens/signupscreen.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Codigo Alpha Flutter",
//       debugShowCheckedModeBanner: false,
//       home: SignUpPage(),
//       theme: ThemeData(accentColor: Colors.white70),
//     );
//   }
// }

// class MainPage extends StatefulWidget {
//   @override
//   _MainPageState createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   SharedPreferences sharedPreferences;

//   @override
//   void initState() {
//     super.initState();
//     checkLoginStatus();
//   }

//   checkLoginStatus() async {
//     sharedPreferences = await SharedPreferences.getInstance();
//     if (sharedPreferences.getString("token") == null) {
//       Navigator.of(context).pushAndRemoveUntil(
//           MaterialPageRoute(builder: (BuildContext context) => SignUpPage()),
//           (Route<dynamic> route) => false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title:
//             Text("Codigo Alpha Flutter", style: TextStyle(color: Colors.white)),
//         actions: <Widget>[
//           FlatButton(
//             onPressed: () {
//               sharedPreferences.clear();
//               sharedPreferences.commit();
//               Navigator.of(context).pushAndRemoveUntil(
//                   MaterialPageRoute(
//                       builder: (BuildContext context) => SignUpPage()),
//                   (Route<dynamic> route) => false);
//             },
//             child: Text("Log Out", style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//       body: Center(child: Text("Main Page")),
//       drawer: Drawer(
//         child: new ListView(
//           children: <Widget>[
//             new UserAccountsDrawerHeader(
//               accountName: new Text('Ejercicios'),
//               accountEmail: new Text('codigoalphacol@gmail.com'),
//               // decoration: new BoxDecoration(
//               //   image: new DecorationImage(
//               //     fit: BoxFit.fill,
//               //    // image: AssetImage('img/estiramiento.jpg'),
//               //   )
//               // ),
//             ),
//             new Divider(),
//             // new ListTile(
//             //   title: new Text("Add data"),
//             //   trailing: new Icon(Icons.fitness_center),
//             //   onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//             //     builder: (BuildContext context) => AddData(),
//             //   )),
//             // ),
//             // new Divider(),
//             // new ListTile(
//             //   title: new Text("Mostrar listado"),
//             //   trailing: new Icon(Icons.help),
//             //   onTap: () => Navigator.of(context).push(new MaterialPageRoute(
//             //     builder: (BuildContext context) => ShowData(),
//             //   )),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/auth_screen.dart';
import './providers/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.red,
            accentColor: Colors.black,
            fontFamily: 'Lato',
            textTheme: ThemeData.light().textTheme.copyWith(
                  bodyText1: TextStyle(
                    color: Colors.white,
                  ),
                ),
          ),
          home: AuthScreen(),
          routes: {},
        ),
      ),
    );
  }
}
