import 'package:adminpanel/views/screens/side_bar_screens/Withdraw_Screen.dart';
import 'package:adminpanel/views/screens/side_bar_screens/banners_Screen.dart';
import 'package:adminpanel/views/screens/side_bar_screens/category_Screen.dart';
import 'package:adminpanel/views/screens/side_bar_screens/dashboard_screen.dart';
import 'package:adminpanel/views/screens/side_bar_screens/order_Screen.dart';
import 'package:adminpanel/views/screens/side_bar_screens/products_screen.dart';
import 'package:adminpanel/views/screens/side_bar_screens/vendor_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Widget _selecteditem = DashboardScreen();

  ScreenNavigate(item) {
    switch (item.route) {
      case DashboardScreen.routeName:
        setState(() {
          _selecteditem = DashboardScreen();
        });

        break;

      case VendorScreen.routeName:
        setState(() {
          _selecteditem = VendorScreen();
        });

        break;

      case WithdrawScreen.routeName:
        setState(() {
          _selecteditem = WithdrawScreen();
        });

        break;

      case OrderScreen.routeName:
        setState(() {
          _selecteditem = OrderScreen();
        });

        break;

      case CategoryScreen.routeName:
        setState(() {
          _selecteditem = CategoryScreen();
        });

        break;

      case ProductScreen.routeName:
        setState(() {
          _selecteditem = ProductScreen();
        });

        break;

      case BannerScreen.routeName:
        setState(() {
          _selecteditem = BannerScreen();
        });

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Color.fromARGB(255, 230, 216, 209),
      
      sideBar: SideBar(
        items: [
          AdminMenuItem(
            title: 'Dashboard',
            icon: Icons.dashboard,
            route: DashboardScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Vendors',
            icon: Icons.person_3,
            route: VendorScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Withdrawal',
            icon: CupertinoIcons.money_dollar,
            route: WithdrawScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Orders',
            icon: CupertinoIcons.cart,
            route: OrderScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Category',
            icon: Icons.category,
            route: CategoryScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Products',
            icon: Icons.shop,
            route: ProductScreen.routeName,
          ),
          AdminMenuItem(
            title: 'Add Banners',
            icon: Icons.add,
            route: BannerScreen.routeName,
          ),
        ],
        selectedRoute: '',
        onSelected: (item) {
          ScreenNavigate(item);
        },
        header: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'Vendor Store',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
      ),

footer: Container(
          height: 50,
          width: double.infinity,
          color: const Color(0xff444444),
          child: const Center(
            child: Text(
              'Multi-Vendor',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
),
      ),
      body: _selecteditem,
      );
  }
}
