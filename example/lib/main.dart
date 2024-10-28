import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ots/ots.dart';
import 'package:ots/widgets/notification.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const OTS(
      showNetworkUpdates: true,
      persistNoInternetNotification: false,
      bottomInternetNotificationPadding: 16.0,
      /// pass your custom loader here
//      loader: CircularProgressIndicator(
//        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
//      ),
//      child: MaterialApp(
//      title: 'OTS Test',
//        home: Home(),
//      ),
      child: CupertinoApp(
        title: 'OTS Test',
        home: Home(),
      ),
    );
  }
}

const textStyle = TextStyle(color: Colors.white);
const headerStyle = TextStyle(color: Colors.black, fontSize: 18.0);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  NotificationWidgetState? instance;

  Widget notifications(){
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 8.0,
      spacing: 8.0,
      children: [
        const Row(
          children: [
            Expanded(child: Text("Notifications demo", style: headerStyle,)),
          ],
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.green)
          ),
          onPressed: () {
            showNotification(
              message: 'Hello, this is success notification',
              title: 'Success',
              backgroundColor: Colors.green,
              autoDismissible: true,
              notificationDuration: 2500,
            );
          },
          child: const Text('Success', style: textStyle),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.red)
          ),
          onPressed: () {
            showNotification(
              message: 'Hello, this is error notification',
              title: 'Error',
              backgroundColor: Colors.red,
              autoDismissible: true,
              notificationDuration: 2500,
            );
          },
          child: const Text('Error', style: textStyle),
        ),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(Colors.orange)
          ),
          onPressed: () {
            showNotification(
              message: 'Hello, this is warning notification',
              title: 'Warning',
              backgroundColor: Colors.orange,
              autoDismissible: true,
              notificationDuration: 2500,
            );
          },
          child: const Text('Warning', style: textStyle),
        ),
        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blue)
          ),
          onPressed: () {
            showNotification(
              message: 'Hello, this is info notification',
              title: 'Info',
              backgroundColor: Colors.blue,
              autoDismissible: true,
              notificationDuration: 2500,
            );
          },
          child: const Text('Info', style: textStyle),
        ),
        ElevatedButton(
          child: const Text('Custom handler', style: textStyle),
          onPressed: () async {
            instance = await showNotification(
              message: 'Hello, this will persist until you call close function',
              title: 'Persisting',
              backgroundColor: Colors.blue,
              autoDismissible: false,
            );
            await Future.delayed(const Duration(seconds: 3));
            // print("Closing notification now");
            instance?.close();
          },
        ),
      ],
    );
  }

  Widget loader(){
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 8.0,
      spacing: 8.0,
      children: [
        const Row(
          children: [
            Expanded(child: Text("Loader", style: headerStyle,)),
          ],
        ),

        ElevatedButton(
          child: const Text('Show Loader', style: textStyle),
          onPressed: () async {
            showLoader(
              isModal: true,
            );

            await Future.delayed(const Duration(seconds: 3));
            hideLoader();
          },
        ),

        ElevatedButton(
          child: const Text('Show modal Loader', style: textStyle),
          onPressed: () async {
            showLoader(
                isModal: true,
                modalColor: Colors.green.withOpacity(0.4),
                modalDismissible: false
            );

            await Future.delayed(const Duration(seconds: 3));
            hideLoader();
          },
        ),

      ],
    );
  }

  Widget toast(){
    return Wrap(
      direction: Axis.horizontal,
      runSpacing: 8.0,
      spacing: 8.0,
      children: [
        const Row(
          children: [
            Expanded(child: Text("Toast", style: headerStyle)),
          ],
        ),

        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.blue)
          ),
          onPressed: () async {
            bakeToast("This is informational!", type: ToastType.info);
          },
          child: const Text('Info', style: textStyle),
        ),

        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.lightBlue)
          ),
          onPressed: () async {
            bakeToast("Downloading, please wait!", type: ToastType.normal);
          },
          child: const Text('Normal', style: textStyle),
        ),

        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.red)
          ),
          onPressed: () async {
            bakeToast("Password is incorrect!", type: ToastType.error);
          },
          child: const Text('Error', style: textStyle),
        ),

        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.orange)
          ),
          onPressed: () async {
            bakeToast("Password is weak!", type: ToastType.warning);
          },
          child: const Text('Warning', style: textStyle),
        ),

        ElevatedButton(
          style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(Colors.green)
          ),
          onPressed: () async {
            bakeToast("Registration successful!", type: ToastType.success);
          },
          child: const Text('Success', style: textStyle),
        ),

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 8.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              notifications(),
              const Divider(height: 32.0),
              loader(),
              const Divider(height: 32.0),
              toast(),
            ],
          ),
        ),
      ),
    );
  }
}
