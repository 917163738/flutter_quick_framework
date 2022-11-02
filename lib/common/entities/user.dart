// 注册请求
class UserRegisterRequestEntity {
  String email;
  String password;

  UserRegisterRequestEntity({
    required this.email,
    required this.password,
  });

  factory UserRegisterRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserRegisterRequestEntity(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

// 登录请求
class UserLoginRequestEntity {
  String email;
  String password;

  UserLoginRequestEntity({
    required this.email,
    required this.password,
  });

  factory UserLoginRequestEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginRequestEntity(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}

// 登录返回
class UserLoginResponseEntity {
  String? accessToken;
  String? displayName;
  List<String>? channels;

  UserLoginResponseEntity({
    this.accessToken,
    this.displayName,
    this.channels,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      UserLoginResponseEntity(
        accessToken: json["access_token"],
        displayName: json["display_name"],
        channels: List<String>.from(json["channels"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "display_name": displayName,
        "channels":
            channels == null ? [] : List<dynamic>.from(channels!.map((x) => x)),
      };
}

class VerifyCodeEntity {
  VerifyCodeEntity({
    String code = '',
    String pic = '',
  }) {
    _code = code;
    _pic = pic;
  }

  VerifyCodeEntity.fromJson(dynamic json) {
    _code = json['code'];
    // _pic =
    // "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEYAAAAjCAIAAACmdes6AAACP0lEQVR4Xu2W0U3EQAxETxSA+OMnFdAL30AV1EUproB2SGJwhpldZ7MJEBDSfCT22Ot3vj3dxV5f/pguGvrt+kf6Mg2P9xrs01mQbKY6BOxESK79YKdDcu0BOwype4JEfT1PjWRd6zo7kmsTWCvSzfXzKAo+PdyFxiPxVW2X26ui0KlZ9DSC7UJyIZJmyaaDqnLPKlgTkvPUkGweN7akWTd4Kpk1lHgCJqFaR3KSHMnmM3Ikf0jGDSUeJKmt63gkpcJgMm4o8SiDgq0gBcYmJKSi12TcRo9SeTDiGVIweEGO5DZC0qWNg+rnSgokdPqzCgv9tYpEaxmfa41CHsddEY9VxtU+dBZFsFBTGRK9YqTW3T4jUU+TLxV1QE/xiCjRqqVcQyY8HtGgS89uQUJ5bTGoo+txfISGiqMnSCE8bKj8psfEtfLw1Ob+biSDFRXPTpCiyTBvTGvJU0yZIsXcVNaIhJvBS4V4OZLBr2Jt7iQ1leOLz03C7hHURvaBhBG9VKvjuie31eLv5fiiPAme9kqQIk5fvGIrvUtkS2aYyjVUlC4H8RymeAZRrd6l8OjcRFg8bip3hyZIioSi26LZQ5BctfhSHj7NoRKkGDeaIN7w+b/ffiTsr6mpPEyaQ21CIiFeICVUhERtMYjZeFjuUm0glyLhZ+/SDrofxUM/AqMNq9zpDxhf/NgxCvq0tZxGqWW10LMa9PhPIpEIrw/J9Ec8sbZoZ3mI8FS1uJ0Wyda25AYNmiIl1hbtqSV1I70B+dAU/4dAw64AAAAASUVORK5C"
    //     .split(',')[1];
    _pic = json['pic'].split(',')[1].toString().replaceAll("\r\n", "");
  }

  String? _code;
  String? _pic;

  String? get code => _code;

  String? get pic => _pic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['pic'] = _pic;
    return map;
  }
}

class UserInfo {
  UserInfo({
    int? userid,
    String? code,
    String? name,
    int? orgnid,
    String? orgname,
    String? orgncode,
    String? parentid,
    String? fullcode,
    int? level,
    String? province,
    String? provinceName,
    int? canSeeSub,
    int? isMgr,
    String? depid,
    dynamic depname,
    int? selforgnid,
    String? selforgname,
    String? selforgncode,
    String? selfparentid,
    String? selffullcode,
    int? selflevel,
    int? custmgr,
    int? jobseries,
    int? isFresh,
    String? emplno,
    String? cooporgn,
    int? domain,
    int? misid,
    String? mobile,
    List<String>? roles,
    List<String>? systems,
    String? authorization,
  }) {
    _userid = userid;
    _code = code;
    _name = name;
    _orgnid = orgnid;
    _orgname = orgname;
    _orgncode = orgncode;
    _parentid = parentid;
    _fullcode = fullcode;
    _level = level;
    _province = province;
    _provinceName = provinceName;
    _canSeeSub = canSeeSub;
    _isMgr = isMgr;
    _depid = depid;
    _depname = depname;
    _selforgnid = selforgnid;
    _selforgname = selforgname;
    _selforgncode = selforgncode;
    _selfparentid = selfparentid;
    _selffullcode = selffullcode;
    _selflevel = selflevel;
    _custmgr = custmgr;
    _jobseries = jobseries;
    _isFresh = isFresh;
    _callcenterId = callcenterId;
    _emplno = emplno;
    _cooporgn = cooporgn;
    _domain = domain;
    _misid = misid;
    _mobile = mobile;
    _roles = roles;
    _systems = systems;
    _authorization = authorization;
  }

  UserInfo.fromJson(dynamic json) {
    _userid = json['userid'];
    _code = json['code'];
    _name = json['name'];
    _orgnid = json['orgnid'];
    _orgname = json['orgname'];
    _orgncode = json['orgncode'];
    _parentid = json['parentid'];
    _fullcode = json['fullcode'];
    _level = json['level'];
    _province = json['province'];
    _provinceName = json['province_name'];
    _canSeeSub = json['can_see_sub'];
    _isMgr = json['is_mgr'];
    _depid = json['depid'];
    _depname = json['depname'];
    _selforgnid = json['selforgnid'];
    _selforgname = json['selforgname'];
    _selforgncode = json['selforgncode'];
    _selfparentid = json['selfparentid'];
    _selffullcode = json['selffullcode'];
    _selflevel = json['selflevel'];
    _custmgr = json['custmgr'];
    _jobseries = json['jobseries'];
    _isFresh = json['is_fresh'];
    _emplno = json['emplno'];
    _cooporgn = json['cooporgn'];
    _domain = json['domain'];
    _misid = json['misid'];
    _mobile = json['mobile'];
    _roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    _systems = json['systems'] != null ? json['systems'].cast<String>() : [];
    _authorization = json['Authorization'];
  }


  int? _userid;
  String? _code;
  String? _name;
  int? _orgnid;
  String? _orgname;
  String? _orgncode;
  String? _parentid;
  String? _fullcode;
  int? _level;
  String? _province;
  String? _provinceName;
  int? _canSeeSub;
  int? _isMgr;
  String? _depid;
  String? _depname;
  int? _selforgnid;
  String? _selforgname;
  String? _selforgncode;
  String? _selfparentid;
  String? _selffullcode;
  int? _selflevel;
  int? _custmgr;
  int? _jobseries;
  int? _isFresh;
  String? _callcenterId;
  String? _emplno;
  String? _cooporgn;
  int? _domain;
  int? _misid;
  String? _mobile;
  List<String>? _roles;
  List<String>? _systems;
  String? _authorization;

  int? get userid => _userid;

  String? get code => _code;

  String? get name => _name;

  int? get orgnid => _orgnid;

  String? get orgname => _orgname;

  String? get orgncode => _orgncode;

  String? get parentid => _parentid;

  String? get fullcode => _fullcode;

  int? get level => _level;

  String? get province => _province;

  String? get provinceName => _provinceName;

  int? get canSeeSub => _canSeeSub;

  int? get isMgr => _isMgr;

  dynamic get depid => _depid;

  dynamic get depname => _depname;

  int? get selforgnid => _selforgnid;

  String? get selforgname => _selforgname;

  String? get selforgncode => _selforgncode;

  String? get selfparentid => _selfparentid;

  String? get selffullcode => _selffullcode;

  int? get selflevel => _selflevel;

  int? get custmgr => _custmgr;

  int? get jobseries => _jobseries;

  int? get isFresh => _isFresh;

  String? get callcenterId => _callcenterId;

  String? get emplno => _emplno;

  String? get cooporgn => _cooporgn;

  int? get domain => _domain;

  int? get misid => _misid;

  String? get mobile => _mobile;

  List<String>? get roles => _roles;

  List<String>? get systems => _systems;

  String? get authorization => _authorization;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userid'] = _userid;
    map['code'] = _code;
    map['name'] = _name;
    map['orgnid'] = _orgnid;
    map['orgname'] = _orgname;
    map['orgncode'] = _orgncode;
    map['parentid'] = _parentid;
    map['fullcode'] = _fullcode;
    map['level'] = _level;
    map['province'] = _province;
    map['province_name'] = _provinceName;
    map['can_see_sub'] = _canSeeSub;
    map['is_mgr'] = _isMgr;
    map['depid'] = _depid;
    map['depname'] = _depname;
    map['selforgnid'] = _selforgnid;
    map['selforgname'] = _selforgname;
    map['selforgncode'] = _selforgncode;
    map['selfparentid'] = _selfparentid;
    map['selffullcode'] = _selffullcode;
    map['selflevel'] = _selflevel;
    map['custmgr'] = _custmgr;
    map['jobseries'] = _jobseries;
    map['is_fresh'] = _isFresh;
    map['callcenter_id'] = _callcenterId;
    map['emplno'] = _emplno;
    map['cooporgn'] = _cooporgn;
    map['domain'] = _domain;
    map['misid'] = _misid;
    map['mobile'] = _mobile;
    map['roles'] = _roles;
    map['systems'] = _systems;
    map['Authorization'] = _authorization;
    return map;
  }
}