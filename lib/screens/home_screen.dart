import 'package:flutter/material.dart';
import 'package:weather_app_tutorial/constants/app_colors.dart';
import 'package:weather_app_tutorial/screens/forecast_screen.dart';
import 'package:weather_app_tutorial/screens/search_screen.dart';
import 'package:weather_app_tutorial/screens/weather_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  final _destination = [
    NavigationDestination(
        icon: Icon(
          Icons.home_outlined,
          color: Colors.white,
        ),
        selectedIcon: Icon(
          Icons.home,
          color: Colors.white,
        ),
        label: ''),
    NavigationDestination(
        icon: Icon(
          Icons.search_outlined,
          color: Colors.white,
        ),
        selectedIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        label: ''),
    NavigationDestination(
        icon: Icon(
          Icons.wb_sunny_outlined,
          color: Colors.white,
        ),
        selectedIcon: Icon(
          Icons.wb_sunny,
          color: Colors.white,
        ),
        label: ''),
    NavigationDestination(
        icon: Icon(
          Icons.settings_outlined,
          color: Colors.white,
        ),
        selectedIcon: Icon(
          Icons.settings,
          color: Colors.white,
        ),
        label: ''),
  ];

  final _scrrens = [
    const WeatherScreen(),
    const SearchScreen(),
    const ForecastScreen(),
    const Center(
      child: Text('Settings Screen'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _scrrens[_currentPageIndex],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          backgroundColor: AppColors.secondaryBlack,
        ),
        child: NavigationBar(
          destinations: _destination,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _currentPageIndex,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (index) {
            setState(() {
              _currentPageIndex = index;
            });
          },
        ),
      ),
    );
  }
}
