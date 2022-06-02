class Division {
    String? division_name;
    int? id;
    int? publish;
    String? url_dis_title;

    Division({this.division_name, this.id, this.publish, this.url_dis_title});

    factory Division.fromJson(Map<String, dynamic> json) {
        return Division(
            division_name: json['division_name'], 
            id: json['id'], 
            publish: json['publish'], 
            url_dis_title: json['url_dis_title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['division_name'] = this.division_name;
        data['id'] = this.id;
        data['publish'] = this.publish;
        data['url_dis_title'] = this.url_dis_title;
        return data;
    }
}