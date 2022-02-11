import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sticky_session_app/models/meeting.dart';
import 'package:sticky_session_app/services/api.dart';

part 'sessions_event.dart';
part 'sessions_state.dart';

class SessionsBloc extends Bloc<SessionsEvent, SessionsState> {

  SessionsBloc() : super(SessionsLoadingState()) {
    on<LoadMeetingsEvent>((event, emit) async {
      emit(SessionsLoadingState());

      final hasInternet = await InternetConnectionChecker().hasConnection;
      if(hasInternet) {
        final meetings = await API.getMettings('/meeting');
        emit(SessionsLoadedState(meetings!));
      }else {
        emit(SessionsNoInternetState());
      }
    });
  }
}
