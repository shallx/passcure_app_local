

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