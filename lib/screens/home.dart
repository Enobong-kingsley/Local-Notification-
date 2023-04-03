import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:local_notification/screens/second_screen.dart';
import 'package:local_notification/services/local_notification_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final LocalNotificationService service;

  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    listenToNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notification Demo'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SizedBox(
                height: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      'This is a demo project for local notifications',
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    ElevatedButton(
                      onPressed: (() async {
                        await service.showNotification(
                            id: 0,
                            title: 'Notification Title',
                            body: 'Some body text');
                      }),
                      child: const Text(
                        'Show Local Notification',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (() async {
                        await service.showScheduledNotification(
                            id: 0,
                            title: 'Notification Title',
                            body: 'Some body text',
                            seconds: 5);
                      }),
                      child: const Text(
                        'Show Scheduled Notification',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: (()async {
                         await service.showNotificationWithPayload(
                            id: 0,
                            title: 'Notification Title',
                            body: 'Some body text',
                            payload: 'payload navigation  ');
                      }),
                      child: const Text(
                        'Show Notifications with payload',
                        style: TextStyle(fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  void listenToNotification() =>
      service.onNotificationClick.stream.listen(onNotificationListener);

  void onNotificationListener(String? payload) {
    if (payload != null && payload.isNotEmpty) {
      print('payload $payload');

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (contex) => SecondScreen(payload: payload)));
    }
  }
}
