import 'package:flutter/material.dart';
import 'package:flutter_store_app/controller/login_provider.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        actions: [
          IconButton(
            onPressed: () async {
              provider.logOutFunction(context);
            },
            icon: const Icon(Icons.login),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 255, 170, 59),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        children: [
          _buildListMainItem(text: 'available features'),
          _buildListItem(text: 'Admin', ro: '/admin', context: context),
          _buildListItem(text: 'Chart', ro: '/chart', context: context),
        ],
      ),
    );
  }
}

_buildListMainItem({required String text}) => Container(
      width: double.infinity,
      height: 80,
      margin: const EdgeInsets.only(top: 15),
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 170, 59),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

_buildListItem({
  required String text,
  required String ro,
  required BuildContext context,
}) =>
    GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(ro);
      },
      child: Container(
        width: double.infinity,
        height: 80,
        margin: const EdgeInsets.only(top: 10),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 230, 205, 174),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
