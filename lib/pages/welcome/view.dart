import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 80),
            alignment: Alignment.topCenter,
            child: const Text(
              'WELCOME\nWANANDROID',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 10,
            right: 10,
            child: InkWell(
              onTap: controller.handleNavSignIn,
              child: _clipButton(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _clipButton() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 50,
        height: 50,
        color: Colors.black.withOpacity(0.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '跳过',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            Obx(() => Text(
                  '${controller.state.currentTime}s',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                )),
          ],
        ),
      ),
    );
  }
}