int toInteger(var data) {
  return data != null
      ? data is int
          ? data
          : int.tryParse(data)
      : null;
}
