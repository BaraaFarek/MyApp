import 'package:untitled/models/DeliveryComapanies.dart';
import 'package:untitled/models/Products_Model.dart';

import '../../../models/CategoriesModel.dart';
import '../../../models/StoresModel.dart';

abstract class app_states {}

class initial_app_states extends app_states {}

class app_changeMode_states extends app_states {}

class changebottoNav_States extends app_states {}

///////////////////////////////////////////////////////////////////
class SuccessProductsState extends app_states {
  final List<ProductsModel> products;
  SuccessProductsState(this.products);
}

class errorProductsState extends app_states {
  final String error;
  errorProductsState(this.error);
}

class loadingProductsState extends app_states {}

//////////////////////////////////////////////////////////////////
class successCategoriessState extends app_states {
  final List<CategoriesModel> categories;

  successCategoriessState(this.categories);
}

class errorCategoriesState extends app_states {
  final String error;

  errorCategoriesState(this.error);
}

class loadingCategoriesState extends app_states {}

/////////////////////////////////////////////////////////////////
class successDeliveryCompaniesState extends app_states {
  final List<Deliverycomapanies> delivery;
  successDeliveryCompaniesState(this.delivery);
}

class errorsDeliveryCompaniesState extends app_states {
  final String error;
  errorsDeliveryCompaniesState(this.error);
}

class loadingDeliveryCompaniesState extends app_states {}

/////////////////////////////////////////////////////////////
class successStoresByCategoryState extends app_states {
  final List<StoresByCategories> stores;

  successStoresByCategoryState(this.stores);
}

class errorStoresByCategoryState extends app_states {
  final String error;

  errorStoresByCategoryState(this.error);
}

class loadingStoresByCategoryState extends app_states {}
