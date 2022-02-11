import 'package:http/http.dart' as http;
import 'package:sticky_session_app/constants.dart';
import 'package:sticky_session_app/models/meeting.dart';
import 'package:sticky_session_app/models/session.dart';
import 'package:sticky_session_app/models/sticky.dart';

class API {

  static Future<List<Meeting>?> getMettings(String url) async{
    
    final response = await http.get(Uri.parse(baseUri + url));

    if(response.statusCode == 200) {
      return meetingFromJson(response.body);
    }else {
      throw Exception(response.statusCode);
    }
  }

  static Future<List<Session>?> getSessions(String url) async{

    final response = await http.get(Uri.parse(baseUri + url));

    if(response.statusCode == 200) {
      return sessionFromJson(response.body);
    }else {
      throw Exception(response.statusCode);
    }
  }

  static Future<List<Sticky>?> getNotes(String url) async{

    final response = await http.get(Uri.parse(baseUri + url));

    if(response.statusCode == 200) {
      return stickyFromJson(response.body);
    }else {
      throw Exception(response.statusCode);
    }
  }

}
