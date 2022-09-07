import 'package:objectdb/src/objectdb_storage_indexeddb.dart';
import 'package:qr_coder/classes/abstract_database_interface.dart';

class WebDatabaseInterface implements DatabaseInterface {
	static dynamic storage() {
		return IndexedDBStorage('theme');
	}
}
