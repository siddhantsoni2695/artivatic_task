//Generate json to class from  https://javiercbk.github.io/json_to_dart/

class DashboardDataResponse {
  String? title;
  List<Rows>? rows;

  DashboardDataResponse({this.title, this.rows});

  DashboardDataResponse.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['rows'] != null) {
      rows = <Rows>[];
      json['rows'].forEach((v) {
        rows!.add(Rows.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    if (rows != null) {
      data['rows'] = rows!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Rows {
  String? title;
  String? description;
  String? imageHref;

  Rows({this.title, this.description, this.imageHref});

  Rows.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    imageHref = json['imageHref'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['imageHref'] = imageHref;
    return data;
  }
}
