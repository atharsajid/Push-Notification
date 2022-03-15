import 'package:flutter/material.dart';
import 'package:notification/notification.dart';
import 'package:notification/second_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    LocalNotificationServices.initialize(context);
    listenNotification();
  }

  void listenNotification() => LocalNotificationServices.onNotifications.stream
      .listen(onClickedNotification);
  void onClickedNotification(String? payload) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondPage(
            payload: payload.toString(),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('image/1.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.3),
                BlendMode.darken,
              ))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("Notification"),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
            ),
            OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(220, 50),
                backgroundColor: Colors.white,
                side: BorderSide(color: Colors.transparent, width: 2),
              ),
              onPressed: () {
                LocalNotificationServices.display('Muhammad Athar',
                    'This is a Notification', 'Muhammad Athar');
              },
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
                size: 28,
              ),
              label: const Text(
                "Get Notification",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
