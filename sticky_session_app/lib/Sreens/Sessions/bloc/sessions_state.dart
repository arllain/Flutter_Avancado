part of 'sessions_bloc.dart';


abstract class SessionsState extends Equatable {
  const SessionsState();

  @override
  List<Object> get props => [];
}

class SessionsLoadingState extends SessionsState {
}

class SessionsLoadedState extends SessionsState {
  final List<Meeting> meetings;

  const SessionsLoadedState(this.meetings);

  @override
  List<Object> get props => [meetings];

}

