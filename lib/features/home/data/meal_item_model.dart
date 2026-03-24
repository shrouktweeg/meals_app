
class MealItemModel{
  final String imageUrl;
  final String mealName;
  final String description;
  final double rate;
  final String duration;

  MealItemModel({
    required this.imageUrl,
    required this.mealName,
    required this.description,
    required this.rate, 
    required this.duration});

Map<String,dynamic>toMap(){
  return{
    'imageUrl':imageUrl,
    'mealName':mealName,
    'description':description,
    'rate':rate,
    'duration':duration
  };
}

factory MealItemModel.fromMap(Map<String,dynamic>meal){
  return MealItemModel(
      imageUrl: meal['imageUrl'],
      mealName: meal['mealName'],
      description: meal['description'],
      rate: meal['rate'],
      duration: meal['duration']);
}
}