class LastEntryNewsResponse {
    String generate_url;
    Object hanger;
    int id;
    String img_url;
    String news_date;
    int parent_cat_id;
    Object shoulder;
    String title;
    int video_dis;

    LastEntryNewsResponse({this.generate_url, this.hanger, this.id, this.img_url, this.news_date, this.parent_cat_id, this.shoulder, this.title, this.video_dis});

    factory LastEntryNewsResponse.fromJson(Map<String, dynamic> json) {
        return LastEntryNewsResponse(
            generate_url: json['generate_url'], 
           // hanger: json['hanger'] != null ? Object.fromJson(json['hanger']) : null,
            id: json['id'], 
            img_url: json['img_url'], 
            news_date: json['news_date'], 
            parent_cat_id: json['parent_cat_id'], 
           // shoulder: json['shoulder'] != null ? Object.fromJson(json['shoulder']) : null,
            title: json['title'], 
            video_dis: json['video_dis'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['generate_url'] = this.generate_url;
        data['id'] = this.id;
        data['img_url'] = this.img_url;
        data['news_date'] = this.news_date;
        data['parent_cat_id'] = this.parent_cat_id;
        data['title'] = this.title;
        data['video_dis'] = this.video_dis;
        // if (this.hanger != null) {
        //     data['hanger'] = this.hanger.toJson();
        // }
        // if (this.shoulder != null) {
        //     data['shoulder'] = this.shoulder.toJson();
        // }
        return data;
    }
}