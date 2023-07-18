import 'package:sakana_yoi/utils/constants.dart';
import 'package:sakana_yoi/utils/sensor_model.dart';
import 'package:sakana_yoi/utils/server.dart';

class SensorRepo extends BaseService{
  Future<String> getSensor() async{
    final res = await request(BaseString.BASE_URL);
    return res.body;
  }

  Future<String> updateMakan({
    bool? makan = true ,
  }) async {
    final res = await request(BaseString.BASE_URL, requestType: RequestType.UPDATE, data: {
      'makan': makan,
    });
    return res.body;
  }

}


