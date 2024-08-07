import 'package:dars_93_uy_ishi/models/message_model.dart';
import 'package:dio/dio.dart';

class MessageServices {
  final dio = Dio();

  Future<List<MessageModel>> fetchMessages() async {
    List<MessageModel> messages = [];
    try {
      final response = await dio.get(
          "https://dars66-5367a-default-rtdb.firebaseio.com/messages.json");
      response.data.forEach((key, value) {
        for (var item in value) {
          messages.add(MessageModel.fromJson(item));
        }
      });
      return messages;
    } on DioException catch (error) {
      throw error.message.toString();
    } catch (error) {
      rethrow;
    }
  }
}
