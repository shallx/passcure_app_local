void main() {
  String s = Table('students')
      .primaryId()
      .string('name', false)
      .string('id', false)
      .integer('rolls')
      .timestamps()
      .createTable();
  print(s);
}

class Table {
  String tableName = '';
  List _columns = [];

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
    this._columns.add(
        '$timestampName TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP');

    return this;
  }

  Table primaryId([String id]) {
    id ??= 'id';
    this._columns.add('$id INT(10) UNSIGNED AUTO_INCREMENT PRIMARY KEY');
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
    _columns.add(s);
    return this;
  }

  dynamic createTable() {
    String s = 'CREATE TABLE $tableName (';
    int length = _columns.length - 1;
    for (int i = 0; i < length; i++) {
      s += _columns[i] + ',';
    }
    s += _columns[length] + ')';
    return s;
  }
}
