import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/assets/colors.dart';
import 'package:instagram_clone/assets/global_vars.dart';
import 'package:instagram_clone/models/user.dart';
import 'package:instagram_clone/provider/provider.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({super.key});

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int page = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  void navigationTapped(int page) {
    pageController.jumpToPage(page);
  }

  void onPageChange(int pageNum) {
    setState(() {
      page = pageNum;
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChange,
        children: homeScreenItems,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        onTap: navigationTapped,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
            Icons.home,
            color: page == 0 ? primaryColor : secondaryColor,
          )),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  color: page == 1 ? primaryColor : secondaryColor)),
          BottomNavigationBarItem(
              icon: Icon(Icons.add,
                  color: page == 2 ? primaryColor : secondaryColor)),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite,
                  color: page == 3 ? primaryColor : secondaryColor)),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,
                  color: page == 4 ? primaryColor : secondaryColor)),
        ],
      ),
    );
  }
}
