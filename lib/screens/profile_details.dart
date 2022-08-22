import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../common_widgets/app_custom_buttom.dart';
import '../common_widgets/my_app_bar.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            myAppBar(context: context, title: 'Profile', page: 'Profile'),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    // height: _size.height,
                    height: _size.height * 0.84,
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
                              const Text(
                                'Dev',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              const Text(
                                'SmartDev@gmail.com',
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
                                  buildProfileInfo("Mobile", "01686985487"),
                                  buildProfileInfo("Tel", "0123456789"),
                                  buildProfileInfo("Address", "Banani, Dhaka"),
                                  buildProfileInfo("Postal code", "1234"),
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

                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          primary: Colors.white,
                          elevation: 4,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 70,
                            vertical: 10,
                          ),
                        ),
                        child: const Text(
                          'Edit Profile',
                          style: TextStyle(fontSize: 24, color: Colors.black45),
                        ),
                      ),
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

