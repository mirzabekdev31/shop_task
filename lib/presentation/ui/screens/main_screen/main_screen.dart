import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_task/di/di.dart';
import 'package:shop_app_task/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:shop_app_task/presentation/ui/screens/cart_screen/cart_screen.dart';
import 'package:shop_app_task/presentation/ui/screens/home/home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late PageController _pageController;

  int _currentTab = 0;

  @override
  void initState(){
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          BlocProvider(
            create: (_) => HomeBloc(di.get())..add(HomeAllEvent()),
            child: const HomeScreen(),
          ),
          BlocProvider(
            create: (_) => HomeBloc(di.get())..add(HomeAllEvent()),
            child: const HomeScreen(),
          ),

          BlocProvider(
            create: (_) => HomeBloc(di.get())..add(HomeAllEvent()),
            child:  CartScreen(),
          ),
        ],
        onPageChanged: (int index) {
          setState(() {
            _currentTab = index;
          });
        },
      ),
      bottomNavigationBar: CupertinoTabBar(
        onTap: (int index) {
          _currentTab = index;
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 200), curve: Curves.easeIn);
        },
        currentIndex: _currentTab,
        activeColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket),
            label: 'Savat',
          ),

        ],
      ),
    );
  }
}
