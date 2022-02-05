import 'package:http/http.dart' as http;
import 'package:sticky_session_app/constants.dart';
import 'package:sticky_session_app/models/meeting.dart';

class API {

  Future<List<Meeting>?> getMettings(String url) async{
    
    final response = await http.get(Uri.parse(baseUri + url));

    if(response.statusCode == 200) {
      return meetingFromJson(response.body);
    }else {
      throw Exception(response.statusCode);
    }
  }
}
