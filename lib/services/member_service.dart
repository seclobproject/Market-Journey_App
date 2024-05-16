import '../networking/constant.dart';
import '../support/dio_helper.dart';

class MemberService {
  static Future Addmember(data) async {
    var dio = await DioHelper.getInstance();
    var response = await dio.post('$baseURL/api/user/add-user', data: data);
    return response.data;
  }
  static Future GetPackageTypes() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/user/add-user');
    return response.data;
  }
}
