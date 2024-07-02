
import 'package:blocproject/apiservices/functionsapi.dart';
import 'package:blocproject/model/bloc/movie_bloc.dart';
import 'package:blocproject/widgets/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    MovieBloc movieBloc = MovieBloc(Api());
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size(double.infinity, 210),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
              child: Column(
                children: [
                
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Hot')),
                      TextButton(onPressed: () {}, child: const Text('Rating')),
                      TextButton(onPressed: () {}, child: const Text('Latest'))
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text('Drama')),
                      TextButton(
                          onPressed: () {}, child: const Text('Variety Show')),
                      TextButton(onPressed: () {}, child: const Text('Movie')),
                      TextButton(onPressed: () {}, child: const Text('Anime'))
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text('All')),
                      TextButton(
                          onPressed: () {}, child: const Text('Western')),
                      TextButton(onPressed: () {}, child: const Text('India')),
                      TextButton(
                          onPressed: () {}, child: const Text('Arab nation')),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () {}, child: const Text('All')),
                      TextButton(
                          onPressed: () {}, child: const Text('Romance')),
                      TextButton(
                          onPressed: () {}, child: const Text('Fantacy')),
                      TextButton(onPressed: () {}, child: const Text('Horror')),
                      TextButton(onPressed: () {}, child: const Text('Comedy')),
                      // TextButton(onPressed: () {}, child: const Text('Sci-fi')),
                    ],
                  ),
                ],
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocBuilder<MovieBloc, MovieState>(
            bloc: movieBloc,
            builder: (context, state) {
              // log(state.runtimeType.toString());
              if (state is MovieInitial) {
                movieBloc.add(FetchTrendingMovies());
                return const Center(child: CircularProgressIndicator());
              } else if (state is MovieLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MovieLoaded) {
                // log(movieBloc.trending.length.toString());
                return GridView.builder(
                    itemCount: movieBloc.trending.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 9 / 16,
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DetailsPage(movie: movieBloc.trending[index])));
                            },
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: SizedBox(
                                  height: 180,
                                  width: double.maxFinite,
                                  child: Image.network(
                                      colorBlendMode: BlendMode.darken,
                                      filterQuality: FilterQuality.high,
                                      fit: BoxFit.cover,
                                      "${Keys.imagePath}${movieBloc.trending[index].posterPath}"),
                                )),
                          ),
                          Text(
                            movieBloc.trending[index].title,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      );
                    });
              } else if (state is MovieError) {
                return Text('Error: ${state.message}');
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
