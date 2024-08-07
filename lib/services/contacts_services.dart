import 'package:dars_93_uy_ishi/models/contact_model.dart';
import 'package:dio/dio.dart';

class ContactsServices {
  final dio = Dio();

  Future<List<ContactModel>> fetchContacts() async {
    List<ContactModel> contacts = [];

    try {
      final response = await dio.get(
          "https://dars66-5367a-default-rtdb.firebaseio.com/contacts.json");
      response.data.forEach((key, value) {
        for (var item in value) {
          contacts.add(ContactModel.fromJson(item));
        }
      });
      print(contacts);
      return contacts;
    } on DioException catch (error) {
      throw error.message.toString();
    } catch (error) {
      rethrow;
    }
  }
}
