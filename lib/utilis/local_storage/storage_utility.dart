import 'package:get_storage/get_storage.dart';

class NLocalStorage {

//  late final GetStorage _storage ;

  GetStorage _storage =GetStorage();


//Singleton instance
static NLocalStorage? _instance; 

NLocalStorage._internal();

factory NLocalStorage.instance(){
  _instance??=NLocalStorage._internal();
  return _instance!;
}

static Future<void> init(String bucketName)async{
  await GetStorage.init(bucketName);
  _instance=NLocalStorage._internal();
  _instance!._storage=GetStorage(bucketName);
}

// Method to save data
Future<void> writeData<T>(String key, T value)async{
  await _storage.write(key, value);
}




// static final NLocalStorage _instance=NLocalStorage._internal();





// Future<void> saveData<T>(String key, T value)async{
//   await _storage.write(key, value);
// }

//Generic Method to read data
T? readData<T>(String key){
  return _storage.read<T>(key);
}


//Generic Method to remove data
Future<void> removeData<T>(String key)async{
  await _storage.remove(key);
}

Future<void> clearAll<T>(String key)async{
  await _storage.erase();
}






}