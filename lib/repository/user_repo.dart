import '../models/user_model.dart';
import '../services/user_services.dart';

/// `UserRepository` sınıfı, kullanıcı verileriyle ilgili işlemleri yönetir.
/// `UserServices` sınıfının bir örneğini içerir.
///
/// Repository (Depo) tasarım deseni, uygulamanın domain ve veri eşleme katmanları arasında arabuluculuk yapar.
/// Repository, domain nesnelerine erişim ve durumlarını yönetmek için basit, okunabilir bir arayüz sağlar.
///
/// Repository'nin kullanılmasının birkaç nedeni vardır:
/// 1. **Soyutlama**: Repository, veri katmanının soyutlamasını sağlar. Bu, uygulamanın geri kalanının verilerin nasıl alındığı veya saklandığı hakkında bilgi sahibi olmasına gerek kalmaması anlamına gelir.
/// 2. **Bağımsızlık**: Uygulama mantığını veri erişim mantığından bağımsız hale getirir. Bu, sistem parçalarının bağımsız olarak gelişmesini sağlar.
/// 3. **Test Edilebilirlik**: Repository, uygulama mantığını veri erişim mantığından ayırdığı için, birim testlerini yazmayı kolaylaştırır.
/// 4. **Yeniden Kullanılabilirlik**: Uygulamanın farklı bölümlerinde aynı repository metotlarını yeniden kullanabilirsiniz, bu da kod tekrarını azaltır.
///
/// `UserRepository` sınıfı, bu prensipleri uygular ve kullanıcı verileriyle ilgili işlemleri yönetir.
/// Bu sınıf, `UserServices` sınıfını kullanarak işlemler gerçekleştirir,
/// örneğin belirli bir kullanıcının verilerini alma.
/// Repository'nin kullanılması sayesinde, uygulamanın geri kalanı bu hizmet hakkında bilgi sahibi olmasına gerek kalmaz ve
/// kullanıcı verileriyle daha soyut bir şekilde etkileşim kurabilir.

/// `UserRepository` sınıfı, kullanıcı verileriyle ilgili işlemleri yönetir.
/// `UserServices` sınıfının bir örneğini içerir.
class UserRepository {

  // UserServices sınıfının bir örneği.
  final UserServices _userServices = UserServices();

  /// Belirli bir kullanıcının verilerini almak için metod.
  /// Kullanıcı verilerini almak için `UserServices`'ten `getUser` metodunu kullanır.
  /// Veri alma işlemi başarılı olursa, bir `UserModel` döndürür.
  /// Veri alma işlemi başarısız olursa, bir hata mesajı yazdırır ve null döndürür.
  Future<UserModel?> getUser(String uid) async {
    try {
      return await _userServices.getUser(uid);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

}