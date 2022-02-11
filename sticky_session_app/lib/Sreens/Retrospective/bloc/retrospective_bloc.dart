import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sticky_session_app/models/session.dart';
import 'package:sticky_session_app/services/api.dart';

part 'retrospective_event.dart';
part 'retrospective_state.dart';

class RetrospectiveBloc extends Bloc<RetrospectiveEvent, RetrospectiveState> {

  final String meetingId;

  RetrospectiveBloc(this.meetingId) : super(RetrospectiveLoadingState()) {
    on<RetrospectiveEvent>((event, emit) async {
      emit(RetrospectiveLoadingState());
      final hasInternet = await InternetConnectionChecker().hasConnection;
      if(hasInternet) {
        final sessions = await API.getSessions('/session?meetingId=$meetingId');
        emit(RetrospectiveLoadedState(sessions!));
      }else {
        emit(SessionsNoInternetState());
      }
    });
  }
}
