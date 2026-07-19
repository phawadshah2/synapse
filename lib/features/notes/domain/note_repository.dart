import 'package:synapse/features/notes/domain/note.dart';

abstract class NoteRepository {
  List<Note> getNotes();
}
