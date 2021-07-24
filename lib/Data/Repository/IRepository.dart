



import 'package:admin/Data/HTTP_Helper/IHttp_Helper.dart';
import 'package:admin/Data/Prefs_Helper/IPrefs_Helper.dart';
import 'package:admin/Data/Repository/Repository.dart';

class IRepository implements Repository {
  IHttpHlper iHttpHlper = IHttpHlper();
  IprefsHelper iprefsHelper= IprefsHelper();
  IRepository(this.iHttpHlper, this.iprefsHelper);
}
