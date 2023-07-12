import 'package:sakana_yoi/utils/sensor_model.dart';
import 'package:sakana_yoi/utils/server.dart';

class SensorRepo extends BaseService{
  Future<String> getSensor() async{
    final res = await request('https://sakanayoi-ikan-default-rtdb.asia-southeast1.firebasedatabase.app/.json');
    return res.body;
  }
}