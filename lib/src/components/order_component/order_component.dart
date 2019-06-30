import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'package:RenoRun_AngularDart/src/services/order_service.dart';

@Component(
	selector: 'order',
	templateUrl: 'order_component.html',
	styleUrls: ['order_component.css'],
	// providers: [ClassProvider(OrderService)],
	directives: [coreDirectives, formDirectives],
)

class OrderComponent {
  // OrderService orderService;
}