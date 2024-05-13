import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FloatScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Floating Button Navigation'),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.sizeOf(context).width * 0.8,
        color: Colors.brown,
        padding: EdgeInsets.all(10),
        child: GNav(
          rippleColor:
              Colors.green.shade800, // tab button ripple color when pressed
          hoverColor: Colors.green.shade700, // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 15,
          tabActiveBorder:
              Border.all(color: Colors.white, width: 1), // tab button border
          tabBorder:
              Border.all(color: Colors.grey, width: 1), // tab button border
          tabShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 3)
          ], // tab button shadow
          curve: Curves.easeInCirc, // tab animation curves
          duration: Duration(milliseconds: 200), // tab animation duration
          gap: 10, // the tab button gap between icon and text
          color: Colors.grey[800], // unselected icon color
          activeColor: Colors.white, // selected icon and text color
          iconSize: 24, // tab button icon size
          tabBackgroundColor:
              Colors.white.withOpacity(0.1), // selected tab background color
          padding: const EdgeInsets.symmetric(
              horizontal: 25, vertical: 10), // navigation bar padding
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
            ),
            GButton(
              onPressed: () {
                print("likes tab pressed");
              },
              icon: Icons.favorite_border_outlined,
              text: 'Likes',
            ),
            GButton(
              icon: Icons.search,
              text: 'Search',
            ),
            GButton(
              icon: Icons.person_outlined,
              text: 'Profile',
            )
          ],
        ),
      ),
    );
  }
}

class FloatScreen extends StatefulWidget {
  const FloatScreen({super.key});

  @override
  State<FloatScreen> createState() => _FloatScreenState();
}

class _FloatScreenState extends State<FloatScreen> {
  @override
  Widget build(BuildContcontext) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      //If you want to show body behind the navbar, it should be true
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        onTap: (int val) {
          //returns tab id which is user tapped
        },
        currentIndex: 0,
        items: [
          FloatingNavbarItem(icon: Icons.home, title: 'Home'),
          FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
          FloatingNavbarItem(icon: Icons.chat_bubble_outline, title: 'Chats'),
          FloatingNavbarItem(icon: Icons.settings, title: 'Settings'),
        ],
      ),
    );
  }
}
