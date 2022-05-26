class CategoryResponse {
    String cat_name;
    int id;

    CategoryResponse({this.cat_name, this.id});

    factory CategoryResponse.fromJson(Map<String, dynamic> json) {
        return CategoryResponse(
            cat_name: json['cat_name'], 
            id: json['id'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['cat_name'] = this.cat_name;
        data['id'] = this.id;
        return data;
    }
}