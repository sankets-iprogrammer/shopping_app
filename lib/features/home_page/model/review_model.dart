import 'package:shopping_app/core/services/storage_services/realm_storage/realm_data_models/realm_model.dart';

class Reviews {
  int? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Reviews(
      {this.rating,
        this.comment,
        this.date,
        this.reviewerName,
        this.reviewerEmail});

  factory Reviews.fromJson(Map<String, dynamic> json) {
    return Reviews(
        rating : json['rating'],
        comment : json['comment'],
        date : json['date'],
    reviewerName : json['reviewerName'],
    reviewerEmail : json['reviewerEmail']
    );

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    data['date'] = this.date;
    data['reviewerName'] = this.reviewerName;
    data['reviewerEmail'] = this.reviewerEmail;
    return data;
  }

  RealmReviewModel toRealm(){
    return RealmReviewModel(
        rating : rating,
        comment : comment,
        date : date,
        reviewerName : reviewerName,
        reviewerEmail : reviewerEmail
    );
  }
}