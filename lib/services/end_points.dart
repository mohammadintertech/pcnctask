import 'dart:math';

class EndPoints {
  static String base_url = "https://api.escuelajs.co/api/v1";

  static login() {
    return base_url + "/auth/login";
  }

  static refreshToken() {
    return base_url + "/auth/refresh-token";
  }

  static profile() {
    return base_url + "/auth/profile";
  }

  static signUp() {
    return base_url + "/users/";
  }

  static categories() {
    return base_url + "/categories";
  }

  static all_products() {
    return base_url + "/products";
  }

  static products_by_cat(id) {
    return base_url + "/products/?categoryId=$id";
  }

  static random_products() {
    Random random = Random();
    return base_url + "/products?offset=${random.nextInt(20)}&limit=4";
  }
}
