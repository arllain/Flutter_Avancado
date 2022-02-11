import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sticky_session_app/database/database_service.dart';
import 'package:sticky_session_app/models/session.dart';
import 'package:sticky_session_app/services/api.dart';

part 'retrospective_event.dart';
part 'retrospective_state.dart';

class RetrospectiveBloc extends Bloc<RetrospectiveEvent, RetrospectiveState> {

  final String meetingId;

  RetrospectiveBloc(this.meetingId) : super(RetrospectiveLoadingState()) {
    on<RetrospectiveEvent>((event, emit) async {
      emit(RetrospectiveLoadingState());

      List<Session>? sessions = [];

      final hasInternet = await InternetConnectionChecker().hasConnection;
      if(hasInternet) {
        sessions = await API.getSessions('/session?meetingId=$meetingId');
        for (var session in sessions!) {
          DatabaseService().insert('sessions', session.toJson());
        }
      }else {
        sessions = (await DatabaseService().list('sessions'))?.map((e) => Session.fromJson(e)).toList() ?? [];
      }

      emit(RetrospectiveLoadedState(sessions));
    });
  }
}
