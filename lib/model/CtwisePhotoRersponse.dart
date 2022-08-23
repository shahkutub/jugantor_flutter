
class CtwisePhotoRersponse {
    List<Data>? data;
    int? current_page;
    String? first_page_url;
    int? from;
    int? last_page;
    String? last_page_url;
    Object? next_page_url;
    String? path;
    int? per_page;
    Object? prev_page_url;
    int? to;
    int? total;

    CtwisePhotoRersponse({this.data, this.current_page, this.first_page_url, this.from, this.last_page, this.last_page_url, this.next_page_url, this.path, this.per_page, this.prev_page_url, this.to, this.total});

    factory CtwisePhotoRersponse.fromJson(Map<String, dynamic> json) {
        return CtwisePhotoRersponse(
            data: json['data'] != null ? (json['data'] as List).map((i) => Data.fromJson(i)).toList() : null,
            current_page: json['current_page'],
            first_page_url: json['first_page_url'],
            from: json['from'],
            last_page: json['last_page'],
            last_page_url: json['last_page_url'],
           // next_page_url: json['next_page_url'] != null ? Object.fromJson(json['next_page_url']) : null,
            path: json['path'],
            per_page: json['per_page'],
           // prev_page_url: json['prev_page_url'] != null ? Object.fromJson(json['prev_page_url']) : null,
            to: json['to'],
            total: json['total'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['current_page'] = this.current_page;
        data['first_page_url'] = this.first_page_url;
        data['from'] = this.from;
        data['last_page'] = this.last_page;
        data['last_page_url'] = this.last_page_url;
        data['path'] = this.path;
        data['per_page'] = this.per_page;
        data['to'] = this.to;
        data['total'] = this.total;
        if (this.data != null) {
            data['data'] = this.data!.map((v) => v.toJson()).toList();
        }
        // if (this.next_page_url != null) {
        //     data['next_page_url'] = this.next_page_url.toJson();
        // }
        // if (this.prev_page_url != null) {
        //     data['prev_page_url'] = this.prev_page_url.toJson();
        // }
        return data;
    }
}

class Data {
    String? operator;
    String? album_name;
    String? album_photos;
    String? album_photos_title;
    String? cat_id;
    String? common_photo_title;
    String? entry_time;
    int? front_display;
    int? id;
    int? parent_cat_id;
    int? publish;
    int? sel_index;
    String? update_time;

    Data({this.operator, this.album_name, this.album_photos, this.album_photos_title, this.cat_id, this.common_photo_title, this.entry_time, this.front_display, this.id, this.parent_cat_id, this.publish, this.sel_index, this.update_time});

    factory Data.fromJson(Map<String, dynamic> json) {
        return Data(
            operator: json['operator'],
            album_name: json['album_name'],
            album_photos: json['album_photos'],
            album_photos_title: json['album_photos_title'],
            cat_id: json['cat_id'],
            common_photo_title: json['common_photo_title'],
            entry_time: json['entry_time'],
            front_display: json['front_display'],
            id: json['id'],
            parent_cat_id: json['parent_cat_id'],
            publish: json['publish'],
            sel_index: json['sel_index'],
            update_time: json['update_time'],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['operator'] = this.operator;
        data['album_name'] = this.album_name;
        data['album_photos'] = this.album_photos;
        data['album_photos_title'] = this.album_photos_title;
        data['cat_id'] = this.cat_id;
        data['common_photo_title'] = this.common_photo_title;
        data['entry_time'] = this.entry_time;
        data['front_display'] = this.front_display;
        data['id'] = this.id;
        data['parent_cat_id'] = this.parent_cat_id;
        data['publish'] = this.publish;
        data['sel_index'] = this.sel_index;
        data['update_time'] = this.update_time;
        return data;
    }
}