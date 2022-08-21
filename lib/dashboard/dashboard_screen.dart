import 'package:delivery_app/common_widgets/app_banner.dart';
import 'package:delivery_app/common_widgets/app_text.dart';
import 'package:delivery_app/modelClass/model.dart';
import 'package:delivery_app/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../common_widgets/my_app_bar.dart';

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
        body: ListView(
          children: [
            // AppBanner(
            //   titel_text: "DashBoard",
            //   trailing: Icons.notifications,
            //   leading: Icons.menu,
            // ),
            myAppBar(context: context, title: 'Dashboard', page: 'Dashboard'),
            SizedBox(height: 10,),
            padded(SearchWidget()),
            SizedBox(
              height: 10,
            ),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 200,
                    crossAxisCount: 2,
                    //childAspectRatio: 1 / 1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10),
                itemCount: demoDashBoardModel.length,
                itemBuilder: (context, index) {
                  return padded(Container(

                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.lightColor,
                        border: Border.all(color: AppColors.darkGrey),
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(image: AssetImage('${demoDashBoardModel[index].imagePath}'),width: 100,height: 100,),
                          AppText(text: demoDashBoardModel[index].name),
                          Container(
                              //margin: EdgeInsets.all(15.0),
                            height: 30,
                            width: 30,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.darkColor),
                                  shape: BoxShape.circle,),

                              child: Center(child: AppText(text: demoDashBoardModel[index].counter.toString())))

                        ],
                      ),
                    ),
                  ));
                }),
          ],
        ),
      ),
    );
  }

  Widget padded(Widget widget) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: widget,
    );
  }

  Widget SearchWidget() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(20),
      color: AppColors.lightColor,
      child: Container(
        height: 60,
        padding: EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: TextField(
                  style: TextStyle(color: Colors.black87, fontSize: 16),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      fillColor: AppColors.fillColor,
                      filled: true,
                      hintText: "Search",
                      hintStyle:
                          TextStyle(fontSize: 16, color: Colors.black87))),
            ),
            InkWell(
              child: Icon(
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
}
