import 'package:flutterfire_ui/i10n.dart';

class LabelOverrides extends DefaultLocalizations {
  const LabelOverrides();

  @override
  String get emailInputLabel => 'email';

  @override
  String get passwordInputLabel => 'senha';

  @override
  String get signInText  => 'Bike Finder';

  @override
  String get emailIsRequiredErrorText  => 'email é obrigatório!';

  @override
  String get passwordIsRequiredErrorText  => 'senha é obrigatório!';

  @override
  String get forgotPasswordButtonLabel => 'Esqueceu a senha?';

  @override
  String get forgotPasswordHintText  => 'Forneça seu e-mail e enviaremos um link para redefinir sua senha';

  @override
  String get forgotPasswordViewTitle  => 'Esqueceu a senha?';

  @override
  String get resetPasswordButtonLabel => 'ENVIAR';

  @override
  String get goBackButtonLabel => 'Voltar';
}