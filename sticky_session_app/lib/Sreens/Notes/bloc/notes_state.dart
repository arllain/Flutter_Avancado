part of 'notes_bloc.dart';

abstract class NotesState extends Equatable {
  const NotesState();

  @override
  List<Object> get props => [];

}

class NotesLoadingState extends NotesState {
}

class NotesLoadedState extends NotesState {

  final Map<String, List<Sticky>> stickyByColumnMap;

  const NotesLoadedState(this.stickyByColumnMap);

  @override
  List<Object> get props => [stickyByColumnMap];

}
