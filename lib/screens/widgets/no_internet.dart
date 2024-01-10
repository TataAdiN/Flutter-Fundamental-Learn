import 'package:flutter/material.dart';

import '../../component_widgets/rounded_button.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key, required this.onRetry});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.sentiment_dissatisfied,
              size: 64,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'No internet detected',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              'Please ensure your network has internet access',
            ),
            const SizedBox(
              height: 24,
            ),
            RoundedButton(
              onTap: () => onRetry(),
              content: const Text('Try Again'),
            ),
          ],
        ),
    );
  }
}
