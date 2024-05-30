import 'package:flutter/material.dart';
import 'package:miniibaraa/config/theme/app_theme.dart';
import 'package:miniibaraa/core/storage/get_storage.dart';
import 'package:miniibaraa/core/view_models/sellers/notification_screen/notification_screen_view_model.dart';
import 'package:miniibaraa/pages/widget/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:styled_widget/styled_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final int userType = AppDatabase().getUserType();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Мэдэгдэл",
      ),
      body:
          Consumer<NotificationScreenViewModel>(builder: (context, model, __) {
        return ListView.builder(
          itemCount: model.notificationLists.length,
          itemBuilder: (context, index) {
            final notification = model.notificationLists[index];
            return GestureDetector(
              onTap: () {
                model.readNotification(notification["id"]);
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: const Color.fromARGB(255, 246, 248, 249),
                      width: 2,
                    )),
                margin: const EdgeInsets.only(
                  top: 15,
                  right: 25,
                  left: 25,
                ),
                padding: const EdgeInsets.all(18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: notification["status"]
                            ? AppTheme.color(userType)
                            : Colors.grey,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.notifications,
                        color: notification["status"]
                            ? Colors.white
                            : Colors.black,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width:
                          MediaQuery.of(context).size.width - 40 - 36 - 30 - 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            notification["title"],
                            maxLines: 1,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ).padding(bottom: 10),
                          Text(
                            notification["description"],
                            maxLines: 2,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
