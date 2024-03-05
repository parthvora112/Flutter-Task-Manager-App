class Validators{
  static String? emptyStringValidation(String? value){
    if(value==null || value.isEmpty){
      return 'This field is required';
    }else{
      return null;
    }
  }
}