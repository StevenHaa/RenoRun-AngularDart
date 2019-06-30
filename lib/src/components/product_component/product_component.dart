import 'package:RenoRun_AngularDart/src/models/product.dart';
import 'package:RenoRun_AngularDart/src/models/store.dart';
import 'package:RenoRun_AngularDart/src/services/product_service.dart';
import 'package:angular/angular.dart';

@Component(
	selector: 'product',
	templateUrl: 'product_component.html',
	styleUrls: ['product_component.css'],
	// add all services this component requires
	providers: [ClassProvider(ProductService)],
	directives: [coreDirectives],
)

class ProductComponent implements OnInit{
	Store store;
	List<Product> products;
	ProductService productService;

	ProductComponent(this.productService);

  	@override
  	void ngOnInit() {
    	fetchData();
	}
	
	void fetchData() async {
		store = await productService.fetchProductData();
		products = store.products;
	}
}