class Model {
  String? name;
  String? address;

  Model(
    this.name,
    this.address,
  );
  Model.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        address = json['address'];

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'name': name, 'address': address};
  }

  Model copyWith({
    String? name,
    String? address,
  }) =>
      Model(
        name ?? this.name,
        address ?? this.address,
      );
}
