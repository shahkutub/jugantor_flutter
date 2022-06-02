class District {
    String? district_name;
    int? division;
    int? id;
    int? publish;
    String? url_dis_title;

    District({this.district_name, this.division, this.id, this.publish, this.url_dis_title});

    factory District.fromJson(Map<String, dynamic> json) {
        return District(
            district_name: json['district_name'], 
            division: json['division'], 
            id: json['id'], 
            publish: json['publish'], 
            url_dis_title: json['url_dis_title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['district_name'] = this.district_name;
        data['division'] = this.division;
        data['id'] = this.id;
        data['publish'] = this.publish;
        data['url_dis_title'] = this.url_dis_title;
        return data;
    }
}