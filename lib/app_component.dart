import 'package:RenoRun_AngularDart/src/components/product_component/product_component.dart';
import 'package:angular/angular.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  // add all of the components this file will be using
  directives: [ProductComponent],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
