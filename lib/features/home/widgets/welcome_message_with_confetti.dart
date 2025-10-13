import 'package:dark_light/app/assets_links.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeConfettiDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onDismiss;

  const WelcomeConfettiDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.onDismiss,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent, // Make dialog background transparent
      elevation: 0, // Remove shadow
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Lottie Confetti Animation (overlapped)
          Positioned.fill(
            child: Lottie.asset(
              AssetsLinks.welcomeConfetti, // Path to your Lottie JSON file
              repeat: false, // Play once
              onLoaded: (composition) {
                // Optional: You can do something after the animation loads
              },
            ),
          ),
          // Your Welcome Dialog Content
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: onDismiss,
                  child: const Text('Great!'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
