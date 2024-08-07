import '../../../models/LoginModel.dart';
import '../../../models/LogoutModel.dart';

abstract class login_states {}

class intial_login_states extends login_states {}
///////////////////////////////////////////////////////////////////

class success_login_states extends login_states {
  final LoginModel loginModel;

  success_login_states(this.loginModel);
}

class Error_login_states extends login_states {
  final String error;

  Error_login_states(this.error);
}

class loading_login_states extends login_states {}
//////////////////////////////////////////////////////////////////////

class success_signup_states extends login_states {}

class Error_signup_states extends login_states {
  final String error;

  Error_signup_states(this.error);
}

class loading_signup_states extends login_states {}

/////////////////////////////////////////////////
class successLogoutstates extends login_states {
  final LogoutModel logoutModel;

  successLogoutstates(this.logoutModel);
}

class ErrorLogoutstates extends login_states {
  final String error;

  ErrorLogoutstates(this.error);
}

class loadingLogoutstates extends login_states {}
/////////////////////////////////////////////////
