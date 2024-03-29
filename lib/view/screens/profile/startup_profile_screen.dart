import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constant/assets.dart';

class StartupProfileScreen extends StatelessWidget {
  const StartupProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 1,
      //   backgroundColor: Colors.white,
      //   centerTitle: false,
      //   title: Row(
      //     children: [
      //       SvgPicture.asset(
      //         softwareLogo,
      //       ),
      //       SizedBox(
      //         width: 10.w,
      //       ),
      //       Text(
      //         "Startup Name",
      //         style: TextStyle(fontSize: 16.sp),
      //       ),
      //     ],
      //   ),
      //   actions: [
      //     Padding(
      //       padding: EdgeInsets.only(right: 15.0.w),
      //       child: SvgPicture.asset(
      //         chat,
      //       ),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(15.0.h),
          child: SafeArea(
            child: Column(
              children: [
                Row(
                  children: [
                    // ICON:
                    SvgPicture.asset(
                      softwareLogo,
                      height: 50.h,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    // Startup Name :
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Software House",
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        Text(
                          "50 Followers",
                          style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                        ),
                      ],
                    ),
                    Spacer(),
                    // Post time:

                    SizedBox(
                      width: 10.w,
                    ),
                    // More Icon:
                   Container(
                     padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 3.h),
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(10),
                       border: Border.all(color: Colors.orange)
                     ),
                     child: Text(
                       "Edit Profile",
                       style: TextStyle(
                         color: Colors.orange,
                         fontSize: 15
                       ),
                     ),
                   )
                    //SizedBox(width: 10.w,)
                  ],
                ),

                SizedBox(
                  height: 20.h,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const PostWidget(
                  image: "",
                  companyLogo: softwareLogo,
                  companyName: 'Software House',
                  postBody:
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specime....   Read More ',
                ),
                SizedBox(
                  height: 20.h,
                ),
                const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const PostWidget(
                  companyLogo: softwareLogo,
                  companyName: "Software House",
                  postBody: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. ",
                 // image: "assets/icons/VideoActive.svg",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class PostWidget extends StatelessWidget {
  final String companyLogo;
  final String companyName;
  final String postBody;
  final String? image;

  const PostWidget({
    super.key,
    required this.companyLogo,
    required this.companyName,
    required this.postBody,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            // ICON:
            SvgPicture.asset(
              companyLogo,
            ),
            SizedBox(
              width: 10.w,
            ),
            // Startup Name :
            Text(
              companyName,
              style: TextStyle(fontSize: 16.sp),
            ),
            Spacer(),
            // Post time:
            Text(
              "2m",
              style: TextStyle(fontSize: 13.sp, color: Colors.grey),
            ),
            SizedBox(
              width: 10.w,
            ),
            // More Icon:
            SvgPicture.asset(
              more,
              width: 15.w,
            ),
            //SizedBox(width: 10.w,)
          ],
        ),
        SizedBox(
          height: 12.h,
        ),
        // Post Body:
        Container(
          width: double.infinity,
          child: Column(
            children: [
              Text(
                postBody,
                // maxLines: 5,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 15.sp),
              ),
              // SvgPicture.asset(
              //   image!,
              //   width: double.infinity,
              //
              // ),
            ],
          ),
        ),
        SizedBox(
          height: 12.h,
        ),
        // Like and Dislike:
        Row(
          children: [
            // Like ICON:
            SvgPicture.asset(
              heart,
            ),
            SizedBox(
              width: 5.w,
            ),
            // Number of likes :
            Text(
              "50",
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(
              width: 12.w,
            ),
            // DisLike ICON:
            SvgPicture.asset(
              arrowRepeat,
            ),
            SizedBox(
              width: 5.w,
            ),
            // Number of Dislikes :
            Text(
              "50",
              style: TextStyle(fontSize: 16.sp),
            ),
          ],
        ),
      ],
    );
  }
}
