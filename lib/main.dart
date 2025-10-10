import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_api/config/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:pelis_api/config/theme/app_theme.dart';

Future<void> main() async{
  await dotenv.load(fileName: '.env');
  runApp( const ProviderScope(child: MyApp()) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),

    );
  }
}

