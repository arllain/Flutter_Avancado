import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sticky_session_app/database/database_service.dart';
import 'package:sticky_session_app/models/meeting.dart';
import 'package:sticky_session_app/services/api.dart';

part 'sessions_event.dart';
part 'sessions_state.dart';

class SessionsBloc extends Bloc<SessionsEvent, SessionsState> {

  SessionsBloc() : super(SessionsLoadingState()) {
    on<LoadMeetingsEvent>((event, emit) async {
      emit(SessionsLoadingState());

      List<Meeting>? meetings = [];

      final hasInternet = await InternetConnectionChecker().hasConnection;
      if(hasInternet) {
        meetings = await API.getMettings('/meeting');
        for (var meeting in meetings!) {
          DatabaseService().insert('meetings', meeting.toJson());
        }
      }else {
        meetings = (await DatabaseService().list('meetings'))?.map((e) => Meeting.fromJson(e)).toList() ?? [];
      }

      emit(SessionsLoadedState(meetings));
    });
  }
}
