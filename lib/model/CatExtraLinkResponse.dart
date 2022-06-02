
class CatExtraLinkResponse {
    int? cat_id;
    String? cat_link;
    String? cat_name;
    String? cat_photo;
    int? parent_cat_id;
    String? parent_cat_name;

    CatExtraLinkResponse({this.cat_id, this.cat_link, this.cat_name, this.cat_photo, this.parent_cat_id, this.parent_cat_name});

    factory CatExtraLinkResponse.fromJson(Map<String, dynamic> json) {
        return CatExtraLinkResponse(
            cat_id: json['cat_id'],
            cat_link: json['cat_link'],
            cat_name: json['cat_name'],
            cat_photo: json['cat_photo'],
            parent_cat_id: json['parent_cat_id'],
            parent_cat_name: json['parent_cat_name'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cat_id'] = this.cat_id;
        data['cat_link'] = this.cat_link;
        data['cat_name'] = this.cat_name;
        data['cat_photo'] = this.cat_photo;
        data['parent_cat_id'] = this.parent_cat_id;
        data['parent_cat_name'] = this.parent_cat_name;
        return data;
    }
}