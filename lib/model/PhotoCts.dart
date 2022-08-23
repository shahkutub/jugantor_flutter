class PhotoCts {
    int? body_dis;
    int? body_hierarchy;
    String? cat_name;
    int? footer_dis;
    int? footer_hierarchy;
    int? header_dis;
    int? header_hierarchy;
    int? id;
    int? mobile_dis;
    int? mobile_hierarchy;
    int? parent_id;
    int? publish;
    int? sub_hierarchy;
    String? url_dis_title;

    PhotoCts({this.body_dis, this.body_hierarchy, this.cat_name, this.footer_dis, this.footer_hierarchy, this.header_dis, this.header_hierarchy, this.id, this.mobile_dis, this.mobile_hierarchy, this.parent_id, this.publish, this.sub_hierarchy, this.url_dis_title});

    factory PhotoCts.fromJson(Map<String, dynamic> json) {
        return PhotoCts(
            body_dis: json['body_dis'], 
            body_hierarchy: json['body_hierarchy'], 
            cat_name: json['cat_name'], 
            footer_dis: json['footer_dis'], 
            footer_hierarchy: json['footer_hierarchy'], 
            header_dis: json['header_dis'], 
            header_hierarchy: json['header_hierarchy'], 
            id: json['id'], 
            mobile_dis: json['mobile_dis'], 
            mobile_hierarchy: json['mobile_hierarchy'], 
            parent_id: json['parent_id'], 
            publish: json['publish'], 
            sub_hierarchy: json['sub_hierarchy'], 
            url_dis_title: json['url_dis_title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['body_dis'] = this.body_dis;
        data['body_hierarchy'] = this.body_hierarchy;
        data['cat_name'] = this.cat_name;
        data['footer_dis'] = this.footer_dis;
        data['footer_hierarchy'] = this.footer_hierarchy;
        data['header_dis'] = this.header_dis;
        data['header_hierarchy'] = this.header_hierarchy;
        data['id'] = this.id;
        data['mobile_dis'] = this.mobile_dis;
        data['mobile_hierarchy'] = this.mobile_hierarchy;
        data['parent_id'] = this.parent_id;
        data['publish'] = this.publish;
        data['sub_hierarchy'] = this.sub_hierarchy;
        data['url_dis_title'] = this.url_dis_title;
        return data;
    }
}