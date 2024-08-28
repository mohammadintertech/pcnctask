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
}
