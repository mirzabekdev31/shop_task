import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_task/data/database/database_helper.dart';
import 'package:shop_app_task/di/di.dart';
import 'package:shop_app_task/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:shop_app_task/presentation/ui/screens/home/widgets/product_item.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final databaseHelper = di<DatabaseHelper>();

  late final HomeBloc bloc;

  @override
  void initState() {
    super.initState();

    print("==================initState");
    bloc = context.read<HomeBloc>();
    bloc.add(HomeAllEvent());


  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: Builder(
            builder: (context) {
              if (state.status == HomeStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.status == HomeStatus.failed) {
                return Center(
                  child: Text(state.message),
                );
              }
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 10, // Spacing between columns
                  mainAxisSpacing: 10, // Spacing between rows
                ),
                itemCount: state.product.length,
                itemBuilder: (context, int index) {
                  //  final dress = state.dresses[index];
                  return ProductItem(
                    imgUrl: state.product[index].image ?? "",
                    clickLikeBtn: () {
                      bloc.add(HomeAddLikeEvent(index));
                    },
                    clickCartBtn: () {
                      bloc.add(HomeAddCartEvent(index));
                    },
                    name: state.product[index].title ?? "",
                    price: state.product[index].price ?? 0.0,
                    id: state.product[index].id ?? 0,
                    isLike: state.product[index].is_like!,
                    isBasket: 1,
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
