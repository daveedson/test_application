class CreateNewBornModel{

final String name;
final String gestation;
final String gender;

  CreateNewBornModel({required this.name, required this.gestation, required this.gender});
 
  Map<String, dynamic> toJson() {
   return {
    "data": {
        "type": "newborns",
        "attributes": {
            "name": name,
            "gestation": gestation,
            "gender": gender
        }
    }
};
}
}

