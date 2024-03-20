import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/login_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    provider.checkLoggedIn(context);
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Food',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35),
              ),
              const SizedBox(width: 5),
              Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(color: Colors.black),
                child: const Text(
                  'HUB',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 170, 59),
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
