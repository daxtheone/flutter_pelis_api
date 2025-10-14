import 'package:flutter/material.dart';

class CustomBottomNavigatorbar extends StatelessWidget {
  const CustomBottomNavigatorbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(elevation:0, items: [
      BottomNavigationBarItem(icon: Icon(Icons.home_max), label: 'Inicio'),
      BottomNavigationBarItem(icon: Icon(Icons.label_outlined), label: 'Categorías'),
      BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_outlined), label: 'Favoritos'),
    ]);
  }
}
