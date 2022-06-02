class Thana {
    int? district;
    int? division;
    int? id;
    int? publish;
    String? thana_name;
    String? url_dis_title;

    Thana({this.district, this.division, this.id, this.publish, this.thana_name, this.url_dis_title});

    factory Thana.fromJson(Map<String, dynamic> json) {
        return Thana(
            district: json['district'], 
            division: json['division'], 
            id: json['id'], 
            publish: json['publish'], 
            thana_name: json['thana_name'], 
            url_dis_title: json['url_dis_title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['district'] = this.district;
        data['division'] = this.division;
        data['id'] = this.id;
        data['publish'] = this.publish;
        data['thana_name'] = this.thana_name;
        data['url_dis_title'] = this.url_dis_title;
        return data;
    }
}