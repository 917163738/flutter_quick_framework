// {
// "data": ...,
// "errorCode": 0,
// "errorMsg": ""
// }

class BaseJson {
  BaseJson({
    String? code,
      String? message, 
      dynamic value,}){
    _code = code;
    _message = message;
    _value = value;
}

  BaseJson.fromJson(dynamic json) {
    _code = json['errorCode'].toString();
    _message = json['errorMsg'];
    _value = json['data'];
  }
  String? _code;
  String? _message;
  dynamic _value;
BaseJson copyWith({  String? code,
  String? message,
  dynamic value,
}) => BaseJson(  code: code ?? _code,
  message: message ?? _message,
  value: value ?? _value,
);
  String? get code => _code;
  String? get message => _message;
  dynamic get value => _value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['errorCode'] = _code;
    map['errorMsg'] = _message;
    map['data'] = _value;
    return map;
  }

  bool isSuccessful(){
    return code=='0';
  }
}