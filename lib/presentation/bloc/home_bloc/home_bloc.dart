import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app_task/data/database/database_helper.dart';
import 'package:shop_app_task/data/models/product_model.dart';
import 'package:shop_app_task/data/shared_pref/preference_helper.dart';
import 'package:shop_app_task/di/di.dart';
import 'package:shop_app_task/domain/repository/home_repository/home_repository.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {

  final HomeRepository homeRepository;
  final databaseHelper = di<DatabaseHelper>();
  final sharedPreferencesHelper = SharedPreferencesHelper.instance;

  HomeBloc(this.homeRepository) : super(const HomeState()) {
    on<HomeAllEvent>((event, emit) async {
      emit(state.copyWith(status: HomeStatus.loading));
      try {
        final products = await homeRepository.getAllProduct();
        emit(state.copyWith(status: HomeStatus.success,
            product: products));
        bool isLiked = await sharedPreferencesHelper.getIsLiked();
        if(isLiked!=true){
          await databaseHelper.insertProducts(products);
          await sharedPreferencesHelper.setIsLiked(true);
        }
      } catch (e) {
        emit(state.copyWith(status: HomeStatus.failed, message: "${e}"));
      }
    });
    on<HomeElectronicsEvent>((event, emit) async{
      emit(state.copyWith(status: HomeStatus.loading));
      try {
        emit(state.copyWith(status: HomeStatus.success,
            product: await homeRepository.getElectronics()));
      } catch (e) {
        emit(state.copyWith(status: HomeStatus.failed, message: "${e}"));
      }
    });
    on<HomeJeweleryEvent>((event, emit) async{
      emit(state.copyWith(status: HomeStatus.loading));
      try {
        emit(state.copyWith(status: HomeStatus.success,
            product: await homeRepository.getJewelery()));
      } catch (e) {
      emit(state.copyWith(status: HomeStatus.failed, message: "${e}"));
      }
    });

    on<HomeMensClothingEvent>((event, emit) async{
      emit(state.copyWith(status: HomeStatus.loading));
      try {
        emit(state.copyWith(status: HomeStatus.success,
            product: await homeRepository.getMensClothing()));
      } catch (e) {
        emit(state.copyWith(status: HomeStatus.failed, message: "${e}"));
      }
    });

    on<HomeWoMensClothingEvent>((event, emit) async{
      emit(state.copyWith(status: HomeStatus.loading));
      try {
        emit(state.copyWith(status: HomeStatus.success,
            product: await homeRepository.getWoMensClothing()));
      } catch (e) {
        emit(state.copyWith(status: HomeStatus.failed, message: "${e}"));
      }
    });
    on<HomeAddCartEvent>((event, emit){
      databaseHelper.cardAdd(state.product[event.index]);
      print("======================        ===============   ${state.product[event.index].is_cart}");
      emit(state.copyWith(status: HomeStatus.success));
    });
    on<HomeAddLikeEvent>((event, emit){
      databaseHelper.likeAdd(state.product[event.index]);
      emit(state.copyWith(status: HomeStatus.success));
    });
  }
}
