// ignore_for_file: library_private_types_in_public_api
// The Encryptogram application rewritten in Dart and Flutter
import 'package:flutter/material.dart';

void dialogPlaceholder(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Hello"),
        content: Text("World"),
        actions: [
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text("Cancel"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> main() async {
  runApp(const EncryptoGram());
}

class EncryptoGram extends StatelessWidget {
  const EncryptoGram({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Encryptogram',
      theme: enCryptogramAppThemeData,
      home: const LoginPage(),
    );
  }

  ThemeData get enCryptogramAppThemeData => ThemeData(
        useMaterial3: true,
        primarySwatch: enCryptogramColors,
      );

  get enCryptogramColors {
    return Colors.red;
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: TextField(
                obscureText: _isHidden,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: _toggleVisibility,
                    icon: _isHidden
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () { dialogPlaceholder(context); },
              child: const Text('Login'),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: const Text('Register an account'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot password?'),
            ),
          ],
        ),
      ),
    );
  }
}
