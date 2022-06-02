class LeadNewsResponse {
    String? generate_url;
    Object? hanger;
    int? id;
    String? img_url;
    int? parent_cat_id;
    Object? shoulder;
    String? title;
    int? video_dis;

    LeadNewsResponse({this.generate_url, this.hanger, this.id, this.img_url, this.parent_cat_id, this.shoulder, this.title, this.video_dis});

    factory LeadNewsResponse.fromJson(Map<String, dynamic> json) {
        return LeadNewsResponse(
            generate_url: json['generate_url'], 
            id: json['id'],
            img_url: json['img_url'], 
            parent_cat_id: json['parent_cat_id'], 
            title: json['title'],
            video_dis: json['video_dis'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['generate_url'] = this.generate_url;
        data['id'] = this.id;
        data['img_url'] = this.img_url;
        data['parent_cat_id'] = this.parent_cat_id;
        data['title'] = this.title;
        data['video_dis'] = this.video_dis;

        return data;
    }
}