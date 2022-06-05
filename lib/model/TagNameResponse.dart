class TagNameResponse {
    String? operator;
    //Object aro_tags;
    String? entry_time;
    int? id;
    int? publish;
    String? tag_dtl;
    String? tag_img;
    //Object tag_img_caption;
    //Object tag_img_name;
    String? tag_name;
    int? tag_type;
    //Object update_operator;
    String? update_time;

    TagNameResponse({this.operator, this.entry_time, this.id, this.publish, this.tag_dtl, this.tag_img,  this.tag_name, this.tag_type,this.update_time});

    factory TagNameResponse.fromJson(Map<String, dynamic> json) {
        return TagNameResponse(
            operator: json['operator'],
            //aro_tags: json['aro_tags'] != null ? Object.fromJson(json['aro_tags']) : null,
            entry_time: json['entry_time'], 
            id: json['id'], 
            publish: json['publish'], 
            tag_dtl: json['tag_dtl'], 
            tag_img: json['tag_img'], 
            //tag_img_caption: json['tag_img_caption'] != null ? Object.fromJson(json['tag_img_caption']) : null,
            //tag_img_name: json['tag_img_name'] != null ? Object.fromJson(json['tag_img_name']) : null,
            tag_name: json['tag_name'], 
            tag_type: json['tag_type'], 
            //update_operator: json['update_operator'] != null ? Object.fromJson(json['update_operator']) : null,
            update_time: json['update_time'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        //data['`operator`'] = this.`operator`;
        data['entry_time'] = this.entry_time;
        data['id'] = this.id;
        data['publish'] = this.publish;
        data['tag_dtl'] = this.tag_dtl;
        data['tag_img'] = this.tag_img;
        data['tag_name'] = this.tag_name;
        data['tag_type'] = this.tag_type;
        data['update_time'] = this.update_time;
        // if (this.aro_tags != null) {
        //     data['aro_tags'] = this.aro_tags.toJson();
        // }
        // if (this.tag_img_caption != null) {
        //     data['tag_img_caption'] = this.tag_img_caption.toJson();
        // }
        // if (this.tag_img_name != null) {
        //     data['tag_img_name'] = this.tag_img_name.toJson();
        // }
        // if (this.update_operator != null) {
        //     data['update_operator'] = this.update_operator.toJson();
        // }
        return data;
    }
}