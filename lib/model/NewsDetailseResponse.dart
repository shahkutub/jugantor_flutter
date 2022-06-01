class NewsDetailseResponse {
    int bread_parent_cat_id;
    String bread_parent_cat_name;
    int bread_sub_cat_id;
    String bread_sub_cat_name;
    String category_name;
    String detail;
    String generate_url;
    String hanger;
    int id;
    String img_url;
    String location_name;
    String location_tag;
    String news_date_time;
    int news_edition;
    String news_sum;
    String news_tags;
    String org_name;
    String org_tag;
    int parent_cat_id;
    String parent_cat_url;
    String people_name;
    String people_tag;
    String photo_alt_txt;
    Object photo_caption;
    String reporter;
    String shoulder;
    Object spc_event_tag_id;
    String title;
    int video_dis;

    NewsDetailseResponse({this.bread_parent_cat_id, this.bread_parent_cat_name, this.bread_sub_cat_id, this.bread_sub_cat_name, this.category_name, this.detail, this.generate_url, this.hanger, this.id, this.img_url, this.location_name, this.location_tag, this.news_date_time, this.news_edition, this.news_sum, this.news_tags, this.org_name, this.org_tag, this.parent_cat_id, this.parent_cat_url, this.people_name, this.people_tag, this.photo_alt_txt, this.photo_caption, this.reporter, this.shoulder, this.spc_event_tag_id, this.title, this.video_dis});

    factory NewsDetailseResponse.fromJson(Map<String, dynamic> json) {
        return NewsDetailseResponse(
            bread_parent_cat_id: json['bread_parent_cat_id'],
            bread_parent_cat_name: json['bread_parent_cat_name'],
            bread_sub_cat_id: json['bread_sub_cat_id'],
            bread_sub_cat_name: json['bread_sub_cat_name'],
            category_name: json['category_name'],
            detail: json['detail'],
            generate_url: json['generate_url'],
            hanger: json['hanger'],
            id: json['id'],
            img_url: json['img_url'],
            location_name: json['location_name'],
            location_tag: json['location_tag'],
            news_date_time: json['news_date_time'],
            news_edition: json['news_edition'],
            news_sum: json['news_sum'],
            news_tags: json['news_tags'],
            org_name: json['org_name'],
            org_tag: json['org_tag'],
            parent_cat_id: json['parent_cat_id'],
            parent_cat_url: json['parent_cat_url'],
            people_name: json['people_name'],
            people_tag: json['people_tag'],
            photo_alt_txt: json['photo_alt_txt'],
            reporter: json['reporter'],
            shoulder: json['shoulder'],
            title: json['title'],
            video_dis: json['video_dis'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['bread_parent_cat_id'] = this.bread_parent_cat_id;
        data['bread_parent_cat_name'] = this.bread_parent_cat_name;
        data['bread_sub_cat_id'] = this.bread_sub_cat_id;
        data['bread_sub_cat_name'] = this.bread_sub_cat_name;
        data['category_name'] = this.category_name;
        data['detail'] = this.detail;
        data['generate_url'] = this.generate_url;
        data['hanger'] = this.hanger;
        data['id'] = this.id;
        data['img_url'] = this.img_url;
        data['location_name'] = this.location_name;
        data['location_tag'] = this.location_tag;
        data['news_date_time'] = this.news_date_time;
        data['news_edition'] = this.news_edition;
        data['news_sum'] = this.news_sum;
        data['news_tags'] = this.news_tags;
        data['org_name'] = this.org_name;
        data['org_tag'] = this.org_tag;
        data['parent_cat_id'] = this.parent_cat_id;
        data['parent_cat_url'] = this.parent_cat_url;
        data['people_name'] = this.people_name;
        data['people_tag'] = this.people_tag;
        data['photo_alt_txt'] = this.photo_alt_txt;
        data['reporter'] = this.reporter;
        data['shoulder'] = this.shoulder;
        data['title'] = this.title;
        data['video_dis'] = this.video_dis;

        return data;
    }
}