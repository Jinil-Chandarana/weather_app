class Request {
  String? type;
  String? query;
  String? language;
  String? unit;

  Request({this.type, this.query, this.language, this.unit});

  factory Request.fromJson(Map<String, dynamic> json) => Request(
        type: json['type']?.toString(),
        query: json['query']?.toString(),
        language: json['language']?.toString(),
        unit: json['unit']?.toString(),
      );

  Map<String, dynamic> toJson() => {
        if (type != null) 'type': type,
        if (query != null) 'query': query,
        if (language != null) 'language': language,
        if (unit != null) 'unit': unit,
      };
}
