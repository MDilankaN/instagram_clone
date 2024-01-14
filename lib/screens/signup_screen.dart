import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_clone/assets/colors.dart';
import 'package:instagram_clone/assets/constants.dart';
import 'package:instagram_clone/resources/auth_methods.dart';
import 'package:instagram_clone/resources/utils.dart';
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
  Uint8List? userImage;

  @override
  void dispose() {
    _emailController.dispose();
    _pwdController.dispose();
    _userNameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    setState(() {
      userImage = img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              userImage != null
                  ? CircleAvatar(
                      radius: 64, backgroundImage: MemoryImage(userImage!))
                  : const CircleAvatar(
                      radius: 64,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/premium-vector/account-icon-user-icon-vector-graphics_292645-552.jpg?w=740')),
              Positioned(
                  bottom: -5,
                  left: 80,
                  child: IconButton(
                    onPressed: () => selectImage(),
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
                  file: userImage!);
              print(res);

              if (res != 'success') {
                // ignore: use_build_context_synchronously
                showSnackBar(res, context);
              } else {
                // ignore: use_build_context_synchronously
                showSnackBar('You Have Successfully Registerd.', context);
              }
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
