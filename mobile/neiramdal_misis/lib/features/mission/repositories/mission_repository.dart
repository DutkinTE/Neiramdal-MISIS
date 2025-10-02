import 'package:dio/dio.dart';
import 'package:neiramdal_misis/core/network/dio_service.dart';
import 'package:neiramdal_misis/features/mission/models/mission.dart';

class MissionRepository {
  Future<List<MissionModel>> getMission({required String rank}) async {
    final Dio dio = DioService().client;
    try {
      final response = await dio.get(
        '/missions/rank/$rank',
        options: Options(headers: {'Content-Type': 'application/json'}),
      );
      List<dynamic> getList = response.data;
      List<MissionModel> missionList = getList
          .map(
            (e) => MissionModel(
              id: e['id'],
              title: e['title'],
              description: e['description'],
              stage: e['stage'],
              branch: e['branch'],
              rank: e['rank'],
              experience: e['experience'],
              fragments: e['fragments'],
              status: e['status'],
            ),
          )
          .toList();

      return missionList;
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Ошибка аутентификации: ${e.response?.data}');
      } else {
        throw Exception('Ошибка сети: ${e.message}');
      }
    } catch (e) {
      throw Exception('Неизвестная ошибка: $e');
    }
  }
}
