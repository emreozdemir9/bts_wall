import 'package:flutter_bloc/flutter_bloc.dart';

class ImageDetailCubit extends Cubit<dynamic> {
  ImageDetailCubit() : super(0);

  int currentImageIndex = 0;
  getCurrentImageIndex(int x) => emit(currentImageIndex = x);
}