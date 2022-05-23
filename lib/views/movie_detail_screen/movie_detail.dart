import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/controllers/movie_detail_controller/movie_detail_controller.dart';
import 'package:movie_app/modals/movie_detail_modal/movie_detail_modal.dart';
import 'package:movie_app/modals/movie_modal/movie_modals.dart';
import 'package:shimmer/shimmer.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieDetailScreen({Key? key}) : super(key: key);
  final id = Get.arguments['id'];
  final release_date = Get.arguments['release_date'];

  @override
  Widget build(BuildContext context) {
    final MovieDetailController movieDetailController = Get.put(MovieDetailController(id,release_date));
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Obx(() {
                // if (movieDetailController.isLoading.value) {
                //   return Container(
                //     margin: const EdgeInsets.only(top: 50),
                //     child: ListView.builder(
                //       itemCount: movieDetailController.staticlist.length,
                //       itemBuilder: (context, index) {
                //         return Container(
                //           padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                //           margin: const EdgeInsets.only(bottom: 30,left: 10, right: 10),
                //           decoration: const BoxDecoration(
                //             color: Color(0xffFFFFFF),
                //             borderRadius: BorderRadius.all(Radius.circular(20),
                //             ),
                //           ),
                //           child: Shimmer.fromColors(
                //               baseColor: const Color(0XffD3D3D3),
                //               highlightColor: const Color(0xffBBBBBB),
                //               child: Row(
                //                 children: [
                //                   Container(
                //                     decoration: const BoxDecoration(
                //                       color: Color(0xffFFFFFF),
                //                       borderRadius: BorderRadius.all(Radius.circular(200),
                //                       ),
                //                     ),
                //                     height: 50,
                //                     width: 50,
                //                   ),
                //                   const SizedBox(width: 10,),
                //                   Column(
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: [
                //                       Container(
                //                         color: const Color(0xffFFFFFF),
                //                         height: 20,
                //                         width: MediaQuery.of(context).size.width*0.35,
                //                       ),
                //                       const SizedBox(height: 5,),
                //                       Container(
                //                         color: const Color(0xffFFFFFF),
                //                         height: 20,
                //                         width: MediaQuery.of(context).size.width*0.6,
                //                       ),
                //                     ],
                //                   )
                //                 ],
                //               )
                //           ),
                //         );
                //       },
                //     ),
                //   );
                // } else {
                  return Stack(
                    children: [
                      SizedBox(
                        width: screenwidth,
                        height: MediaQuery.of(context).size.height*0.6,
                        child:
                        ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          child:
                          FadeInImage(
                            placeholder: const AssetImage('assets/moviebanner.jpg'),
                            image: NetworkImage(
                              movieDetailController.moviedetaillist[0].backdrop_path.toString(),
                            ),
                            height: 150.0,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          // (movieDetailController.moviedetaillist[0].backdrop_path.isNotEmpty)
                          //     ? Image.network(movieDetailController.moviedetaillist[0].backdrop_path.toString(),
                          //     fit: BoxFit.cover)
                          //     : Image.asset("assets/moviebanner.jpg", fit: BoxFit.cover),
                        ),
                        // ClipRRect(
                        //   child: Image.asset("assets/moviebanner.jpg", fit: BoxFit.cover),
                        // ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 107,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(24, 66, 0, 0),
                              child: Row(
                                children: const [
                                  Icon(
                                    CupertinoIcons.left_chevron,
                                    color: Color(0XffFFFFFF),
                                  ),
                                  SizedBox(
                                    width: 26,
                                  ),
                                  Text(
                                    'Watch',
                                    style: TextStyle(color: Color(0xffFFFFFF)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenwidth,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 144, bottom: 6),
                                child: Text(
                                  movieDetailController.moviedetaillist[0].original_title.toString(),
                                  maxLines: 1,
                                  style: const TextStyle(
                                      fontSize: 18,
                                      decoration: TextDecoration.underline,
                                      decorationThickness: 2,
                                      decorationStyle: TextDecorationStyle.solid,
                                      color: Color(
                                        0XffCD9D0F,
                                      )),
                                ),
                              ),
                              Text(
                                'In Theaters '+movieDetailController.release_date,
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0XffFFFFFF)),
                              ),
                              const SizedBox(height: 15,),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(horizontal: 60),
                                decoration: const BoxDecoration(
                                  color: Color(0xff61C3F2),
                                  borderRadius: BorderRadius.all(Radius.circular(10),
                                  ),
                                ),
                                child: const Center(
                                    child: Text(
                                      'Get Tickets',
                                      style: TextStyle(
                                        color: Color(0xffFFFFFF),
                                        fontWeight: FontWeight.w600
                                      ),
                                )),
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(horizontal: 60),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(10),
                                  ),
                                  border: Border.all(
                                      color: const Color(0xff61C3F2),
                                    width: 2.0
                                  )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      CupertinoIcons.play_arrow,
                                      color: Color(0XffFFFFFF),
                                    ),
                                    SizedBox(width: 8,),
                                    Text(
                                      'Watch Trailer',
                                      style: TextStyle(
                                          color: Color(0xffFFFFFF),
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 30,)
                            ]),
                          ),
                        ],
                      ),
                    ],
                  );
                // }
              }),
              const SizedBox(height: 14,),
            ],
          ),
        ));
  }
}
