import 'package:blocproject/apiservices/functionsapi.dart';
import 'package:blocproject/model/bloc/movie_bloc.dart';
import 'package:blocproject/widgets/details.dart';
import 'package:blocproject/widgets/scrollitems.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MovieBloc movieBloc = context.read();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text('GoTV'),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<MovieBloc, MovieState>(
              bloc: movieBloc,
              builder: (context, state) {
                if (state is MovieInitial) {
                  context.read<MovieBloc>().add(FetchTrendingMovies());
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MovieLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MovieLoaded) {
                  return SizedBox(
                    width: 900,
                    child: CarouselSlider.builder(
                      itemCount: movieBloc.trending.length,
                      itemBuilder: (context, index, indexpage) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                    movie: movieBloc.trending[index])));
                          },
                          child: SizedBox(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Image.network(
                                colorBlendMode: BlendMode.darken,
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                                "${Keys.imagePath}${movieBloc.trending[index].posterPath}"),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        padEnds: false,
                        aspectRatio: 9 / 16,
                        enlargeCenterPage: false,
                        pageSnapping: true,
                        height: 450,
                        autoPlay: true,
                        viewportFraction: 1.0,
                        autoPlayCurve: Curves.fastOutSlowIn,
                      ),
                    ),
                  );
                } else if (state is MovieError) {
                  return Text('Error: ${state.message}');
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Top Rated Movies'),
            ),
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is MovieInitial) {
                  context.read<MovieBloc>().add(FetchTopRatedMovies());
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MovieLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MovieLoaded) {
                  return ScrollItems(
                    movie: movieBloc.topRated,
                  );
                } else if (state is MovieError) {
                  return Text('Error: ${state.message}');
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text('Top Upcoming Movies'),
            ),
            BlocBuilder<MovieBloc, MovieState>(
              builder: (context, state) {
                if (state is MovieInitial) {
                  context.read<MovieBloc>().add(FetchUpcomingMovies());
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MovieLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MovieLoaded) {
                  return ScrollItems(
                    movie: movieBloc.upComing,
                  );
                } else if (state is MovieError) {
                  return Text('Error: ${state.message}');
                } else {
                  return Container();
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            // const ScrollItems()
          ],
        ),
      ),
    );
  }
}
