import 'package:shopping_app/features/home_page/model/product_model.dart';

class HomeState {
  final bool isProductLoading;
  final bool isCategoryLoading;
  final bool isBannerLoading;
  final bool isProductLoadingFailed;
  final bool isCategoryLoadingFailed;
  final bool isBannerLoadingFailed;
  final int? skip;
  final String username;
  final List<String> bannerImages;
  final List<String> categories;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<int> favoriteProductIds;
  final Map<int,int> productCartCount;
  // final List<>

  const HomeState({
    required this.isBannerLoadingFailed,
    required this.isProductLoadingFailed,
    required this.isCategoryLoadingFailed,
    required this.isBannerLoading,
    required this.isCategoryLoading,
    required this.isProductLoading,
    required this.username,
    required this.bannerImages,
    required this.categories,
    required this.products,
    required this.favoriteProductIds,
    required this.productCartCount,
    this.errorMessage,
    this.skip
  });

  factory HomeState.initial() {
    return const HomeState(
      isProductLoadingFailed: false,
      isBannerLoadingFailed: false,
      isCategoryLoadingFailed: false,
      isCategoryLoading: false,
      isBannerLoading: false,
      isProductLoading: false,
      skip:0,
      username: "",
      bannerImages: [],
      categories: [],
      products: [],
      favoriteProductIds: [1,4],
      productCartCount: {},
    );
  }

  HomeState copyWith({
    bool? isCategoryLoadingFailed,
    bool? isBannerLoadingFailed,
    bool? isProductLoadingFailed,
    bool? isCategoryLoading,
    bool? isProductLoading,
    bool? isBannerLoading,
    String? username,
    List<String>? bannerImages,
    List<String>? categories,
    List<ProductModel>? products,
    List<int>? favoriteProductIds,
    Map<int,int>? productCartCount,
    String? errorMessage,
    int? skip
  }) {
    return HomeState(
      isCategoryLoadingFailed: isCategoryLoadingFailed?? this.isCategoryLoadingFailed,
        isBannerLoadingFailed: isBannerLoadingFailed?? this.isBannerLoadingFailed,
        isProductLoadingFailed: isProductLoadingFailed?? this.isProductLoadingFailed,
      isProductLoading: isProductLoading ?? this.isProductLoading,
      isBannerLoading: isBannerLoading ?? this.isBannerLoading,
      isCategoryLoading: isCategoryLoading ?? this.isCategoryLoading,
      username: username ?? this.username,
      bannerImages: bannerImages ?? this.bannerImages,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      errorMessage: errorMessage,
      favoriteProductIds: favoriteProductIds??this.favoriteProductIds,
      productCartCount: productCartCount ??this.productCartCount,
      skip: this.skip
    );
  }
}
