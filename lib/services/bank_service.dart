import '../networking/constant.dart';
import '../support/dio_helper.dart';

class BankService{
   static Future Addbank(Map<String, dynamic> reqData) async {
    var dio = await DioHelper.getInstance();
    var response = await dio.post('$baseURL/api/user/add-bank-account', data: reqData);
    return response.data;
  }

static Future Nominee(Map<String, dynamic> reqData) async {
    var dio = await DioHelper.getInstance();
    var response = await dio.post('$baseURL/api/user/add-nominee', data: reqData);
    return response.data;
  }
}