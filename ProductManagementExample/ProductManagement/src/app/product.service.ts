import { Injectable } from '@angular/core';
import { HttpClient, HttpParams } from '@angular/common/http';
import { Product } from './product';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProductService {

  products;
  apiBase = "/api/product";
  constructor(
    private httpClient: HttpClient
  ) { 
  }

  get(showDisabled = false): Observable<Product[]> {
    let params = new HttpParams();
    if (showDisabled) {
      params = params.append('showDisabled', 'true');
    }
    return this.httpClient.get<Product[]>(this.apiBase, {
      params: params
    });
  }

  getById(id): Observable<Product> {
    return this.httpClient.get<Product>(this.apiBase + `/${id}`);
  }

  create(product: Product) {
    return this.httpClient.post<Product>(this.apiBase, product);
  }

  update(product: Product) {
    return this.httpClient.put<Product>(this.apiBase, product);
  }

  delete(id) {
    return this.httpClient.delete(this.apiBase + `/${id}`);
  }
}
