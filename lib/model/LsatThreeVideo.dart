class LsatThreeVideo {
    String? cover_photo;
    String? embed_code;
    String? generate_url;
    int? id;
    int? video_cat_id;
    String? video_cat_name;
    String? video_sum;
    String? video_title;

    LsatThreeVideo({this.cover_photo, this.embed_code, this.generate_url, this.id, this.video_cat_id, this.video_cat_name, this.video_sum, this.video_title});

    factory LsatThreeVideo.fromJson(Map<String, dynamic> json) {
        return LsatThreeVideo(
            cover_photo: json['cover_photo'], 
            embed_code: json['embed_code'], 
            generate_url: json['generate_url'], 
            id: json['id'], 
            video_cat_id: json['video_cat_id'], 
            video_cat_name: json['video_cat_name'], 
            video_sum: json['video_sum'], 
            video_title: json['video_title'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cover_photo'] = this.cover_photo;
        data['embed_code'] = this.embed_code;
        data['generate_url'] = this.generate_url;
        data['id'] = this.id;
        data['video_cat_id'] = this.video_cat_id;
        data['video_cat_name'] = this.video_cat_name;
        data['video_sum'] = this.video_sum;
        data['video_title'] = this.video_title;
        return data;
    }
}