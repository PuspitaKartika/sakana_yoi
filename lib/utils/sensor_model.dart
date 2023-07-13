class SensorModel{
  SensorModel({
    this.sensorTinggi,
    this.sensorSuhu,
    this.sensorFlow,
    this.makan,
    this.sensorFlowTotal
});
  bool? makan = false;
  int? sensorFlow = 0;
  double? sensorFlowTotal = 0;
  double? sensorSuhu = 0.0 ;
  String? sensorTinggi = '';

  factory SensorModel.fromJson(Map<String, dynamic> json){
    return SensorModel(
      makan: json["makan"],
      sensorFlow: json["sensorFlow"],
      sensorFlowTotal: json["sensorFlowTotal"],
      sensorSuhu: json["sensorSuhu"],
      sensorTinggi: json["sensorTinggi"]
    );
  }

}
