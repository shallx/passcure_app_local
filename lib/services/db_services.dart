import 'package:passcure/models/db_models.dart';
import 'package:passcure/models/student.dart';
import 'package:passcure/utils/database.dart';

class DBService {
  Future<bool> addStudent(Student model) async {
    await DB.init();
    bool isSaved = false;
    if (model != null) {
      int inserted = await DB.insert(Student.table, model);
      isSaved = inserted == 1 ? true : false;
    }

    return isSaved;
  }

  Future<bool> addEmail(Email model) async {
    // await DB.init();
    // bool isSaved = false;
    // if (model != null) {
    //   int inserted = await DB.insert(Email.table, model);
    //   isSaved = inserted == 1 ? true : false;
    // }

    // return isSaved;
    return addModel(model, Email.table);
  }

  Future<bool> addAccount(Account model) async {
    return addModel(model, Account.table);
  }

  Future<bool> addCategory(Category model) async {
    return addModel(model, Category.table);
  }

  Future<bool> addProvider(Provider model) async {
    return addModel(model, Provider.table);
  }

  Future<bool> addModel(Model model, String tableName) async {
    await DB.init();
    bool isSaved = false;
    if (model != null) {
      int inserted = await DB.insert(tableName, model);
      isSaved = inserted == 1 ? true : false;
    }
    return isSaved;
  }

  Future<bool> updateProduct(Student model) async {
    await DB.init();
    bool isSaved = false;
    if (model != null) {
      int inserted = await DB.update(Student.table, model);

      isSaved = inserted == 1 ? true : false;
    }

    return isSaved;
  }

  Future<List<Student>> getStudent() async {
    await DB.init();
    List<Map<String, dynamic>> students = await DB.query(Student.table);

    return students.map((item) => Student.fromMap(item)).toList();
  }

  Future<List<Email>> getEmails() async {
    await DB.init();
    List<Map<String, dynamic>> results = await DB.query(Email.table);

    return results.map((item) => Email.fromMap(item)).toList();
  }

  Future<List<Account>> getAccounts() async {
    await DB.init();
    List<Map<String, dynamic>> results = await DB.query(Account.table);
    print(results);
    return results.map((item) => Account.fromMap(item)).toList();
  }

  Future<void> dropTable() async {
    await DB.dropTable();
  }

//   Future<List<CategoryModel>> getCategories() async {
//     await DB.init();
//     List<Map<String, dynamic>> categories = await DB.query(CategoryModel.table);

//     return categories.map((item) => CategoryModel.fromMap(item)).toList();
//   }

//   Future<bool> deleteProduct(Student model) async {
//     await DB.init();
//     bool isSaved = false;
//     if (model != null) {
//       int inserted = await DB.delete(Student.table, model);

//       isSaved = inserted == 1 ? true : false;
//     }

//     return isSaved;
//   }
}
