import { Component, OnInit, EventEmitter, Input, Output} from '@angular/core';
import { Product } from '../product';

@Component({
  selector: 'app-product-form',
  templateUrl: './product-form.component.html',
  styleUrls: ['./product-form.component.css']
})
export class ProductFormComponent implements OnInit {

  @Input() product: Product;
  @Output() validSubmit = new EventEmitter<Product>();
  @Output() goBack = new EventEmitter();
  @Output() delete = new EventEmitter<Product>();
  constructor() { }

  ngOnInit() {
  }

  onSubmit() {
    this.validSubmit .emit(this.product);
  }

  onExit() {
    this.goBack.emit();
  }

  onDelete() {
    this.delete.emit(this.product);
  }
}
