import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/search_movie_controller.dart';
import 'package:movie_app/routes/routes.dart';
import 'package:movie_app/views/pages_bottom_navbar/watch/watch_card.dart';
import 'package:movie_app/views/search/movie_search_card.dart';
import 'package:shimmer/shimmer.dart';

class MovieSearchScreen extends StatefulWidget {
  const MovieSearchScreen({Key? key}) : super(key: key);

  @override
  State<MovieSearchScreen> createState() => _MovieSearchScreenState();
}
final _searchController = TextEditingController();
bool check = false;

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  void initState() {
    // TODO: implement initState
    _searchController.text = '';
    super.initState();
  }
  final SearchController searchController = Get.put(SearchController());
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    var textfieldtext;
    String query1 = '';
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffDBDBDF),
        body: Column(
          children: [
            Container(
              color: const Color(0XFFFFFFFF),
              width: screenwidth,
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 20, 10, 30),
                decoration: const BoxDecoration(
                  color: Color(0xffDBDBDF),
                  // color: Colors.red,
                  borderRadius: BorderRadius.all(Radius.circular(20),
                  ),
                ),
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    hintText: 'TV shows, movies and more',
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                        icon: const Icon(CupertinoIcons.xmark),
                        onPressed: () {
                        }),
                    prefixIcon: IconButton(
                        icon: const Icon(CupertinoIcons.search),
                        color: const Color(0xff2E2739),
                        onPressed: () {
                        }),
                  ),
                    onChanged: (String query) {
                      query1 = query;
                      textfieldtext = _searchController.text.trim();
                      searchController.suggestions = searchController.movieList.where((categoryfilter) {
                        final categoryTitle = categoryfilter.title.toLowerCase();
                        final input = query1.toLowerCase();
                        return categoryTitle.contains(input);
                      }).toList();
                      setState(() {
                        searchController.movieListsearch = searchController.suggestions;
                        check = true;
                      });

                    },
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Expanded(
              child: Obx(() {
                if (searchController.isLoading.value) {
                  return ListView.builder(
                    itemCount: searchController.staticlist.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                        margin: const EdgeInsets.only(bottom: 30,left: 10, right: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xffFFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(20),
                          ),
                        ),
                        child: Shimmer.fromColors(
                            baseColor: const Color(0XffD3D3D3),
                            highlightColor: const Color(0xffBBBBBB),
                            child: Row(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    color: Color(0xffFFFFFF),
                                    borderRadius: BorderRadius.all(Radius.circular(200),
                                    ),
                                  ),
                                  height: 50,
                                  width: 50,
                                ),
                                const SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      color: const Color(0xffFFFFFF),
                                      height: 20,
                                      width: MediaQuery.of(context).size.width*0.35,
                                    ),
                                    const SizedBox(height: 5,),
                                    Container(
                                      color: const Color(0xffFFFFFF),
                                      height: 20,
                                      width: MediaQuery.of(context).size.width*0.6,
                                    ),
                                  ],
                                )
                              ],
                            )
                        ),
                      );
                    },
                  );
                } else {
                    return Container(
                      margin: const EdgeInsets.only(left: 10,right: 10,bottom: 20),
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: MediaQuery.of(context).size.width*0.5,
                            childAspectRatio: 3.2/2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                        itemCount: check == true  ?
                        searchController.movieListsearch.length :
                        searchController.movieList.length,
                        itemBuilder: (context, index) {
                          return MovieSearchCard(
                            movieModal: check == true ?
                            searchController.movieListsearch[index] :
                            searchController.movieList[index],
                          );
                        },),
                    );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
