class AccountResultModel {
  bool success;
  String error;
  AccountInfo user;
  TokenModel tokenModel;

  AccountResultModel({this.success, this.error, this.user, this.tokenModel});

  AccountResultModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    user = json['User'] != null ? new AccountInfo.fromJson(json['User']) : null;
    tokenModel = json['TokenModel'] != null
        ? new TokenModel.fromJson(json['TokenModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['error'] = this.error;
    if (this.user != null) {
      data['User'] = this.user.toJson();
    }
    if (this.tokenModel != null) {
      data['TokenModel'] = this.tokenModel.toJson();
    }
    return data;
  }
}

class AccountInfo {
  String accountId;
  String accountName;
  String employeeDepartmentId;
  String employeeId;
  String employeeName;
  String employeeCode;
  bool isSupper;
  String authorization;

  AccountInfo({
    this.accountId,
    this.accountName,
    this.employeeDepartmentId,
    this.employeeId,
    this.employeeName,
    this.employeeCode,
    this.isSupper,
    this.authorization,
  });

  AccountInfo.fromJson(Map<String, dynamic> json) {
    accountId = json['AccountId'];
    accountName = json['AccountName'];
    employeeDepartmentId = json['EmployeeDepartmentId'];
    employeeId = json['EmployeeId'];
    employeeName = json['EmployeeName'];
    employeeCode = json['EmployeeCode'];
    isSupper = json['IsSupper'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AccountId'] = this.accountId;
    data['AccountName'] = this.accountName;
    data['EmployeeDepartmentId'] = this.employeeDepartmentId;
    data['EmployeeId'] = this.employeeId;
    data['EmployeeName'] = this.employeeName;
    data['EmployeeCode'] = this.employeeCode;
    data['IsSupper'] = this.isSupper;
    return data;
  }
}

class TokenModel {
  String appKey;
  String timestamp;

  TokenModel({this.appKey, this.timestamp});

  TokenModel.fromJson(Map<String, dynamic> json) {
    appKey = json['AppKey'];
    timestamp = json['Timestamp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AppKey'] = this.appKey;
    data['Timestamp'] = this.timestamp;
    return data;
  }
}
