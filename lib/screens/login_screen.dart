import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:insta_clone/resources/auth_methods.dart";
import "package:insta_clone/screens/signup_screen.dart";
import "package:insta_clone/utils/colors.dart";
import "package:insta_clone/utils/utils.dart";
import "package:insta_clone/utils/widgets/text_field.dart";
import "../responsive/mobileScreenLayout.dart";
import "../responsive/responsive_layout_screen.dart";
import "../responsive/webScreenLayout.dart";

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordContoller = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordContoller.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordContoller.text);

    if (res == 'success') {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
                mobileScreenLayout: MobileScreenLayout(),
                webScreenLayout: webScreenLayout(),
              )));
    } else {
      showsnackbar(res, context);
    }
    setState(() {
      _isLoading = false;
    });
  }

  void naviagatetosignup() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const SignupScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(child: Container(), flex: 1),
                    //svg image
                    SvgPicture.asset(
                      'assets/ic_instagram.svg',
                      color: primaryColor,
                      height: 64,
                    ),
                    const SizedBox(height: 64),
                    //Email
                    TextFieldInput(
                        textEditingController: _emailController,
                        hintText: "Enter your email",
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(height: 32),
                    //Password
                    TextFieldInput(
                      textEditingController: _passwordContoller,
                      hintText: "Enter your password",
                      textInputType: TextInputType.text,
                      isPass: true,
                    ),
                    const SizedBox(height: 32),

                    InkWell(
                      onTap: loginUser,
                      child: Container(
                        child: _isLoading
                            ? Center(
                                child: CircularProgressIndicator(
                                color: primaryColor,
                              ))
                            : const Text('Log In'),
                        width: double.infinity,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: const ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            color: blueColor),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Flexible(child: Container(), flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: const Text("Dont Have an account"),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: naviagatetosignup,
                          child: Container(
                            child: const Text(
                              "Sign up",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 8.0,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ))));
  }
}
