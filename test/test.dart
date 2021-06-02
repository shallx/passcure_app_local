void main() {
  String s = Table('students')
      .string('name', false)
      .integer('roll')
      .createTable();
  print(s);
}

class Table {
  String tableName = '';
  List columns = [];

  Table(this.tableName);

  Table string(String columnName, [bool isNull, String defaultValue]) {
    return this.addColumn(columnName, 'TEXT', isNull, defaultValue);
  }

  Table integer(String columnName, [bool isNull, String defaultValue]) {
    return this.addColumn(columnName, 'INTEGER', isNull, defaultValue);
  }

  Table float(String columnName, [bool isNull, String defaultValue]) {
    return this.addColumn(columnName, 'REAL', isNull, defaultValue);
  }

  Table timestamps([String timestampName]) {
    timestampName ??= 'created_at';
    this.columns.add(
        '$timestampName TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP');

    return this;
  }

  Table primaryId([String id]) {
    id ??= 'id';
    this.columns.add('$id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY');
    return this;
  }

  Table addColumn(String columnName, String columnType,
      [bool isNull, String defaultValue]) {
    String s = '$columnName $columnType';
    if (isNull != null && isNull == false) {
      s += ' NOT NULL';
    }
    if (defaultValue != null) {
      s += ' DEFAULT $defaultValue';
    }
    columns.add(s);
    return this;
  }

  dynamic createTable() {
    String s = 'CREATE TABLE $tableName (';
    int length = columns.length - 1;
    for (int i = 0; i < length; i++) {
      s += columns[i] + ',';
    }
    s += columns[length] + ')';
    return s;
  }
}
