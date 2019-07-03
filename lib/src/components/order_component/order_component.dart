import 'package:RenoRun_AngularDart/src/models/order.dart';
import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'dart:core';

@Component(
	selector: 'order',
	templateUrl: 'order_component.html',
	styleUrls: ['order_component.css'],
	// providers: [ClassProvider(OrderService)],
	directives: [coreDirectives, formDirectives],
)

class OrderComponent implements OnInit{
  // productId value is set when the parents calls the selector with this [attrib]
  @Input() var productId;
  
  Order model = new Order.empty();

  bool validEmail;

  // List<String> colors = ["gold", "blue", "red"];
  String chosenColor;

  @override
  void ngOnInit() {
  }

  // function to see if the email field is empty or not
  void validateEmail(event) {
    String email = event.target.value;
    RegExp regex = new RegExp("^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]\$");

    if(regex.hasMatch(email)){
      validEmail = true;
    }
    else {
      validEmail = false;
    }
  }

  // function to change the colour chosen
  void updateColour(String colour) {
    print('Picked : $colour');
    model.colour = colour;
    chosenColor = colour;
  }

  // function when submitting the form
  void onSubmit(int productId) {
    model.productId = productId;
    print('onSubmit : $model');
    clearForm();
  }

  // function to clear the form after sending
  void clearForm() {
    model.email = "";
    model.colour = "";
    chosenColor = null;
    validEmail = false;
  }
}