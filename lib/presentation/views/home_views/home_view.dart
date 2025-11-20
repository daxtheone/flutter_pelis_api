import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../../widgets/widgets.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();

  }

  @override
  Widget build(BuildContext context) {

    final initialLoading= ref.watch(initialLoadingProvider);
    if(initialLoading) return FullScreenLoader();

    final moviesSlideshow = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);

    if (moviesSlideshow.length == 0) return CircularProgressIndicator();

    return CustomScrollView(
      slivers: [
        SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                // CustomAppbar(),
                MoviesSlideshow(movies: moviesSlideshow),
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'En cine',
                  subTitle: 'Lunes 20',
                  loadNextPage: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'Próximamente',
                  subTitle: 'En este mes',
                  loadNextPage: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MovieHorizontalListview(
                  movies: popularMovies,
                  title: 'Populares',
                  //subTitle: 'Lunes 20',
                  loadNextPage: () => ref
                      .read(popularMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MovieHorizontalListview(
                  movies: nowPlayingMovies,
                  title: 'Mejor Calificada',
                  subTitle: 'De siempre',
                  loadNextPage: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                SizedBox(height: 50),
                /*Expanded(
            child: ListView.builder(itemCount:nowPlayingMovies.length, itemBuilder: (context, index){
              final movie = nowPlayingMovies[index];
              return ListTile(
                  title: Text(movie.title)
              );
            }),
          )*/
              ],
            );
          }, childCount: 1),
        ),
      ],
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          CustomAppbar(),
          MoviesSlideshow(movies: moviesSlideshow),
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'En cine',
            subTitle: 'Lunes 20',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Próximamente',
            subTitle: 'En este mes',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Populares',
            //subTitle: 'Lunes 20',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Mejor Calificada',
            subTitle: 'De siempre',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
          SizedBox(height: 50),
          /*Expanded(
            child: ListView.builder(itemCount:nowPlayingMovies.length, itemBuilder: (context, index){
              final movie = nowPlayingMovies[index];
              return ListTile(
                  title: Text(movie.title)
              );
            }),
          )*/
        ],
      ),
    );
  }
}
