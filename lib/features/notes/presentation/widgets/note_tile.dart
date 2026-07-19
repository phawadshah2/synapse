import 'package:flutter/material.dart';
import 'package:synapse/features/notes/domain/note.dart';

class NoteTile extends StatelessWidget {
  final Note note;
  const NoteTile({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    debugPrint('NoteTile.build  ${note.id}');
    return ListTile(
      title: Text(note.title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Text(note.body, maxLines: 2, overflow: TextOverflow.ellipsis),
      trailing: Text(
        '${note.updatedAt.hour.toString().padLeft(2, '0')}:'
        '${note.updatedAt.minute.toString().padLeft(2, '0')}',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      onTap: () {},
    );
  }
}
