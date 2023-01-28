import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:healthy_crops/util/const.dart';

import '../model/disease.dart';

class DiseaseCard extends StatelessWidget {
  final Disease disease;
  const DiseaseCard({super.key, required this.disease});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 4.1 / 3.2,
      child: Padding(
        padding: EdgeInsets.only(top: 12.h, left: 10.h, right: 10.h),
        child: Container(
          // decoration: BoxDecoration(
          //     image: DecorationImage(
          //   image: NetworkImage(disease.imageUrl!),
          // )),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 10,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: cardBg
                  // gradient: LinearGradient(
                  //   colors: [
                  //     buttonColor.withOpacity(0.2),
                  //     buttonColor.withOpacity(0.3),
                  //     buttonColor.withOpacity(0.5),
                  //     buttonColor.withOpacity(0.7),
                  //   ],
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomCenter,
                  // ),
                  ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Center(
                      child: ClipRRect(
                          child: Container(
                        width: 330,
                        height: 150.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(disease.imageUrl!),
                          ),
                        ),
                      )
                          //  Container(
                          //   height: 140.h,
                          //   child: FittedBox(
                          //     child: Image.network(
                          //       disease.imageUrl!,
                          //       fit: BoxFit.fill,
                          //     ),
                          //   ),
                          // ),
                          ),
                    ),
                    Chip(
                      // backgroundColor: const Color(0xff00777F),
                      backgroundColor: const Color(0xffEBC7E6),
                      label: Text(
                        disease.cropTitle!,
                        style: const TextStyle(
                          // color: Colors.white,
                          color: buttonColor,
                          fontFamily: 'Montserrat-Regular',
                        ),
                      ),
                    ),
                    // TileText(title: disease.title!),
                    Text(
                      disease.title!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Lato'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


// class DiseaseCard extends StatelessWidget {
//   final Disease disease;
//   const DiseaseCard({super.key, required this.disease});

//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 4.1 / 3.2,
//       child: Padding(
//         padding: EdgeInsets.only(top: 12.h, left: 10.h, right: 10.h),
//         child: Container(
//           // decoration: BoxDecoration(
//           //     image: DecorationImage(
//           //   image: NetworkImage(disease.imageUrl!),
//           // )),
//           child: Card(
//             // color: cardBg,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             elevation: 5,
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Center(
//                     child: ClipRRect(
//                       clipBehavior: Clip.antiAlias,
//                       child: Container(
//                         height: 140.h,
//                         child: Image.network(
//                           disease.imageUrl!,
//                           fit: BoxFit.fitWidth,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Chip(
//                     backgroundColor: const Color(0xff00777F),
//                     label: Text(
//                       disease.cropTitle!,
//                       style: const TextStyle(color: Colors.white),
//                     ),
//                   ),
//                   TileText(title: disease.title!),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
