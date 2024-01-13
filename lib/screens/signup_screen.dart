import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/assets/colors.dart';
import 'package:instagram_clone/assets/constants.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/widgets/textfield_input.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwdController.dispose();
    _userNameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  selectImage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Flexible(
            child: Container(),
            flex: 2,
          ),
          SvgPicture.asset(
            'assets/icons/ic_instagram.svg',
            color: primaryColor,
            height: 64,
          ),
          const SizedBox(
            height: 64,
          ),
          Stack(
            children: [
              const CircleAvatar(
                radius: 64,
                backgroundImage: NetworkImage(
                    'https://plus.unsplash.com/premium_photo-1670349265468-13aa73d01a95?q=80&w=1598&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              ),
              Positioned(
                  bottom: -5,
                  left: 80,
                  child: IconButton(
                    onPressed: selectImage(),
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: Colors.white,
                    ),
                  ))
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldInput(
            controller: _userNameController,
            hintText: AppConstatns.usernameHint,
            inputType: TextInputType.text,
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldInput(
            controller: _emailController,
            hintText: AppConstatns.emailHint,
            inputType: TextInputType.emailAddress,
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldInput(
            controller: _bioController,
            hintText: AppConstatns.bioHint,
            inputType: TextInputType.text,
          ),
          const SizedBox(
            height: 24,
          ),
          TextFieldInput(
            controller: _pwdController,
            hintText: AppConstatns.passwordHint,
            inputType: TextInputType.text,
            isPwd: true,
          ),
          const SizedBox(
            height: 24,
          ),
          GestureDetector(
            onTap: () async {
              var res = await AuthMethods().signUpUser(
                email: _emailController.text,
                password: _pwdController.text,
                username: _userNameController.text,
                bio: _bioController.text,
              );
              print(res);
            },
            child: Container(
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: ShapeDecoration(
                  color: blueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
              child: const Text(AppConstatns.registerText),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text(AppConstatns.loginQuestion),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    AppConstatns.loginText,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          )
        ]),
      )),
    );
  }
}
