import 'package:go_router/go_router.dart';
import 'package:pelis_api/presentation/screens/screens.dart';

import '../../presentation/views/views.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) {
            return HomeView();
          },
          routes: [
            GoRoute(
                path: 'movie/:id',
                name: MovieScreen.name,
                builder: (context, state) {
                  final movieId = state.pathParameters['id'] ?? 'no-id';
                  return  MovieScreen(movieId: movieId,);
                }
            )
          ]
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) {
            return FavoritesViewView();
          },
        ),
      ],
      builder: (context, state, child) {
        return HomeScreen(childView: child);
      },
    ),
    /*    RUTAS PADRE E HIJO FUNCIONA BIEN
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => HomeScreen( childView: HomeView(),),
      routes: [
        GoRoute(
            path: 'movie/:id',
            name: MovieScreen.name,
            builder: (context, state) {
              final movieId = state.pathParameters['id'] ?? 'no-id';
              return  MovieScreen(movieId: movieId,);
            }
        ),
      ]
    ),
    */
  ],
);
