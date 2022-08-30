//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../common_widgets/Drawer.dart';
// import '../common_widgets/app_custom_buttom.dart';
// import '../common_widgets/my_app_bar.dart';
// import '../styles/colors.dart';
// import 'dashboard/dashboard_screen.dart';
// import 'package:flutter_svg/svg.dart';
import 'login.dart';

class ProfileDetails extends StatefulWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  State<ProfileDetails> createState() => _ProfileDetailsState();
}

class _ProfileDetailsState extends State<ProfileDetails> {

  SharedPreferences? prefs;
  var name;
  var email;
  var phone;
  var address;
  var area;

  sharedPreferences() async{
    prefs = await SharedPreferences.getInstance();
    setState((){
      name= prefs!.getString('name').toString() ;
      email= prefs!.getString('email').toString();
      phone= prefs!.getString('phone').toString();
      address= prefs!.getString('address').toString();
      area= prefs!.getString('area_name').toString();
    });
    //area= prefs!.getString('Aname').toString();
    print("For Testing Name:::::::" + name );
    print("For Testing Email:::::::" + email );
    print("For Testing Email:::::::" + phone );
    print("For Testing Email:::::::" + address );
    print("For Testing Email:::::::" + area );
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharedPreferences();
  }



  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
       // drawer: myDrawer(context),
        body: Column(
          children: [
          //  myAppBar(context: context, title: 'Profile', page: 'Profile'),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    // height: _size.height,
                    height: _size.height * 0.77,
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          width: double.infinity,
                          child: Image.asset(
                            'assets/images/profile_back.png',
                            height: 300,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Positioned(
                          top: 45,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: const CircleAvatar(
                                  backgroundColor: Color(0xff2C4CEC),
                                  radius: 58,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 52,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage(
                                          "assets/images/burger1.jpg"),
                                      //NetworkImage
                                      radius: 50,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                               Text(
                                name ?? '',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                               SizedBox(
                                height: 3,
                              ),
                               Text(
                                email ?? '',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 250,
                          child: Container(
                            height: _size.height / 5 * 2.3,
                            width: _size.width - 40,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.grey,
                              ),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 4,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 50),
                              child: Column(
                                children: [
                                  buildProfileInfo("Mobile", phone ?? ''),
                                  //buildProfileInfo("Tel", "0123456789"),
                                  buildProfileInfo("Address", address ?? ''),
                                  buildProfileInfo("Delivery Area", area ?? ''),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      ElevatedButton.icon(
                        onPressed: () {

                          Navigator.of(context).pushReplacement(new MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return  LoginPage();
                                        },
                                      ));

                        },
                        icon: Icon(
                          Iconsax.logout,
                          color: Colors.white,
                        ),
                        // style: ElevatedButton.styleFrom(
                        //   shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(50.0),
                        //   ),
                        //   primary: Colors.white,
                        //   elevation: 4,
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: 70,
                        //     vertical: 10,
                        //   ),
                        // ),
                        label:   Text(
                          '  Logout',
                          style: TextStyle(color: Colors.white),
                        ),

                      ),


                      // ElevatedButton(
                      //   onPressed: () {},
                      //   style: ElevatedButton.styleFrom(
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(50.0),
                      //     ),
                      //     primary: Colors.white,
                      //     elevation: 4,
                      //     padding: const EdgeInsets.symmetric(
                      //       horizontal: 70,
                      //       vertical: 10,
                      //     ),
                      //   ),
                      //   child: const Text(
                      //     'Edit Profile',
                      //     style: TextStyle(fontSize: 24, color: Colors.black45),
                      //   ),
                      // ),

                      // Padding(
                      //   padding:
                      //   const EdgeInsets.only(left: 15, right: 150, top: 20, bottom: 20),
                      //   child: ElevatedButton(
                      //       onPressed: () {
                      //         // Navigator.push(
                      //         //     context,
                      //         //     PageTransition(
                      //         //         child: LoginPage(),
                      //         //         type: PageTransitionType.rightToLeft));
                      //
                      //         Navigator.of(context).pushReplacement(new MaterialPageRoute(
                      //           builder: (BuildContext context) {
                      //             return const Dashboard();
                      //           },
                      //         ));
                      //       },
                      //       style: ElevatedButton.styleFrom(
                      //           primary: AppColors.buttonColor,
                      //           //  primary: Colors.red[900],
                      //           elevation: 5.0,
                      //           shape: const StadiumBorder(),
                      //         // fixedSize: const Size(100, 40)
                      //
                      //       ),
                      //       child:
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: const [
                      //           Icon(
                      //             Iconsax.logout,
                      //             color: Colors.white,
                      //           ),
                      //           Text(
                      //             '  Logout',
                      //             style: TextStyle(color: Colors.white),
                      //           )
                      //         ],
                      //       )),
                      // ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileInfo(String title, value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black45,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  " :  $value",
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black45,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}

