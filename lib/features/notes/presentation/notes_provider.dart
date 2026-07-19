import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:synapse/features/notes/data/mock_note_repository.dart';
import 'package:synapse/features/notes/domain/note.dart';
import 'package:synapse/features/notes/domain/note_repository.dart';

final noteRepositoryProvider = Provider<NoteRepository>((ref) {
  return MockNoteRepository();
});

final notesProvider = Provider<List<Note>>((ref) {
  final repo = ref.watch(noteRepositoryProvider);
  return [...repo.getNotes()]
    ..sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
});
