import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sticky_session_app/models/meeting.dart';
import 'package:sticky_session_app/services/api.dart';

part 'sessions_event.dart';
part 'sessions_state.dart';

class SessionsBloc extends Bloc<SessionsEvent, SessionsState> {

  final API _api = API();

  SessionsBloc() : super(SessionsLoadingState()) {
    on<LoadMeetingsEvent>((event, emit) async {
      emit(SessionsLoadingState());
      final meetings = await _api.getMettings('/meeting');
      emit(SessionsLoadedState(meetings!));
    });
  }
}
