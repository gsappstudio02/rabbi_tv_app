import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';

Client client = Client().setProject('671797dd002f42b6ce43').setSelfSigned(status: true);

Account account= Account(client);

Future<String> sendOTPToVerify({required String mobile}) async{
  try{
    final Token data= await account.createPhoneToken(userId: mobile.replaceAll('+', ''), phone: mobile);
    print(data.userId);
    return data.userId;
  }
  catch(e){
    print(e);
    return "login_error";
  }
}

Future<bool> verifyOTP({required String secret, required String mobile, required String userId}) async {
  try{
    final Session session= await account.updatePhoneSession(userId: userId, secret: secret);
    print('User Id here:'+userId);
    print(session..userId);
    return true;
  }
  catch(e){
    print(e);
    return false;
  }
}

Future<bool> logoutSession()  async {
  try{
    await account.deleteSessions();
    return true;
}
catch(e){
    return false;
}
}