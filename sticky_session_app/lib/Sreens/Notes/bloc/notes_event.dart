part of 'notes_bloc.dart';

abstract class NotesEvent extends Equatable {
  const NotesEvent();

  @override
  List<Object?> get props => [];
}


class LoadinNotesEvent extends NotesEvent {

  final Map<String, List<Sticky>> stickyByColumnMap;

  const LoadinNotesEvent({this.stickyByColumnMap = const <String, List<Sticky>> {}});

  @override
  List<Object?> get props => [stickyByColumnMap];

}
