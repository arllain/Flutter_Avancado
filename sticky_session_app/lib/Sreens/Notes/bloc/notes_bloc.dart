import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sticky_session_app/database/database_service.dart';
import 'package:sticky_session_app/models/session.dart';
import 'package:sticky_session_app/models/session_column.dart';
import 'package:sticky_session_app/models/sticky.dart';
import 'package:sticky_session_app/services/api.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {

  final Session session;


  NotesBloc(this.session) : super(NotesLoadingState()) {
    on<NotesEvent>((event, emit) async {
      emit(NotesLoadingState());

      List<Sticky>? notes = [];

      final hasInternet = await InternetConnectionChecker().hasConnection;
      if(hasInternet) {
        notes = await API.getNotes('/sticky?meetingId=${session.meetingId}&sessionId=${session.id}');
        for (var sticky in notes!) {
          DatabaseService().insert('stickies', sticky.toJson());
        }
      }else {
        notes = (await DatabaseService().list('stickies'))?.map((e) => Sticky.fromJson(e)).toList() ?? [];
      }

      final Map<String, List<Sticky>> stickyByColumnMap = {};
      for (var sticky in notes) {
        if (stickyByColumnMap.containsKey(sticky.columnName)) {
          stickyByColumnMap[sticky.columnName]!.add(sticky);
        } else {
          stickyByColumnMap[sticky.columnName] = [sticky];
        }
      }
      emit(NotesLoadedState(this.session.columns,stickyByColumnMap));
    });
  }
}
