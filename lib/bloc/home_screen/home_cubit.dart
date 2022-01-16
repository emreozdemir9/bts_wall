import 'package:bts_wall/bloc/home_screen/home_state.dart';
import 'package:bts_wall/services/app_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  // Get Images
  void getImageData(String boardId) async {
    // Loading
    emit(ImageLoading());
    final response = await AppServices.getImages(boardId);
    // Loaded
    emit(ImageLoaded(response));
  }
}