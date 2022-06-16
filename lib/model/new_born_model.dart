class NewBornModel{
 String? name;
 String? gestation;
  
  NewBornModel({required this.name, required this.gestation});

  NewBornModel.fromJson(Map<String,dynamic> json){
    name = json["name"];
    gestation = json["gestation"];
  }

}


class NewBornModelResponse{
  List<NewBornModel>? newBornResults;
}
