import 'package:admin/UI/Return/Return.dart';
import 'package:admin/UI/payment/Payment.dart';
import 'package:admin/UI/Shipment/Shipping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Requests/Requests.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static List<Widget> _pages = <Widget>[
    // Users(),
    Payment(), Return(), Shipping(), Requests()
  ];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        items: <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: SvgPicture.asset(
          //     'lib/assets/address-card.svg',
          //     color: Colors.grey,
          //   ),
          //   title: Text(
          //     'Users',
          //     style: TextStyle(color: Colors.grey, fontSize: 12),
          //   ),
          //   activeIcon: SvgPicture.asset(
          //     'lib/assets/address-card.svg',
          //     color: Colors.orange,
          //   ),
          // ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'lib/assets/bell.svg',
              color: Colors.grey,
            ),
            title: Text(
              'Payment',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            activeIcon: SvgPicture.asset(
              'lib/assets/bell.svg',
              color: Colors.orange,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'lib/assets/undo.svg',
              color: Colors.grey,
            ),
            title: Text(
              'Return',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            activeIcon: SvgPicture.asset(
              'lib/assets/undo.svg',
              color: Colors.orange,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'lib/assets/Group 659.svg',
              color: Colors.grey,
            ),
            title: Text(
              'Shipping',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            activeIcon: SvgPicture.asset(
              'lib/assets/Group 659.svg',
              color: Colors.orange,
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'lib/assets/Group 181.svg',
              color: Colors.grey,
            ),
            title: Text(
              'Requests',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            activeIcon: SvgPicture.asset(
              'lib/assets/Group 181.svg',
              color: Colors.orange,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: Image.asset(
                    "lib/assets/cover.png",
                    fit: BoxFit.cover,
                  ))
                ],
              ),
              _pages[_selectedIndex]
            ],
          ),
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
