
class Products {
  double price ;
  String imgPath;
  String location;
  String name;
  
  Products({required this.imgPath, required this.name,required this.price , this.location = "Main branch"});
}

List screenDetelis = [
  Products(name : "product1",price: 15.58, imgPath: "assets/img/1.webp" , location: "adham store"),
  Products(name : "product2",price: 13.99, imgPath: "assets/img/2.webp"),
  Products(name : "product3",price: 18.60, imgPath: "assets/img/3.webp"),
  Products(name : "product4",price: 124.90, imgPath: "assets/img/4.webp"),
  Products(name : "product5",price: 124.94, imgPath: "assets/img/5.webp"),
  Products(name : "product6",price: 125.98, imgPath: "assets/img/6.webp"),
  Products(name : "product7",price: 129.91, imgPath: "assets/img/7.webp"),
  Products(name : "product8",price: 120.99, imgPath: "assets/img/8.webp"),
];