import 'package:flutter/material.dart';
import 'homepage.dart';
import 'searchpage.dart';
import 'pageprofile.dart';
import 'favorite.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(title: 'Hexa_shop'),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key, required this.title});
  final String title;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedNavbar = 0;
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _changeSelectedNavBar(int index) {
    setState(() {
      _selectedNavbar = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Search(),
    ProfilePage(),
    AnimeFavorit(),
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFB2C394B),
          title: Image.network('https://i.postimg.cc/XqhdhScm/logo.jpg',
          fit: BoxFit.contain,
          height: 50,
          ),
          actions: <Widget>[
            Image.network('https://i.postimg.cc/wjkcqP6y/download.png',
            fit: BoxFit.contain,
            height: 50,
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Color(0xFFB2C394B),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),        
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
           BottomNavigationBarItem(
            icon: Icon (Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ], //New
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Stack(
        children: [
          _buildOffstageNavigator(0),
          _buildOffstageNavigator(1),
          _buildOffstageNavigator(2),
          _buildOffstageNavigator(3),
          _buildOffstageNavigator(4),
        ],
      ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          HomePage(),
          Search(),
          AnimeFavorit(),
          ProfilePage(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: _selectedIndex != index,
      child: Navigator(
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name]!(context),
          );
        },
      ),
    );
  }
}