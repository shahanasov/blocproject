import 'package:flutter/material.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  // late Future<List<Movie>> trendingMovies;
  @override
  Widget build(BuildContext context) {
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
                      ElevatedButton(onPressed: (){}, child: const Text('Hot')),
                      TextButton(onPressed: () {}, child: const Text('Rating')),
                      TextButton(onPressed: () {}, child: const Text('Latest'))
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(onPressed: (){}, child: const Text('Drama')),
                      TextButton(
                          onPressed: () {}, child: const Text('Variety Show')),
                      TextButton(onPressed: () {}, child: const Text('Movie')),
                      TextButton(onPressed: () {}, child: const Text('Anime'))
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(onPressed: (){}, child: const Text('All')),
                      TextButton(
                          onPressed: () {}, child: const Text('Western')),
                      TextButton(onPressed: () {}, child: const Text('India')),
                      TextButton(
                          onPressed: () {}, child: const Text('Arab nation')),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(onPressed: (){}, child: const Text('All')),
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
          child: GridView.builder(
              itemCount: 20,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 9 / 16,
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              itemBuilder: (context, index) {
                return const Text('data');
                // return FutureBuilder(
                //   future: ,
                //     // future: trendingMovies,
                //     builder: (context, snapshot) {
                //       if (snapshot.hasError) {
                //         return Center(
                //           child: Text(snapshot.error.toString()),
                //         );
                //       } else if (snapshot.hasData) {
                //         // final data=snapshot.data;
                //         return Column(
                //           children: [
                //             // InkWell(
                //             //   onTap: () {
                //             //     // Navigator.push(
                //             //     //     context,
                //             //     //     MaterialPageRoute(
                //             //     //         builder: (context) => DetailsPage(
                //             //     //             movie: snapshot.data![index])));
                //             //   },
                //             //   child: Image.network(
                //             //       filterQuality: FilterQuality.high,
                //             //       fit: BoxFit.cover,
                //             //       'https://image.tmdb.org/t/p/w500/${snapshot.data![index].posterPath}'),
                //             // ),
                //             // Text(
                //             //   snapshot.data![index].title,
                //             //   overflow: TextOverflow.ellipsis,
                //             //   textAlign: TextAlign.center,
                //             // )
                //           ],
                //         );
                //       } else {
                //         return const Center(
                //           child: CircularProgressIndicator(),
                //         );
                //       }
                //     });
              }),
        ),
      ),
    );
  }
}
