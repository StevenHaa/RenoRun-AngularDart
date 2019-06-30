import 'package:RenoRun_AngularDart/src/services/product_service.dart';
import 'package:angular/angular.dart';

@Component(
	selector: 'product',
	templateUrl: 'product_component.html',
	styleUrls: ['product_component.css'],
	// add all services this component requires
	providers: [ClassProvider(ProductService)]
)

class ProductComponent implements OnInit{
	ProductService productService;

	ProductComponent(this.productService);

  	@override
  	void ngOnInit() {
    	fetchData();
	}
	
	void fetchData() async {
		await productService.fetchProductData();
	}
}