import 'package:flutter/material.dart';

class ModuleTile extends StatelessWidget {
  const ModuleTile({super.key, required this.moduleName});

  final String moduleName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(moduleName),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepOrangeAccent
        ),
        onPressed: () {},
        child: const Text('Done'),
      ),
    );
  }
}
