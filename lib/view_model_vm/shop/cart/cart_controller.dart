import 'dart:ffi';

import 'package:al_najah_store/common/widgets/loaders/loaders.dart';
import 'package:al_najah_store/models/shop/cart/cart_item.dart';
import 'package:al_najah_store/models/shop/product.dart';
import 'package:al_najah_store/utilis/local_storage/storage_utility.dart';
import 'package:al_najah_store/views/Shop/cart/widgets/cart_items.dart';
import 'package:get/get.dart';

class CartVM extends GetxController{
static CartVM get instance=>Get.find<CartVM>();

// varible 

Rx<int> noOfCartItems=0.obs;
RxDouble totalCartPrice=0.0.obs;
Rx<int> productQuantityInCart=0.obs;
RxList<CartItem>  cartItems=<CartItem>[].obs;

CartController(){
  loadCartItems();
  
}


// Add items to cart

void addToCart(Product product){

  //Quantity Check
  if(productQuantityInCart.value < 1){
    NLoaders.customToast(message: "Select Quantity");
    return;
  }

  final selectedCartItem=convertToCartItem(product, productQuantityInCart.value);
  print("RRRRRRRRRRRrr${selectedCartItem.id}");

  //Check if already added in the cart
  int index =cartItems.indexWhere((cartItem)=>cartItem.id==selectedCartItem.id); 
  if(index>=0){
    //This quantity is already added or update/Remove from the cart
    cartItems[index].quantity=selectedCartItem.quantity;

  }
  else{
    cartItems.add(selectedCartItem);
  }

  updateCart();
  NLoaders.customToast(message: "Your Product has been added to the Cart.");

}
// add one to cart
void addOneToCart(CartItem item){
  int index = cartItems.indexWhere((cartItem)=>cartItem.id == item.id);
  if(index >= 0){
    cartItems[index].quantity +=1;
  }
  else{
    cartItems.add(item);
  }
  updateCart();
}

// remove one from cart


void removeOneFromCart(CartItem item){
  int index = cartItems.indexWhere((cartItem)=>cartItem.id == item.id);
  if(index >= 0){
     if (cartItems[index].quantity > 1) {
      cartItems[index].quantity -= 1;
    } else if (cartItems[index].quantity == 1) {
      removeFromCartDialog(index);
    }

  }

  updateCart();
}
// Dailog 
void removeFromCartDialog(int index){
Get.defaultDialog(
  title: "Remove Product",
  middleText: "Are you sure you want to remove this product ?",
  onConfirm: (){
    //Remove the item from the cart
    cartItems.removeAt(index);
     Get.back();
    updateCart();
    NLoaders.errorSnackBar(title:'Remove' "Product $index removed from the Cart.");
  
  },
  
  onCancel: () => ()=>Get.back(),
);
}

// //Already Add
void updateAlreadyAddedProductCount(Product product){
  for (int i=0; i<cartItems.length; i++) {
    if(product.id==cartItems[i].id){
      print("LLLLLLLL");
                  productQuantityInCart.value=0;


    }
    else{
      print("KKKKKKKKKKKKKK");
        productQuantityInCart.value=getProductQuantityInCart(product.id.toString());
        print("${productQuantityInCart.value}JJJJJJJJJJJJJJJJJJJj");

    }
    
    

  }

}


// Function convert  product model to cart model

CartItem convertToCartItem(Product product, int quantity){
  return CartItem(
    id: product.id.toString(), 
    quantity: quantity,
    name: product.name,
    price:double.parse(product.price),
    imageUrl: product.image,
  
    );
}

// Update Cart  Values
void updateCart(){
  updateCartTotals();
  saveCartItems();
  cartItems.refresh();
}

void updateCartTotals(){
  double calculatedTotalPrice=0.0;
  int calculatedNoOfItems=0;


  for(var item in cartItems){
     calculatedTotalPrice +=(item.price)*item.quantity.toDouble();
     calculatedNoOfItems+=item.quantity;
  }
  totalCartPrice.value=calculatedTotalPrice;
  noOfCartItems.value=calculatedNoOfItems;
}

void saveCartItems(){
  final cartItemStrings=cartItems.map((item)=>item.toJson()).toList();
  NLocalStorage.instance().writeData('cartItems', cartItemStrings);
}

void loadCartItems(){
  final cartItemStrings=NLocalStorage.instance().readData<List<dynamic>>('cartItems');
  if(cartItemStrings !=null){
    cartItems.assignAll(cartItemStrings.map((item)=>CartItem.fromJson(item as Map<String,dynamic>)));
    updateCartTotals();
  }
}

int getProductQuantityInCart(String productId){
  final foundItem=cartItems.where((item)=>item.id==productId).fold(0, (previousValue,element)=>previousValue + element.quantity);
  return foundItem;
}

// cart 23:55

void clearCart(){
  productQuantityInCart.value = 0;
  cartItems.clear();
  updateCart();
}
}