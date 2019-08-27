import { Component, OnInit } from '@angular/core';
import { Location } from '@angular/common';
import { ProductService } from '../product.service';
import { Product } from '../product'

@Component({
  selector: 'app-product-new',
  templateUrl: './product-new.component.html',
  styleUrls: ['./product-new.component.css']
})
export class ProductNewComponent implements OnInit {
  product: Product;
  constructor(
    private productService: ProductService,
    private location: Location
  ) { 
    this.product = new Product();
  }

  ngOnInit() {
  }

  save(product: Product) {
    console.log('save');
    console.log(product);
    this.productService.create(product).subscribe(x => this.goBack());
  }
  goBack() {
    this.location.back();
  }
}
