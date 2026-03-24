import 'package:meal_app/features/home/data/meal_item_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataBaseHelper{
  static final DataBaseHelper dataBaseHelper=DataBaseHelper();
  Database? _dataBase;

  Future<Database>get dataBase async{
    if(_dataBase!=null) return _dataBase!;
     _dataBase= await _initDataBase();
return _dataBase!;
  }
  Future<Database> _initDataBase()async{
    String path=join(await getDatabasesPath(),'meals.db');
    return await openDatabase(
      onCreate: _createDataBase,
      version: 1,
      path
    );
  }
  Future<void> _createDataBase(Database db, int version) async {
    await db.execute(
        '''
    CREATE TABLE meals (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      imageUrl TEXT,
      mealName TEXT,
      description TEXT,
      rate REAL,
      duration TEXT
    )
    '''
    );
  }
 Future<int> insertMeal(MealItemModel meal) async {
  final db= await dataBase;
  Map<String,dynamic>mealMap=meal.toMap();
  return db.insert('meals',mealMap);
 }
 Future<List<MealItemModel>> getAllMeals()async{
    final db= await dataBase;
List<Map<String,dynamic>> mealsMap= await db.query('meals');
List<MealItemModel>meals=mealsMap.map((meal)=>MealItemModel.fromMap(meal)).toList();
return meals;
  }

}