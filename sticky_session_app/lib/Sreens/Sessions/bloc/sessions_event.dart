part of 'sessions_bloc.dart';


abstract class SessionsEvent extends Equatable {
  const SessionsEvent();

  @override
  List<Object?> get props => [];

}

class LoadMeetingsEvent extends SessionsEvent {
  final List<Meeting> meetings;

  const LoadMeetingsEvent({this.meetings = const <Meeting>[]});

  List<Object?> get props => [meetings];
}

