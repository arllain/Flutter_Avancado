import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sticky_session_app/models/session.dart';
import 'package:sticky_session_app/services/api.dart';

part 'retrospective_event.dart';
part 'retrospective_state.dart';

class RetrospectiveBloc extends Bloc<RetrospectiveEvent, RetrospectiveState> {

  final API _api = API();
  final String meetingId;

  RetrospectiveBloc(this.meetingId) : super(RetrospectiveLoadingState()) {
    on<RetrospectiveEvent>((event, emit) async {
      emit(RetrospectiveLoadingState());
      final sessions = await _api.getSessions('/session?meetingId=$meetingId');
      emit(RetrospectiveLoadedState(sessions!));
    });
  }
}
