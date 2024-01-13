import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/assets/colors.dart';
import 'package:instagram_clone/assets/constants.dart';
import 'package:instagram_clone/widgets/textfield_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

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
          TextFieldInput(
            controller: _emailController,
            hintText: AppConstatns.emailHint,
            inputType: TextInputType.emailAddress,
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
            onTap: () {},
            child: Container(
              child: const Text('Log in'),
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: ShapeDecoration(
                  color: blueColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4))),
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
                child: const Text(AppConstatns.registerQuestion),
              ),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: const Text(
                    AppConstatns.registerText,
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