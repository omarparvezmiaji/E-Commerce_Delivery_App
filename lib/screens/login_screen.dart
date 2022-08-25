import 'package:flutter/material.dart';
import '../common_widgets/app_button.dart';
import '../common_widgets/input_text.dart';
import 'dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  var _hideText = true;

  viewPass() {
    setState(() {
      _hideText = !_hideText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          shrinkWrap: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          children: <Widget>[
            //Image
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Colors.white70,
          child: Image.asset("assets/delivery_man_Login.png"),

                //   child: Image.asset("assets/delivery_man.png"),

              ),
            ),

            Container(
              padding: const EdgeInsets.only(
                top: 8,
                left: 12,
                right: 12,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                // color: Color(0xfff6f6f6)
                // color: Colors.white70
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  // const Text('Login '),
                  const SizedBox(
                    height: 12,
                  ),
                  inputText(context,
                      value: usernameController,
                      hintText: 'Phone *',
                      prefixIcon: Icons.phone,
                      message: 'Phone',
                      maxLength: 11,
                      autoFillHints: AutofillHints.telephoneNumber,
                      type: TextInputType.number),
                  const SizedBox(
                    height: 25,
                  ),
                  inputText(
                    context,
                    value: passwordController,
                    hintText: 'Password *',
                    prefixIcon: Icons.lock,
                    message: 'Password',
                    obsecureText: _hideText,
                    type: TextInputType.text,
                    autoFillHints: AutofillHints.password,
                    visibility: InkWell(
                      onTap: viewPass,
                      child: _hideText
                          ? const Icon(
                              Icons.visibility_off,
                              size: 18,
                            )
                          : const Icon(
                              Icons.visibility,
                              size: 25,
                            ),
                    ),
                  ),

                  // Align(
                  //     alignment: Alignment.centerRight,
                  //     child: TextButton(
                  //         onPressed: () {
                  //           // Navigator.push(
                  //           //     context,
                  //           //     MaterialPageRoute(
                  //           //         builder: (context) =>
                  //           //             ForgetPasswordScreen()));
                  //         },
                  //         child: const Text(
                  //           'Forgot Password?',
                  //           style: TextStyle(fontSize: 15),
                  //         ))),
                  const SizedBox(
                    height: 40,
                  ),
                  AppButton(
                    label: 'LOGIN NOW',
                    roundness: 20.0,
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Dashboard()),
                          (route) => false);
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
