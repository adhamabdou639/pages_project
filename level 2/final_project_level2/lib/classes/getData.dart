import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class AllCountries {
  final String flag;
  final String countryName;
  final String link;

  AllCountries({
    required this.countryName,
    required this.flag,
    required this.link,
  });

  late bool isDayTime;
  late String timeNow;
  late String timeZone;

  /// دالة تجيب الوقت من API
  Future<bool> getData() async {
    try {
      Response receivedDataFromAPI = await get(
        Uri.parse('https://worldtimeapi.org/api/timezone/$link'),
      );

      if (receivedDataFromAPI.statusCode == 200) {
        try {
          Map receivedData = jsonDecode(receivedDataFromAPI.body);

          DateTime datetime = DateTime.parse(receivedData["utc_datetime"]);

          // ✅ حساب الإزاحة بالساعات والدقايق
          final String rawOffset = receivedData["utc_offset"]; // مثال: +05:30
          final sign = rawOffset.startsWith('-') ? -1 : 1;
          final parts = rawOffset.substring(1).split(':'); // ["05", "30"]
          final hours = int.parse(parts[0]);
          final minutes = int.parse(parts[1]);
          final totalMinutes = sign * (hours * 60 + minutes);

          DateTime realTime = datetime.add(Duration(minutes: totalMinutes));
          print("Hour: ${realTime.hour}");

          // تحديد النهار/الليل
          isDayTime = realTime.hour > 5 && realTime.hour < 18;

          timeNow = DateFormat('hh:mm a').format(realTime);
          timeZone = receivedData["timezone"];

          return true; // ✅ البيانات اتجابت مظبوط
        } catch (e) {
          print("JSON Decode Error: $e");
          print("Response body: ${receivedDataFromAPI.body}");
          _setFallback();
          return false;
        }
      } else {
        print("Server Error: ${receivedDataFromAPI.statusCode}");
        print("Response: ${receivedDataFromAPI.body}");
        _setFallback();
        return false;
      }
    } catch (e) {
      print("Request failed: $e");
      _setFallback();
      return false;
    }
  }

  /// fallback لو السيرفر وقع أو الرد مش JSON
  void _setFallback() {
    DateTime now = DateTime.now().toUtc();
    isDayTime = now.hour > 5 && now.hour < 18;
    timeNow = DateFormat('hh:mm a').format(now);
    timeZone = "UTC";
    print("⚠️ Using fallback time: $timeNow ($timeZone)");
  }
}
