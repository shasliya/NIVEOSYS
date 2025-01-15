
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../Service/servicepage.dart';


class productController extends GetxController{
  HttpService details=HttpService();
  //obs observable
  var isLoading= true.obs;
  var productList =[].obs;
  @override
  void onInit(){
    getProducts();
    super.onInit();

  }

  void getProducts() async{
    try{
      isLoading(true);
      var products=await HttpService.fetchProductus();
      if(products!=''){
        productList.value=products;
      }
    }
    catch(e)
    {
      print(e);
    }
    finally{
      isLoading(false);
    }
  }

}