import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { ProductService } from '../product.service';
import { Product } from '../product'

@Component({
  selector: 'app-product-edit',
  templateUrl: './product-edit.component.html',
  styleUrls: ['./product-edit.component.css']
})
export class ProductEditComponent implements OnInit {
  product: Product;
  constructor(
    private route: ActivatedRoute,
    private productService: ProductService,
    private location: Location
  ) {
    
  }

  ngOnInit() {
    let productId = this.route.snapshot.paramMap.get("productId");
    this.productService.getById(productId)
      .subscribe(product => this.product = product);
  }

  save(product: Product) {
    this.productService.update(product).subscribe(x => this.goBack() );
  }

  delete(product: Product) {
    this.productService.delete(product.ID).subscribe(x => this.goBack() );
  }

  goBack() {
    this.location.back();
  }
}
