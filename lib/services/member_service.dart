import '../networking/constant.dart';
import '../support/dio_helper.dart';

class MemberService {
  static Future Addmember(Map<String, dynamic> reqData) async {
    var dio = await DioHelper.getInstance();
    var response = await dio.post('$baseURL/api/user/add-user', data: reqData);
    return response.data;
  }

  static Future GetPackageTypes() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/user/add-user');
    return response.data;
  }

  static Future Memberview() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.post(
        '$baseURL/api/user/view-level1-user?page=1&pageSize=10&searchText=');
    print(response);
    return response.data;
  }

  static Future Memberstate() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/admin/view-states');
    print(response);
    return response.data;
  }

  static Future Memberdistrict(id) async {
    var dio = await DioHelper.getInstance();
    var response =
        await dio.get('$baseURL/api/admin/view-dropdown-districts/$id');
    print(response);
    return response.data;
  }

  static Future Memberzonal(districtId) async {
    var dio = await DioHelper.getInstance();
    var response =
        await dio.get('$baseURL/api/admin/view-dropdown-zonals/$districtId');
    print(response);
    return response.data;
  }

  static Future Memberpanchayath(zonalId) async {
    var dio = await DioHelper.getInstance();
    var response =
        await dio.get('$baseURL/api/admin/view-dropdown-panchayaths/$zonalId');
    print(response);
    return response.data;
  }

  static Future Membernotdistrict() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/admin/view-nottaken-districts');
    print(response);
    return response.data;
  }

  static Future Membernotzonal() async {
    var dio = await DioHelper.getInstance();
    var response = await dio.get('$baseURL/api/admin/view-nottaken-zonals');
    print(response);
    return response.data;
  }
}
