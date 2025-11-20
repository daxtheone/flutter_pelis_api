import 'package:flutter/material.dart';
import 'package:pelis_api/presentation/widgets/widgets.dart';

import '../../providers/providers.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';
  final Widget childView;
  const HomeScreen({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      bottomNavigationBar: CustomBottomNavigatorbar(),
    );
  }
}

