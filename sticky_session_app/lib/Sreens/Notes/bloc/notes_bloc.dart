import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sticky_session_app/models/session.dart';
import 'package:sticky_session_app/models/sticky.dart';
import 'package:sticky_session_app/services/api.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {

  final API _api = API();
  final Session session;


  NotesBloc(this.session) : super(NotesLoadingState()) {
    on<NotesEvent>((event, emit) async {
      emit(NotesLoadingState());

      final hasInternet = await InternetConnectionChecker().hasConnection;
      if(hasInternet) {
        final notes = await _api.getNotes('/sticky?meetingId=${session.meetingId}&sessionId=${session.id}');

        final Map<String, List<Sticky>> stickyByColumnMap = {};
        for (var sticky in notes!) {
          if (stickyByColumnMap.containsKey(sticky.columnName)) {
            stickyByColumnMap[sticky.columnName]!.add(sticky);
          } else {
            stickyByColumnMap[sticky.columnName] = [sticky];
          }
        }
        emit(NotesLoadedState(this.session.columns,stickyByColumnMap));
      }else {
        emit(SessionsNoInternetState());
      }
    });
  }
}
