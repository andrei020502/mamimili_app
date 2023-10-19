import 'package:flutter/material.dart';
import 'drawer.dart';
import 'login_screen.dart'; // Import the LoginScreen
import 'dashboard.dart'; // Import the DashboardPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const LoginScreen(), // You can replace this with your initial screen
    DashboardPage(),
  ];
  // Function to log out and navigate to the login screen
  void _logout() {
    // Implement your logout logic here
    // For example, you can clear user data and navigate to the login screen
    Navigator.pushReplacementNamed(context, '/login');
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => DashboardPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.green, // Change the primary color to green
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.green, // Change the app bar color to green
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green, // Change the button color to green
          ),
        ),
      ),
      home: Scaffold(
        body: _tabs[_currentIndex], // Display the selected tab
        drawer: AppDrawer(logoutCallback: _logout), // Pass the logout function
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.money),
              label: 'Budget',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
