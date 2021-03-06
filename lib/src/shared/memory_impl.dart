part of cargo;

class MemoryImpl implements CargoBase {
  Completer _completer;
  Map values = new Map();

  MemoryImpl() {
    _completer = new Completer();
    _completer.complete();
  }

  dynamic getItemSync(String key) {
    return values[key];
  }

  Future getItem(String key) {
    Completer complete = new Completer();
    complete.complete(values[key]);
    return complete.future;
  }

  void setItem(String key, data) {
    values[key] = data;
  }

  void removeItem(String key) {
    values.remove(key);
  }

  void clear() {
    values.clear();
  }

  int length() {
    return values.length;
  }

  void operator []=(String key, value) {
    setItem(key, value);
  }

  dynamic operator [](String key){
    return getItemSync(key);
  }

  Future start() => _completer.future;
}

