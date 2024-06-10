import '../networking/constant.dart';
import '../support/dio_helper.dart';

class LevelIncomeService {
  static Future report1() async {
    var dio = await DioHelper.getInstance();
    var response = await dio
        .get('$baseURL/api/user/direct-referal-report?page=1&pageSize=10');
    return response.data;
  }

  static Future report2() async {
    var dio = await DioHelper.getInstance();
    var response = await dio
        .get('$baseURL/api/user/level-income-report?page=1&pageSize=15');
    return response.data;
  }

  static Future report3() async {
    var dio = await DioHelper.getInstance();
    var response = await dio
        .get('$baseURL/api/user/level-income-report?page=1&pageSize=15');
    return response.data;
  }

  static Future report4() async {
    var dio = await DioHelper.getInstance();
    var response = await dio
        .get('$baseURL/api/user/level-income-report?page=1&pageSize=15');
    return response.data;
  }

  static Future report5() async {
    var dio = await DioHelper.getInstance();
    var response = await dio
        .get('$baseURL/api/user/level-income-report?page=1&pageSize=15');
    return response.data;
  }
}
