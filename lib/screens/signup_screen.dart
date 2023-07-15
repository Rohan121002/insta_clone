import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:image_picker/image_picker.dart";
import "package:insta_clone/resources/auth_methods.dart";
import "package:insta_clone/screens/login_screen.dart";
import "package:insta_clone/utils/utils.dart";
import "../utils/colors.dart";
import "../utils/widgets/text_field.dart";

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List? _image;

  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectImage() async {
    Uint8List? im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void naviagatetologin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String? res = await AuthMethods().signUpUser(
        email: _emailController.text,
        password: _passwordController.text,
        username: _usernameController.text,
        bio: _bioController.text,
        file: _image!);

    setState(() {
      _isLoading = false;
    });

    if (res != 'success') {
      showsnackbar(res, context);
    } else {}
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
                    const SizedBox(height: 24),

                    //circular widget to accept and show our selected file
                    Stack(
                      children: [
                        _image != null
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: MemoryImage(_image!),
                              )
                            : const CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    'https://images.unsplash.com/photo-1687789903381-d2e97615f06a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                              ),
                        Positioned(
                            bottom: -10,
                            left: 80,
                            child: IconButton(
                              onPressed: selectImage,
                              icon: const Icon(
                                Icons.add_a_photo,
                              ),
                            ))
                      ],
                    ),
                    const SizedBox(height: 24),

                    //username
                    TextFieldInput(
                        textEditingController: _usernameController,
                        hintText: "Enter your username",
                        textInputType: TextInputType.text),
                    const SizedBox(height: 24),

                    //Email
                    TextFieldInput(
                        textEditingController: _emailController,
                        hintText: "Enter your email",
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(height: 24),

                    //Password
                    TextFieldInput(
                      textEditingController: _passwordController,
                      hintText: "Enter your password",
                      textInputType: TextInputType.text,
                      isPass: true,
                    ),
                    const SizedBox(height: 24),

                    //bio
                    TextFieldInput(
                        textEditingController: _bioController,
                        hintText: "Enter your Bio",
                        textInputType: TextInputType.text),
                    const SizedBox(height: 24),

                    InkWell(
                      onTap: signUpUser,
                      child: Container(
                        child: _isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: primaryColor,
                              ))
                            : const Text('Login In'),
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
                    Flexible(child: Container(), flex: 1),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: const Text("Already Have an account?"),
                          padding: const EdgeInsets.symmetric(
                            vertical: 8.0,
                          ),
                        ),
                        GestureDetector(
                          onTap: naviagatetologin,
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
