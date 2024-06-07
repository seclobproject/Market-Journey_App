import '../networking/constant.dart';
import '../support/dio_helper.dart';

class AwardService {
  static Future viewRewards() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/admin/view-award-details');
    print(response);
    return response.data;
  }
}


class LeaderService {
  static Future viewleaders() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/user/get-pool-amount');
    return response.data;
  }
}
