import 'package:flutter/material.dart';

// 导入页面
import '/screens/continue.dart';
import '/screens/profile.dart';
import '/screens/router.dart';

class HostScreen extends StatefulWidget {
  const HostScreen({super.key});

  @override
  State<HostScreen> createState() => _HostScreenState();
}

class _HostScreenState extends State<HostScreen> {
  int _selectedIndex = 0;

  // 定义页面列表
  static final List<Widget> _screens = <Widget>[
    ContinueScreen(),
    RouterScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'explore'),
          BottomNavigationBarItem(icon: Icon(Icons.route), label: 'routes'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      drawer: Drawer(
        child: ListView.builder(
          itemCount: widgetline.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("Scaffold${index + 1}"),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => widgetline[index]),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
