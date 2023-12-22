import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'providers/background_service.dart';

class ProviderScreen extends StatelessWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> doneModuleList = [];
    return ChangeNotifierProvider(
      create: (context) => DoneModuleProvider(),
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Provider'),
          actions: [
            IconButton(
              icon: const Icon(Icons.done),
              onPressed: () => Navigator.pushNamed(
                context,
                '/provider.done',
                arguments: doneModuleList,
              ),
            ),
          ],
        ),
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
          ),
          child: Container(),
        ),
      )
    );
  }
}
