import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl =
      'http://10.0.2.2/assignment1/api/apis/'; //CHANGED THE BASEURL TO LOCALHOST

  static Future<http.StreamedResponse> signIn(
    String username,
    String password,
  ) async {
    try {
      // log("Indide Signin${username}, ${password}");

      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              '${baseUrl}auth/login.php')); //ADDED THE .PHP EXTENSION TO THE ROUTE
      request.fields.addAll({
        'username': username,
        'password': password,
      });

      http.StreamedResponse response = await request.send();
      return response;
    } catch (e) {
      // Handle exceptions here
      log(e.toString());
      throw Exception('Failed to sign in: $e');
    }
  }

  static Future<http.StreamedResponse> studentRegister(
    String username,
    String password,
    String name,
    String mobileNumber,
    String cOLLEGE,
    String dEGREE,
    String cORESKILLS,
    String hOBBIES,
    String achievements,
  ) async {
    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              '${baseUrl}register/student.php')); //ADDED THE .PHP EXTENSION TO THE ROUTE
      request.fields.addAll({
        "username": username,
        "password": password,
        "mobile": mobileNumber,
        "name": name,
        "college": cOLLEGE,
        "degree": dEGREE,
        "core_skills": cORESKILLS,
        "hobbies": hOBBIES,
        "achievements": achievements,
        "year": "",
        "interests": "",
        "language": "",
        "profile_pic": "",
      });

      http.StreamedResponse response = await request.send();
      return response;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to Register in: $e');
    }
  }

  static Future<http.StreamedResponse> teacherRegister(
    String username,
    String password,
    String mobile,
    String name,
    String cOLLEGE,
    String department,
    String achievements,
    String qualification,
    String experience,
  ) async {
    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              '${baseUrl}register/teacher.php')); //ADDED THE .PHP EXTENSION TO THE ROUTE
      request.fields.addAll({
        "username": username,
        "password": password,
        "mobile": mobile,
        "name": name,
        'college': cOLLEGE,
        'department': department,
        'field': "",
        'qualifications': qualification,
        'post': "",
        'achievements': achievements,
        'experience': experience,
        'profile_pic': ""
      });
      http.StreamedResponse response = await request.send();
      return response;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to Register in: $e');
    }
  }

  static Future<http.StreamedResponse> profileRegister(
    String college,
  ) async {
    print("hello123");
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the value of the 'uid' preference
    int? uid = prefs.getInt('uid') ?? 0;
    print(uid);
    print(college);

    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              '${baseUrl}register/profile.php')); //ADDED THE .PHP EXTENSION TO THE ROUTE
      request.fields.addAll({'college': college, 'uid': uid.toString()});
      http.StreamedResponse response = await request.send();
      return response;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to Register in: $e');
    }
  }

  static Future<http.StreamedResponse> organizationRegister(
    String username,
    String password,
    String mobile,
    String cOLLEGE,
    String city,
    String orgEmail,
    String profilepic,
  ) async {
    try {
      var request = http.MultipartRequest(
          'POST',
          Uri.parse(
              '${baseUrl}register/organization.php')); //ADDED THE .PHP EXTENSION TO THE ROUTE
      request.fields.addAll({
        "username": username,
        "password": password,
        "mobile": mobile,
        'college': cOLLEGE,
        'city': city,
        'org_email': orgEmail,
        'profile_pic': profilepic
      });

      http.StreamedResponse response = await request.send();
      return response;
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to Register in: $e');
    }
  }

  static Future<http.StreamedResponse> getRecommendedUser(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Retrieve the value of the 'uid' preference
    int? uid = prefs.getInt('uid') ?? 0;
    String userid = uid.toString();

    try {
      var headers = {'Accept': 'application/ecmascript'};
      var request = http.MultipartRequest(
          'GET', Uri.parse('${baseUrl}user/recommendation.php?userId=$userid'));
      // request.fields.addAll({'userId': '1'});

      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      return response;
    } catch (e) {
      // Handle exceptions here
      log(e.toString());
      throw Exception('Failed to Get Recommended user $e');
    }
  }

  static Future<http.StreamedResponse> sendFllowRequest(
      int userId, int followerId) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('${baseUrl}user/follow.php'));
      request.fields.addAll({
        'followerId': userId.toString(),
        'followingId': followerId.toString(),
      });

      http.StreamedResponse response = await request.send();
      return response;
    } catch (e) {
      // Handle exceptions here
      log(e.toString());
      throw Exception('Failed to sign in: $e');
    }
  }


}
