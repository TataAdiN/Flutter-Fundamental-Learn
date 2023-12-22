import 'package:flutter/material.dart';

class DoneModuleListProvider extends StatelessWidget {
  const DoneModuleListProvider({super.key, required this.doneModuleList});
  final List<String> doneModuleList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Done Module List'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(doneModuleList[index]),
          );
        },
        itemCount: doneModuleList.length,
      ),
    );
  }
}