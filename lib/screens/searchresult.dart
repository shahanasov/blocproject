
import 'package:blocproject/apiservices/functionsapi.dart';
import 'package:blocproject/model/bloc/movie_bloc.dart';
import 'package:blocproject/widgets/search.dart';
import 'package:blocproject/widgets/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultPage extends StatelessWidget {
  SearchResultPage({
    super.key,
  });

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MovieBloc movieBloc = MovieBloc(Api());
    return BlocProvider(
      create: (context) => movieBloc,
      child: SafeArea(
        child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size(double.infinity, 500),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: const InputDecoration(
                        hintText: 'Search', prefixIcon: Icon(Icons.search)),
                    controller: searchController,
                    onChanged: (value) {
                     
                      if (value != '') {
                        
                        // String query=  searchController.text.trim();
                        movieBloc.add(SearchMovies(value));
                      }
                    },
                  ),
                )),
            body: BlocBuilder<MovieBloc, MovieState>(
              bloc: movieBloc,
              builder: (context, state) {
            
              if (state is MovieInitial) {
                // SearchMovies(searchController.text.trim());
                return const SearchPage();
              } else if (state is MovieLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is MovieLoaded) {
                return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.builder(
                        itemCount: movieBloc.searched.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 9 / 16,
                                crossAxisCount: 3,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailsPage(
                                              movie:
                                                  movieBloc.searched[index])));
                                },
                                child: Image.network(
                                    'https://image.tmdb.org/t/p/w500${movieBloc.searched[index].posterPath}'),
                              ),
                              Text(
                                movieBloc.searched[index].title,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              )
                            ],
                          );
                        }));
              } else if (state is MovieError) {
                return Center(
                  child: Text('Error: ${state.message}'),
                );
              } else {
                return const SizedBox.shrink(
                  child: Text('data'),
                );
              }
            })),
      ),
    );
  }
}
