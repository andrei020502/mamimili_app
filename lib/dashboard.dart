import 'package:flutter/material.dart';
import 'home_tab.dart';
import 'budget_planner_tab.dart';
import 'shopping_cart_tab.dart';
import 'profile_tab.dart';
import 'drawer.dart'; // Import the AppDrawer

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      _selectedIndex = _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu), // Hamburger icon
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
        ),
        title: Text(_getAppBarTitle()), // Use a function to get the title
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(
              icon: Icon(Icons.home), // Use the Icons class for icons
            ),
            Tab(
              icon: Icon(Icons.account_balance_wallet),
            ),
            Tab(
              icon: Icon(Icons.shopping_cart),
            ),
            Tab(
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          HomeScreen(), // Replace with your tab content widgets
          BudgetPlannerTab(),
          ShoppingCartTab(),
          ProfileTab(),
        ],
      ),
      drawer: AppDrawer(logoutCallback: () {  },), // Add the AppDrawer here
    );
  }

  String _getAppBarTitle() {
    switch (_selectedIndex) {
      case 0:
        return 'Home';
      case 1:
        return 'Budget Planner';
      case 2:
        return 'Shopping Cart';
      case 3:
        return 'Profile';
      default:
        return 'Mamimili'; // Default title
    }
  }
}
