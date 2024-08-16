import 'package:flutter/material.dart';

import '../manager/permission_manager.dart';
import '../test/cache.dart';
import 'base_page.dart';
import 'cache_json_page.dart';
import 'cache_page.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({super.key});

  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
  @override
  void initState() {
    super.initState();
    checkAndRequestPermissions();
  }

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    BasePage(),
    CachePage(),
    CacheJsonPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Cache Image'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              verifyJsonCacheStorage();
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              clearCache();
            },
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Base Page',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cached),
            label: 'Cache',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_outlined),
            label: 'Cache Json',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
