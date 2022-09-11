import 'package:delivery_app/common_widgets/Drawer.dart';

import 'package:delivery_app/common_widgets/app_text.dart';
import 'package:delivery_app/common_widgets/my_app_bar.dart';
import 'package:delivery_app/modelClass/model.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: myDrawer(context),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // AppBanner(
              //   //leading: Icons.menu,
              //   titel_text: "DashBoard",
              //   //trailing: Icons.notifications,onPressed: getButton(context),
              // ),
              myAppBar(context: context, title: 'DashBoard', page: 'DashBoard'),
              /// search bar___________
              // padded(SearchWidget()),
              const SizedBox(
                height: 100.0,
              ),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 200,
                    crossAxisCount: 2,
                    //childAspectRatio: 1 / 1,
                    crossAxisSpacing: 0,
                    //mainAxisSpacing: 10
                  ),
                  itemCount: demoDashBoardModel.length,
                  itemBuilder: (context, index) {
                    return padded(GestureDetector(
                      onTap: () {
                        // if(demoDashBoardModel[index].name != "Complete Delivery")
                        // {
                        //   Navigator.push(context, MaterialPageRoute(builder: (context) => demoDashBoardModel[index].pageName));
                        //   // Navigator.push(context, MaterialPageRoute(builder: (context)=>(){}));
                        // }

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    demoDashBoardModel[index].pageName));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: AppColors.lightColor,
                            border: Border.all(color: AppColors.darkGrey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                  image: AssetImage(
                                      '${demoDashBoardModel[index].imagePath}'),
                                  width: 90,
                                  height: 90),
                              AppText(
                                  text: demoDashBoardModel[index].name,
                                  fontSize: 18.0),
                              // Container(
                              //   margin: EdgeInsets.all(15.0),
                              //     height: 30,
                              //     width: 30,
                              //     decoration: BoxDecoration(
                              //       border: Border.all(color: AppColors.darkColor),
                              //       shape: BoxShape.circle,),

                              //     child: Center(child: AppText(text: demoDashBoardModel[index].counter.toString(),fontSize:  18.0)))
                            ],
                          ),
                        ),
                      ),
                    ));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget padded(Widget widget) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: widget,
    );
  }

  Widget SearchWidget() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: AppColors.lightColor,
      child: Container(
        height: 70,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                  style: const TextStyle(color: Colors.black87, fontSize: 20),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: AppColors.fillColor,
                      filled: true,
                      hintText: "Search",
                      hintStyle: const TextStyle(
                          fontSize: 20, color: Colors.black87))),
            ),
            InkWell(
              child: const Icon(
                Icons.search,
                size: 25,
              ),
              onTap: () {
                print("Taped on Search Icon...");
              },
            ),
          ],
        ),
      ),
    );
  }

// Widget getButton(BuildContext context) {
//   return AppButton(
//     label: "Start",
//     fontWeight: FontWeight.w700,
//     padding: const EdgeInsets.symmetric(vertical: 25),
//     onPressed: () {
//       onGetStartedClicked(context);
//     },
//   );
// }
// void onGetStartedClicked(BuildContext context) {
//   Navigator.of(context).pushReplacement(MaterialPageRoute(
//     builder: (BuildContext context) {
//       return const Notifications_Empty();
//     },
//   ));
// }
}
