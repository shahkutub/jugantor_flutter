class AppversionModel {
    String? android_current_version;
    String? ios_current_version;

    AppversionModel({this.android_current_version, this.ios_current_version});

    factory AppversionModel.fromJson(Map<String, dynamic> json) {
        return AppversionModel(
            android_current_version: json['android_current_version'], 
            ios_current_version: json['ios_current_version'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['android_current_version'] = this.android_current_version;
        data['ios_current_version'] = this.ios_current_version;
        return data;
    }
}