class CurrencyPrice {
  Session? session;
  Status? status;

  CurrencyPrice({this.session, this.status});

  CurrencyPrice.fromJson(Map<String, dynamic> json) {
    session =
        json['session'] != null ? Session.fromJson(json['session']) : null;
    status =
        json['status'] != null ? Status.fromJson(json['status']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (session != null) {
      data['session'] = session!.toJson();
    }
    if (status != null) {
      data['status'] = status!.toJson();
    }
    return data;
  }
}

class Session {
  String? sessionMessage;
  int? sessionResult;

  Session({this.sessionMessage, this.sessionResult});

  Session.fromJson(Map<String, dynamic> json) {
    sessionMessage = json['SessionMessage'];
    sessionResult = json['SessionResult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SessionMessage'] = sessionMessage;
    data['SessionResult'] = sessionResult;
    return data;
  }
}

class Status {
  String? message;
  String? rATE;
  String? fCUR;
  String? tCUR;
  int? result;

  Status({this.message, this.rATE, this.fCUR, this.tCUR, this.result});

  Status.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    rATE = json['RATE'];
    fCUR = json['FCUR'];
    tCUR = json['TCUR'];
    result = json['Result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    data['RATE'] = rATE;
    data['FCUR'] = fCUR;
    data['TCUR'] = tCUR;
    data['Result'] = result;
    return data;
  }
}
