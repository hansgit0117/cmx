abstract class Model {
  String id;

  bool get hasData => id != null;

  void fromJson(Map<String, dynamic> json) {
    try {
      id = json['id'];
    } catch (e) {
      print(e);
    }
  }

  @override
  bool operator ==(dynamic other) {
    return other.id == this.id;
  }

  @override
  int get hashCode => this.id.hashCode;

  Map<String, dynamic> toJson();

  @override
  String toString() {
    return toJson().toString();
  }
}
