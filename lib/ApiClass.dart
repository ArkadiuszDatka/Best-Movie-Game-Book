class Api {
  final String Title;

  Api({this.Title});

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
        Title: json['Title']
    );
  }
}

