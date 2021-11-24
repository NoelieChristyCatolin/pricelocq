class Station {
  Station({
    required this.id,
    required this.code,
    required this.mobileNum,
    required this.area,
    required this.province,
    required this.city,
    required this.name,
    required this.businessName,
    required this.address,
    required this.lat,
    required this.lng,
    required this.type,
    required this.depotId,
    required this.dealerId,
    this.createdAt,
    this.updatedAt,
  });

  final int id;
  final String code;
  final String mobileNum;
  final String area;
  final String province;
  final String city;
  final String name;
  final String businessName;
  final String address;
  final String lat;
  final String lng;
  final String type;
  final int depotId;
  final int dealerId;
  final String? createdAt;
  final String? updatedAt;

  factory Station.fromJson(Map<String, dynamic> json) {
    return Station(
      id: json['id'],
      code: json['code'],
      mobileNum: json['mobileNum'],
      area: json['area'],
      province: json['province'],
      city: json['city'],
      name: json['name'],
      businessName: json['businessName'],
      address: json['address'],
      lat: json['lat'],
      lng: json['lng'],
      type: json['type'],
      depotId: json['depotId'],
      dealerId: json['dealerId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }
}