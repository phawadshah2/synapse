import 'package:synapse/features/notes/domain/note.dart';
import 'package:synapse/features/notes/domain/note_repository.dart';

class MockNoteRepository implements NoteRepository {
  @override
  List<Note> getNotes() {
    final base = DateTime(2026, 7, 11, 9, 0);
    return List.generate(30, (i) {
      return Note(
        id: 'n$i',
        title: _titles[i % _titles.length],
        body:
            'Body of note #$i — a couple of lines of preview text so the tile '
            'has something to ellipsize when it overflows two lines.',
        updatedAt: base.subtract(Duration(hours: i * 5)),
      );
    });
  }

  static const _titles = [
    'Standup notes',
    'Riverpod migration ideas',
    'Reading list',
    'Bug: list janks on scroll',
    'Interview prep — internals',
    'Grocery run',
  ];
}
