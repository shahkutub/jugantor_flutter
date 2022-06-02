class LastOnlinePoll {
    String? operator;
    String? display_on;
    String? entry_time;
    int? id;
    String? options;
    String? poll_caption;
    int? publish;
    String? ques;
    String? update_time;
    String? votes;

    LastOnlinePoll({this.operator, this.display_on, this.entry_time, this.id, this.options, this.poll_caption, this.publish, this.ques, this.update_time, this.votes});

    factory LastOnlinePoll.fromJson(Map<String, dynamic> json) {
        return LastOnlinePoll(
            operator: json['`operator`'],
            display_on: json['display_on'], 
            entry_time: json['entry_time'], 
            id: json['id'], 
            options: json['options'], 
            poll_caption: json['poll_caption'], 
            publish: json['publish'], 
            ques: json['ques'], 
            update_time: json['update_time'], 
            votes: json['votes'], 
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['operator'] = this.operator;
        data['display_on'] = this.display_on;
        data['entry_time'] = this.entry_time;
        data['id'] = this.id;
        data['options'] = this.options;
        data['poll_caption'] = this.poll_caption;
        data['publish'] = this.publish;
        data['ques'] = this.ques;
        data['update_time'] = this.update_time;
        data['votes'] = this.votes;
        return data;
    }
}