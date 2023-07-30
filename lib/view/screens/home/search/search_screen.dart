import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_odc_tasks/view/components/core/textfields/custom_text_form_filed.dart';

class SearchScreen extends StatelessWidget {
  final FocusNode searchNode = FocusNode();

  final TextEditingController searchController = TextEditingController();

  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Search Bar :
              TextFormFieldsCustom(
                controller: searchController,
                focus: searchNode,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 25,
                ),
                hintText: "Search",
                borderColor: Colors.transparent,
                enableInteractive: true,
                borderRadius: 20,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Your search history",
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              Wrap(
                children: List.generate(4, (index) => searchHistoryWidget()),
              ),

              SizedBox(
                height: 20.h,
              ),
              Text(
                "You may know",
                style: TextStyle(fontSize: 18.sp),
              ),
              SizedBox(
                height: 15.h,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    ),
                child: Wrap(
                  children: List.generate(5, (index) => youMayKnowWidget()),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

Widget searchHistoryWidget() {
  return Expanded(
    child: Container(

      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black)),
      child: Text(
        "Said Soudy",
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
    ),
  );
}
Widget youMayKnowWidget() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage("assets/icons/AppIcon.png"),
            ),
        SizedBox(height: 5.h,),
        Text(
          "ODC"
        )
      ],
    ),
  );
}
