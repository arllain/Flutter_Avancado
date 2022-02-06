import 'package:sticky_session_app/models/session.dart';
import 'package:sticky_session_app/models/sticky.dart';

class NotesModel {

  // Session? session;
  // List<Sticky> stickies = [];
  Map<String, List<Sticky>> stickyByColumnMap = {};

  NotesModel({this.stickyByColumnMap = const {}});
}