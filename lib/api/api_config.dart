class ApiConfig {
  static const String baseUrl = "https://fiber-starter.elginbrian.com/api/v1";

  // Auth Routes
  static const String register = "$baseUrl/auth/register";
  static const String login = "$baseUrl/auth/login";
  static const String refreshToken = "$baseUrl/auth/refresh-token";
  static const String currentUser = "$baseUrl/auth/current-user";
  static const String changePassword = "$baseUrl/auth/change-password";

  // User Routes
  static const String users = "$baseUrl/users";
  static String userById(String id) => "$baseUrl/users/$id";

  // Post Routes
  static const String posts = "$baseUrl/posts";
  static String postById(String id) => "$baseUrl/posts/$id";
  static String postsByUser(String userId) => "$baseUrl/posts/user/$userId";

  // Comment Routes
  static String commentsByPost(String postId) =>
      "$baseUrl/posts/$postId/comments";
  static String commentById(String postId, String commentId) =>
      "$baseUrl/posts/$postId/comments/$commentId";

  // Like Routes
  static String likePost(String postId) => "$baseUrl/posts/$postId/like";
  static String unlikePost(String postId) => "$baseUrl/posts/$postId/unlike";
  static String likesByPost(String postId) => "$baseUrl/posts/$postId/likes";
  static String likesByUser(String userId) => "$baseUrl/users/$userId/likes";

  // Search Routes
  static const String searchUsers = "$baseUrl/search/users";
  static const String searchPosts = "$baseUrl/search/posts";
}
