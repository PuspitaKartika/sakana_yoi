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
  double? sensorFlowTotal = 0.0;
  int? sensorSuhu = 0;
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
  // Future<void> fetchData() async {
  //   final url = Uri.parse('https://sakanayoi-ikan-default-rtdb.asia-southeast1.firebasedatabase.app/.json');
  //   final response = await http.get(url);
  //
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     setState(() {
  //       makan = data['makan'] ?? false;
  //       sensorFlow = data['sensorFlow'] ?? 0;
  //       sensorFlowTotal = data['sensorFlowTotal'] ?? 0.0;
  //       sensorSuhu = data['sensorSuhu'] ?? 0.0;
  //       sensorTinggi = data['sensorTinggi'] ?? '';
  //     });
  //   } else {
  //     print('Failed to fetch data from the server');
  //   }
  // }
}
