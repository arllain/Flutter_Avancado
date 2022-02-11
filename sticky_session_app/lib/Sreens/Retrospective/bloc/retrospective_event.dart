part of 'retrospective_bloc.dart';

abstract class RetrospectiveEvent extends Equatable {
  const RetrospectiveEvent();

  @override
  List<Object?> get props => [];

}

class LoadSessionsEvent extends RetrospectiveEvent {
  final List<Session> sessions;

  const LoadSessionsEvent({this.sessions = const <Session>[]});

  List<Object?> get props => [sessions];
}
