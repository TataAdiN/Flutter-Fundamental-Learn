import 'package:flutter/material.dart';

class ModuleTile extends StatelessWidget {
  const ModuleTile({
    super.key,
    required this.moduleName,
    required this.isDone,
    required this.onClick,
  });

  final String moduleName;
  final bool isDone;

  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(moduleName),
      trailing: isDone
          ? const Icon(Icons.done)
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrangeAccent,
              ),
              onPressed: onClick,
              child: const Text('Done'),
            ),
    );
  }
}
