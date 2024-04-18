import 'add_cluan_widget.dart';
import 'cluans_widget.dart';
import 'statistics_widget.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      const CluansWidget(),
      const AddCluanWidget(),
      const StatisticsWidget(),
    ];
    super.initState();
  }

  void _handleTap(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        showUnselectedLabels: true, // well, that's a surprise!
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.blueAccent,
        backgroundColor: Colors.blue[200],
        onTap: _handleTap,
        items: const [
          BottomNavigationBarItem(label: 'Cluans', icon: Icon(Icons.question_mark)),
          BottomNavigationBarItem(label: 'Add Cluan', icon: Icon(Icons.add)),
          BottomNavigationBarItem(label: 'Statistics', icon: Icon(Icons.auto_graph)),
        ]
      ),
      body: screens[selectedIndex]),
    );
  }
}