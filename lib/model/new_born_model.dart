// ignore_for_file: empty_constructor_bodies, deprecated_member_use, prefer_collection_literals

import 'package:test_app/utils/paser_util.dart';

class NewBornModel {
  String name;
  String gestation;

  NewBornModel({required this.name, required this.gestation});

  factory NewBornModel.fromJson(Map<String, dynamic> json) {
    return NewBornModel(
      name:json["attributes"]["name"],
      gestation: json["attributes"]["gestation"],
    );
  }
}

class NewBornModelResponse {
  List<NewBornModel> newBornResults;

  NewBornModelResponse({required this.newBornResults});

  factory NewBornModelResponse.fromJson(Map<String, dynamic> json) {
    return NewBornModelResponse(
      newBornResults: ParserUtil<NewBornModel>().parseJsonList(
        json: json ['data'],
        fromJson: (value) => NewBornModel.fromJson(value),
      ),
    );
  }

}
