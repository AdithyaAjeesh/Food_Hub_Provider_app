import 'package:flutter/material.dart';

PreferredSize prefAppBar(BuildContext context) {
  return const PreferredSize(
    preferredSize: Size.fromHeight(80),
    child: DefaultTabController(
      length: 10,
      child: AppBarWidget(),
    ),
  );
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color.fromARGB(255, 255, 170, 59),
      title: Container(
        margin: const EdgeInsets.only(top: 20),
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
    );
  }
}
