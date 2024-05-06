abstract class app_states {}

class initial_app_states extends app_states {}

class app_changebottomnav_states extends app_states {}

class app_changeMode_states extends app_states {}

class NewsBussinesSuccessState extends app_states {
  var news;
  NewsBussinesSuccessState(this.news);
}

class NewsBussinesErrorState extends app_states {
  final String error;
  NewsBussinesErrorState(this.error);
}

class NewsLoadingState extends app_states {}

class SignInSuccess extends app_states {}

class SignInLoading extends app_states {}

class SignInFailure extends app_states {
  final String errorMessage;
  SignInFailure({required this.errorMessage});
}

class initial_Categories extends app_states {}

class CategoriesLoadingState extends app_states {}

class CategoriesErrorState extends app_states {
  final String error;

  CategoriesErrorState(this.error);
}

class CategoriesSuccessState extends app_states {}
