import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_api/amplify_api.dart'; // 👈 new import
import 'amplifyconfiguration.dart'; // Make sure this file is in your lib folder
import 'home_page.dart';
import 'package:flutter/foundation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    try {
      // 👇 add both Auth + API
      final auth = AmplifyAuthCognito();
      final api = AmplifyAPI();

      await Amplify.addPlugins([auth, api]);
      await Amplify.configure(amplifyconfig);

      setState(() {
        _amplifyConfigured = true;
      });
      print('Amplify configured successfully');
    } catch (e) {
      print('Failed to configure Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_amplifyConfigured) {
      return const MaterialApp(
        home: Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        debugShowCheckedModeBanner: false,
      );
    }

    return MaterialApp(
      title: 'Maynooth Parking',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
