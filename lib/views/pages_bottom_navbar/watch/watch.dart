import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/controllers/bottom_nav_controller/watch_controller/watch_controller.dart';
import 'package:get/get.dart';
import 'package:movie_app/modals/movie_modal/movie_modals.dart';
import 'package:movie_app/routes/routes.dart';
import 'package:movie_app/views/pages_bottom_navbar/watch/watch_card.dart';
import 'package:shimmer/shimmer.dart';

class WatchPage extends StatefulWidget {
  WatchPage({Key? key}) : super(key: key);

  @override
  State<WatchPage> createState() => _WatchPageState();
}
final _searchController = TextEditingController();
bool check = false;

class _WatchPageState extends State<WatchPage> {
  @override
  void initState() {
    // TODO: implement initState
    _searchController.text = '';
    super.initState();
  }
  final WatchController watchController = Get.put(WatchController());

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    var textfieldtext;
    String query1 = '';
    return Scaffold(
      body: Container(
        color: const Color(0XFFDBDBDF),
        child: Column(
          children: [
            Container(
              color: const Color(0XFFFFFFFF),
              padding: const EdgeInsets.fromLTRB(22, 67, 9, 24),
              width: screenwidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Watch',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0XFF202C43),
                    ),
                  ),
                  IconButton(
                      icon: const Icon(CupertinoIcons.search),
                    onPressed: () {
                        Get.toNamed(
                          AppLinks.moviesearchscreen,
                        );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Obx(() {
                if (watchController.isLoading.value) {
                  return ListView.builder(
                    itemCount: watchController.staticlist.length,
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
                  return ListView.builder(
                      itemCount: check == true  ?
                      watchController.movieListsearch.length :
                      watchController.movieList.length,
                      itemBuilder: (context, index) {
                        return MovieCard(
                          movieModal: check == true ?
                          watchController.movieListsearch[index] :
                          watchController.movieList[index],
                        );
                      });
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
