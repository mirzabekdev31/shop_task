import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_task/di/di.dart';
import 'package:shop_app_task/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:shop_app_task/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:shop_app_task/presentation/ui/screens/home/home_screen.dart';
import 'package:shop_app_task/presentation/ui/screens/main_screen/main_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(di.get())..add(HomeAllEvent()),
        ),
        BlocProvider<CartBloc>(
          create: (_) => CartBloc(di.get())..add(CartInitialEvent()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MainScreen(),
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
        },
      ),
    );
  }
}

