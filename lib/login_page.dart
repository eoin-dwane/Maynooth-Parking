import 'package:flutter/material.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'landing_page.dart'; // Import your landing page

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) return 'Please enter username';
    if (!RegExp(r'^\d{8}$').hasMatch(value)) return 'Username must be exactly 8 digits';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Please enter password';
    return null;
  }

  InputDecoration customInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.blueGrey.shade50,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.blue, width: 2),
      ),
    );
  }

  Future<void> _submit() async {
    if (_formKey.currentState!.validate()) {
      final username = _usernameController.text.trim();
      final password = _passwordController.text.trim();

      try {
        // Sign out any existing signed-in user before new sign-in
        final session = await Amplify.Auth.fetchAuthSession();
        if (session.isSignedIn) {
          await Amplify.Auth.signOut();
        }

        SignInResult res = await Amplify.Auth.signIn(
          username: username,
          password: password,
        );

        if (res.isSignedIn) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Login successful!')),
          );

          // Navigate to Landing Page
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const LandingPage()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Additional steps required: ${res.nextStep.signInStep}')),
          );
        }
      } on AuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
        leading: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => Navigator.of(context).pop(),
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: customInputDecoration('Student Number (8 digits)'),
                keyboardType: TextInputType.number,
                maxLength: 8,
                validator: _validateUsername,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                decoration: customInputDecoration('Password'),
                obscureText: true,
                validator: _validatePassword,
              ),
              const SizedBox(height: 32),
              ElevatedButton(onPressed: _submit, child: const Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}
