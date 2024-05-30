import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  String title;
  Function? fnc;
  CustomAppBar({
    this.title = '',
    this.fnc,
    Key? key,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize; // default is 56.0
  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2,
                      color: const Color.fromARGB(255, 244, 246, 248))),
              margin: const EdgeInsets.only(left: 10),
              child: const Icon(
                Icons.arrow_back,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
          Text(widget.title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              )),
          const SizedBox(
            height: 40,
            width: 40,
          ),
        ],
      ),
      elevation: 0,
    );
  }
}
