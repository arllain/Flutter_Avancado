part of 'retrospective_bloc.dart';

abstract class RetrospectiveState extends Equatable {
  const RetrospectiveState();

  @override
  List<Object> get props => [];

}

class RetrospectiveLoadingState extends RetrospectiveState {
}

class RetrospectiveLoadedState extends RetrospectiveState {
  final List<Session> sessions;

  const RetrospectiveLoadedState(this.sessions);

  @override
  List<Object> get props => [sessions];

}
