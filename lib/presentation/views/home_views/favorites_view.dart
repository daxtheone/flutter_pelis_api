import 'package:flutter/material.dart';

class FavoritesViewView extends StatelessWidget {
  const FavoritesViewView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Favorites View')),
      body: Center(child: Text('Favoritos')),
    );
  }
}
