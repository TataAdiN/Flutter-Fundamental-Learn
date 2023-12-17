import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DoneModuleList extends StatelessWidget {
  const DoneModuleList({super.key, required this.doneModuleList});
  final List<String> doneModuleList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Done Module List'),
      ),
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(doneModuleList[index]),
            );
          },
          itemCount: doneModuleList.length,
        ),
      ),
    );
  }
}
