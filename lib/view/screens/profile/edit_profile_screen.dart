import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_odc_tasks/view/constant/assets.dart';
import 'package:my_odc_tasks/view/profile_screen_items.dart';
import 'package:my_odc_tasks/view/screens/profile/widgets/edit_card.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Text(
          "Edit profile",
          style: TextStyle(fontSize: 20),
        ),
        leading: Icon(Icons.arrow_back_ios),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120.h,
                width: double.infinity,
                //color: Colors.orange,
                child: Center(
                  child: Stack(
                    children: [
                      // Edite Pic:
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset(
                          softwareLogo,
                          height: 50.h,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 25.h,
                          width: 25.w,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // Bank Account:
              ProfileScreenItems(
                prefixIcon: SvgPicture.asset(softwareLogo),
                title: "Bank account",
                onTap: (){},
              ),
              SizedBox(
                height: 10.h,
              ),
              ProfileScreenItems(
                prefixIcon: SvgPicture.asset(softwareLogo),
                title: "Info",
                onTap: (){},
              ),
              SizedBox(
                height: 10.h,
              ),
              ProfileScreenItems(
                prefixIcon: SvgPicture.asset(softwareLogo),
                title: "Address",
                onTap: (){},
              ),

            ],
          ),
        ),
      ),
    );
  }
}
