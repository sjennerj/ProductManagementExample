import { Component, OnInit } from '@angular/core';
import { ProductService } from '../product.service';

@Component({
  selector: 'app-product-list',
  templateUrl: './product-list.component.html',
  styleUrls: ['./product-list.component.css']
})
export class ProductListComponent implements OnInit {

  products;
  showArchived = false;
  constructor(
    private productService: ProductService
  ) { }

  ngOnInit() {
    this.products = this.productService.get(this.showArchived);
  }
}
