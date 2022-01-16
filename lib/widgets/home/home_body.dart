import 'package:bts_wall/bloc/home_screen/home_cubit.dart';
import 'package:bts_wall/bloc/home_screen/home_state.dart';
import 'package:bts_wall/models/items.dart';
import 'package:bts_wall/widgets/mainwidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  final String boardId;
  HomeBody(this.boardId);
  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        // Init State
        create: (_) => HomeCubit()..getImageData(widget.boardId),
        child: BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
          // Check Image Loaded
          if (state is ImageLoaded)
            return buildImageList(state.images);
          // Loading Bar
          else if (state is ImageLoading)
            return Center(child: CircularProgressIndicator());
          else
            return Container(child: Text('Error'));
        }));
  }

  Widget buildImageList(List<Items> state) {
    // Get Image List
    return MainWidgets.buildMainStaggeredImageList(state);
  }
}
