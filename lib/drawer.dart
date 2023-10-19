import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final VoidCallback logoutCallback;

  const AppDrawer({super.key, required this.logoutCallback});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text('Mamimili User'),
            accountEmail: Text('user@email.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/ecommerce_logo.png'),
            ),
            decoration: BoxDecoration(
              color: Colors.green,
            ),
          ),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Transaction History'),
            onTap: () {
              // Handle the transaction history action
              // You can navigate to a new screen or perform an action here
            },
          ),
          ListTile(
            leading: Icon(Icons.description),
            title: Text('Terms and Conditions'),
            onTap: () {
              // Handle the terms and conditions action
              // You can navigate to a new screen or perform an action here
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Show a confirmation dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm Logout'),
                    content: Text('Are you sure you want to quit?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                      TextButton(
                        child: Text('Yes'),
                        onPressed: () {
                          // Call the logout callback function
                          logoutCallback();
                          Navigator.of(context).pushReplacementNamed('/login');
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
