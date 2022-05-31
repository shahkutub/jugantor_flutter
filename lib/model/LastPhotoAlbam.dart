class LastPhotoAlbam {
    String album_name;
    String common_photo_title;
    String generate_url;
    int id;
    List<String> images;
    List<String> img_titles;
    String parent_url_dis;
    String trim_album_name;

    LastPhotoAlbam({this.album_name, this.common_photo_title, this.generate_url, this.id, this.images, this.img_titles, this.parent_url_dis, this.trim_album_name});

    factory LastPhotoAlbam.fromJson(Map<String, dynamic> json) {
        return LastPhotoAlbam(
            album_name: json['album_name'], 
            common_photo_title: json['common_photo_title'], 
            generate_url: json['generate_url'], 
            id: json['id'], 
            images: json['images'] != null ? new List<String>.from(json['images']) : null, 
            img_titles: json['img_titles'] != null ? new List<String>.from(json['img_titles']) : null, 
            parent_url_dis: json['parent_url_dis'], 
            trim_album_name: json['trim_album_name'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['album_name'] = this.album_name;
        data['common_photo_title'] = this.common_photo_title;
        data['generate_url'] = this.generate_url;
        data['id'] = this.id;
        data['parent_url_dis'] = this.parent_url_dis;
        data['trim_album_name'] = this.trim_album_name;
        if (this.images != null) {
            data['images'] = this.images;
        }
        if (this.img_titles != null) {
            data['img_titles'] = this.img_titles;
        }
        return data;
    }
}