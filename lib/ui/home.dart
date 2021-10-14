import 'package:flutter/material.dart';
import 'package:foodaplication/flavor/config.dart';
import 'package:foodaplication/ui/dessert_screen.dart';
import 'package:foodaplication/ui/favorite/favorite_screen.dart';
import 'package:foodaplication/ui/seafood_screen.dart';
import 'package:foodaplication/ui/search_screen.dart';



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;

  _setPage() {
    if (_index == 0) {
      return DessertScreen();
    } else if (_index == 1) {
      return SeafoodScreen();
    } else {
      return FavoriteScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Config.appString),
        actions: <Widget>[
          IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
          },
        )
        ],
      ),
      body: _setPage(),
      bottomNavigationBar: BottomNavigationBar(
         key: const Key('bottom'),
         currentIndex: _index,
         items: const <BottomNavigationBarItem>[
           BottomNavigationBarItem(
             icon: Icon(Icons.cake),
            title: Text('Dessert'),
           ),
           BottomNavigationBarItem(
             icon: Icon(Icons.fastfood),
             title: Text('Seafood'),
           ),BottomNavigationBarItem(
             icon: Icon(Icons.star),
            title: Text('Favorite'),
           ),
         ],
        onTap: (index) {
          switch (index) {
            case 0:
              setState(() {
                _index = 0;
              });
              break;
            case 1:
              setState(() {
                _index = 1;
              });
              break;
            case 2:
              setState(() {
                _index = 2;
              });
              break;
          }
        },
      ),
    );
  }
}