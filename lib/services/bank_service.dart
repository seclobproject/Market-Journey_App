import '../networking/constant.dart';
import '../support/dio_helper.dart';

class BankService{
   static Future Addbank(Map<String, dynamic> reqData) async {
    var dio = await DioHelper.getInstance();
    var response = await dio.post('$baseURL/api/user/add-bank-account', data: reqData);
    return response.data;
  }
   static Future Dematedetail() async {
     var dio = await DioHelper.getInstance();
     var response =
     await dio.get('$baseURL/api/user/view-demate-accounts?page=1&pageSize=10');
     return response.data;
   }

static Future Nominee(Map<String, dynamic> reqData) async {
    var dio = await DioHelper.getInstance();
    var response = await dio.post('$baseURL/api/user/add-nominee', data: reqData);
    return response.data;
  }

   static Future Demate(Map<String, dynamic> reqData) async {
     var dio = await DioHelper.getInstance();
     var response =
     await dio.post('$baseURL/api/user/add-demate-account', data: reqData);
     return response.data;
   }

}