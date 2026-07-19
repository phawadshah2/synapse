import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapse/features/notes/presentation/notes_provider.dart';
import 'package:synapse/features/notes/presentation/widgets/note_tile.dart';

class NotesListScreen extends ConsumerWidget {
  const NotesListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(notesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Synapse · Notes')),
      body: notes.isEmpty
          ? const _EmptyState()
          : ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, i) {
                final note = notes[i];
                return NoteTile(
                  key: ValueKey(note.id), // see Experiment C for why
                  note: note,
                );
              },
            ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('No notes yet.'));
  }
}
