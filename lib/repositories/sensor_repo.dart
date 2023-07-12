import 'package:sakana_yoi/utils/sensor_model.dart';
import 'package:sakana_yoi/utils/server.dart';

class SensorRepo extends BaseService{
  Future<SensorModel> getSensor() async{
    final res = await request('https://sakanayoi-ikan-default-rtdb.asia-southeast1.firebasedatabase.app/.json');
    return SensorModel.fromJson(res.headers);
  }
}