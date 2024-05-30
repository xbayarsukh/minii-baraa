import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniibaraa/pages/selllers/profile_screen/profile_screen.dart';
import 'package:styled_widget/styled_widget.dart';

class UserAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? isUser;
  const UserAppBarWidget({Key? key, this.isUser})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  @override
  final Size preferredSize; // default is 56.0
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, _, __) => const ProfileScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.menu_outlined,
                size: 28,
              ),
            ).padding(horizontal: 5),
            const CircleAvatar(
              backgroundImage: AssetImage(
                "assets/img/avatar.png",
              ),
              backgroundColor: Colors.transparent,
            ).padding(right: 10),
            const Text(
              "Уянга Төр",
              style: TextStyle(fontSize: 16),
            ),
            const Spacer(),
            isUser != null
                ? InkWell(
                    onTap: () {},
                    child: const Icon(
                      CupertinoIcons.bag,
                      size: 28,
                    ),
                  ).padding(horizontal: 5)
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}
