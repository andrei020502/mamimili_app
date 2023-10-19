import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> signup() async {
    // Define the URL of your signup API endpoint using the server's IP address
    var url =
        Uri.parse('http://192.168.0.106/api_mamimili_store/user/signup.php');

    // Prepare the data to send to the API
    var data = {
      'username': usernameController.text,
      'email': emailController.text,
      'password': passwordController.text,
    };

    try {
      // Send a POST request to the API
      var response = await http.post(url, body: data);
      if (response.statusCode == 200) {
        // Parse the response JSON
        var result = json.decode(response.body);

        if (result['message'] == 'Success') {
          // Registration was successful
          // ignore: use_build_context_synchronously
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Success'),
                content: const Text('Registration successful'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  ),
                ],
              );
            },
          );
        } else {
          // Registration failed
          showErrorDialog('Registration failed: ${result['message']}');
        }
      } else {
        // Request failed
        showErrorDialog('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exceptions and errors
      print('Error during registration: $e');
      showErrorDialog('Error during registration: $e');
    }
  }

  // Function to show an error dialog
  void showErrorDialog(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Error'),
          content: Text(errorMessage),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
                labelStyle: TextStyle(
                    color: Colors.black), // Change label color to black
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Change the border color to black
                ),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                    color: Colors.black), // Change label color to black
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Change the border color to black
                ),
              ),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                    color: Colors.black), // Change label color to black
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.black), // Change the border color to black
                ),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call the signup function when the button is pressed
                signup();
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Signup App',
    home: SignupPage(),
  ));
}
