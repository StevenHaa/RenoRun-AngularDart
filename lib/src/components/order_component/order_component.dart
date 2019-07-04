import 'package:RenoRun_AngularDart/src/models/order.dart';
import 'package:RenoRun_AngularDart/src/services/order_service.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'dart:core';

@Component(
	selector: 'order',
	templateUrl: 'order_component.html',
	styleUrls: ['order_component.css'],
	providers: [ClassProvider(OrderService)],
	directives: [coreDirectives, formDirectives],
)

class OrderComponent implements OnInit{
  // productId value is set when the parents calls the selector with this [attrib]
  @Input() var productId;
  
  OrderService orderService;

  Order model = new Order.empty();
  bool validEmail;
  String chosenColor;
  // List<String> colors = ["gold", "blue", "red"];
  String buttonText = "Send Order";
  bool sentOrder = false;

  OrderComponent(this.orderService);

  @override
  void ngOnInit() {
  }

  // function to see if the email field is empty or not
  void validateEmail(event) {
    String email = event.target.value;
    RegExp regex = new RegExp('^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]\$');

    if(regex.hasMatch(email)){
      validEmail = true;
    }
    else {
      validEmail = false;
    }
  }

  // function to change the color chosen
  void updatecolor(String color) {
    model.color = color;
    chosenColor = color;
  }

  // function when submitting the form
  void onSubmit(int productId) {
    model.productId = productId;
    postOrder(productId, model.email, model.color);
    changeButtonCss();
    clearForm();
  }

  // function to clear the form after sending
  void clearForm() {
    model.email = "";
    model.color = "";
    chosenColor = null;
    validEmail = false;
  }

  // function to send an order
  void postOrder(int productId, String email, String color){
    orderService.postOrder(productId, email, color);
  }

  // function to change the css of the send button after sending 
  Future<void> changeButtonCss() async{
    buttonText = "Order Sent!";
    sentOrder = true;
    
    await Future.delayed(const Duration(seconds: 1), (){
      //reset
      buttonText = "Send Order";
      sentOrder = false;
    });

  }
}