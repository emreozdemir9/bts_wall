import 'package:bts_wall/const/constants.dart';
import 'package:bts_wall/pages/favorites.dart';
import 'package:bts_wall/widgets/home/home_body.dart';
import 'package:bts_wall/widgets/mainwidgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  // params
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  bool _backPressed = false;
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(vsync: this, length: 8);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          key: scaffoldKey,
          body: _build(),
        ),
        onWillPop: onWillPop);
  }

  // confirm exit handler
  Future<bool> onWillPop() async {
    if (Navigator.of(context).canPop()) return true;
    if (!this._backPressed) {
      if (scaffoldKey == null || scaffoldKey.currentState == null) return false;
      scaffoldKey.currentState.showSnackBar(MainWidgets.snackBar(
        'Press Again For Exit',
        backgroundColor: Colors.red,
        center: true,
        duration: 400,
      ));
      this._backPressed = true;
      Future.delayed(Duration(milliseconds: 600), () {
        if (mounted) setState(() => this._backPressed = false);
      });
      return false;
    }
    return true;
  }
  
  Widget _build() {
    return NestedScrollView(
      floatHeaderSlivers: true,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            title: Text('All Wallpapers'),
            actions: [favoritesButton()],
            pinned: true,
            floating: true,
            snap: true,
            // Home Page Tab Bar
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  text: 'BTS',
                ),
                Tab(
                  text: 'V',
                ),
                Tab(
                  text: 'Jungkook',
                ),
                Tab(
                  text: 'Jimin',
                ),
                Tab(
                  text: 'Jin',
                ),
                Tab(
                  text: 'Suga',
                ),
                Tab(
                  text: 'JHope ',
                ),
                Tab(
                  text: 'RM ',
                ),
              ],
              controller: _tabController,
            ),
          ),
        ];
      },
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        children: [
          // homeBody('1'),
          HomeBody(AppConstats.btsBoardId),
          HomeBody(AppConstats.btsBoardId),
          homeBody('3'),
          homeBody('4'),
          homeBody('5'),
          homeBody('6'),
          homeBody('7'),
          homeBody('8'),
        ],
        controller: _tabController,
      ),
    );
  }

  Widget homeBody(String title) {
    return Text(title);
  }

  // App Bar Favorites Button
  Widget favoritesButton() {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => FavoritesPage())),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Text
          Text(
            'Favorites',
            style: TextStyle(fontSize: 18),
          ),
          // Space
          SizedBox(
            width: 5,
          ),
          // Icon
          Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
