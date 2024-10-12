class NValidator {
  static String? validateEmptyText(String? fieldName ,String? value){
    if(value==null || value.isEmpty){
      return '$fieldName مطلوب.';
    }
    return null;
  }
 
  
  static String? validateEmail(String? value){
    if(value==null || value.isEmpty){
      return 'البريد الإلكتروني مطلوب';
    }

    final emailRegExp=RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegExp.hasMatch(value)){
      return 'البريد الإلكتروني غير صحيح';
    }
    return null;
  }

  static String? validatePassword(String? value){
    if(value==null || value.isEmpty){
      return 'كلمة المرور مطلوبة';
    }

    if(value.length<8){
      return 'كلمة المرور يجب أن تكون مكونة من 8 أحرف على الأقل';
    }

    // if(!value.contains(RegExp(r'[A-Z]'))){
    //   return 'Password must contain at least one uppercase letter.';
    // }
    //  if(!value.contains(RegExp(r'[0-9]'))){
    //   return 'Password must contain at least one number ';
    // }
    //  if(!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
    //   return 'Password must contain at least one special  character.';
    // }
return null;

  }


    static String? validatePhoneNumber(String? value){
    if(value==null || value.isEmpty){
      return 'رقم الهاتف مطلوب';
    }

final phoneRegEx=RegExp(r'^\d{9}$');
    if(!phoneRegEx.hasMatch(value)){
      return 'تنسيق رقم الهاتف غير صحيح (يجب أن يتكون من 9 أرقام)';
    }
return null;

  }
}