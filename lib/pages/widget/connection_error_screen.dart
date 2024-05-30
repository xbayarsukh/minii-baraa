import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:miniibaraa/core/view_models/connectivity_view_model.dart';
import 'package:provider/provider.dart';

class ConnectivityErrorScreen extends StatelessWidget {
  const ConnectivityErrorScreen({super.key});

  Future<void> checkConnectivity(BuildContext context) async {
    final connectivityProvider =
        Provider.of<ConnectivityProvider>(context, listen: false);
    final connectivityResult = connectivityProvider.connectivityResult;

    if (connectivityResult == ConnectivityResult.none) {
    } else {
      Navigator.of(context).pushNamed('/permission');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Интернет холболт тасарчлаа.',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Call the function to check connectivity
                checkConnectivity(context);
              },
              child: const Text('Оролдох'),
            ),
          ],
        ),
      ),
    );
  }
}
