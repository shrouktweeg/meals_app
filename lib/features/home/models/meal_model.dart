class MealResponse {
  final List<Meal>? meals;

  MealResponse({this.meals});

  factory MealResponse.fromJson(Map<String, dynamic> json) {
    return MealResponse(
      meals: json['meals'] != null
          ? List<Meal>.from(json['meals'].map((x) => Meal.fromJson(x)))
          : null,
    );
  }

  Map<String, dynamic> toJson() => {
    'meals': meals?.map((x) => x.toJson()).toList(),
  };
}

class Meal {
  final String? idMeal;
  final String? strMeal;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strYoutube;
  final String? strSource;
  final List<Ingredient> ingredients;

  Meal({
    this.idMeal,
    this.strMeal,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strYoutube,
    this.strSource,
    required this.ingredients,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    List<Ingredient> ingredientsList = [];

    // The API structure uses numbered keys (strIngredient1, strMeasure1, etc.)
    // This loop dynamically extracts them into a clean List.
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];

      if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
        ingredientsList.add(Ingredient(
          name: ingredient.toString().trim(),
          measure: measure?.toString().trim() ?? "",
        ));
      }
    }

    return Meal(
      idMeal: json['idMeal'],
      strMeal: json['strMeal'],
      strCategory: json['strCategory'],
      strArea: json['strArea'],
      strInstructions: json['strInstructions'],
      strMealThumb: json['strMealThumb'],
      strYoutube: json['strYoutube'],
      strSource: json['strSource'],
      ingredients: ingredientsList,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'idMeal': idMeal,
      'strMeal': strMeal,
      'strCategory': strCategory,
      'strArea': strArea,
      'strInstructions': strInstructions,
      'strMealThumb': strMealThumb,
      'strYoutube': strYoutube,
      'strSource': strSource,
    };

    // Converting list back to the numbered key format for the API
    for (int i = 0; i < ingredients.length; i++) {
      data['strIngredient${i + 1}'] = ingredients[i].name;
      data['strMeasure${i + 1}'] = ingredients[i].measure;
    }

    return data;
  }
}

class Ingredient {
  final String name;
  final String measure;

  Ingredient({required this.name, required this.measure});
}