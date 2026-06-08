import 'package:shopping_app/features/home_page/model/product_model.dart';

class HomeState {
  final bool isProductListLoading;
  final bool isCategoryListLoading;
  final bool isBannerLoading;
  final bool isProductListLoadingFailed;
  final bool isCategoryListLoadingFailed;
  final bool isBannerLoadingFailed;
  final int? skip;
  final String username;
  final List<String> bannerImages;
  final List<String> categories;
  final List<ProductModel> products;
  final String? errorMessage;
  final List<int> favoriteProductIds;
  final Map<int,int> productCartCount;
  final ProductModel? currentProduct;
  final bool isCurrentProductDataLoading;
  // final List<>

  const HomeState({
    this.currentProduct,
    required this.isCurrentProductDataLoading,
    required this.isBannerLoadingFailed,
    required this.isProductListLoadingFailed,
    required this.isCategoryListLoadingFailed,
    required this.isBannerLoading,
    required this.isCategoryListLoading,
    required this.isProductListLoading,
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
      isCurrentProductDataLoading:false,
      isProductListLoadingFailed: false,
      isBannerLoadingFailed: false,
      isCategoryListLoadingFailed: false,
      isCategoryListLoading: false,
      isBannerLoading: false,
      isProductListLoading: false,
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
    bool? isCurrentProductDataLoading,
    bool? isCategoryListLoadingFailed,
    bool? isBannerLoadingFailed,
    bool? isProductListLoadingFailed,
    bool? isCategoryListLoading,
    bool? isProductListLoading,
    bool? isBannerLoading,
    String? username,
    List<String>? bannerImages,
    List<String>? categories,
    List<ProductModel>? products,
    List<int>? favoriteProductIds,
    Map<int,int>? productCartCount,
    String? errorMessage,
    ProductModel? currentProduct,
    int? skip
  }) {
    return HomeState(
        isCurrentProductDataLoading:isCurrentProductDataLoading??this.isCurrentProductDataLoading,
        isCategoryListLoadingFailed: isCategoryListLoadingFailed?? this.isCategoryListLoadingFailed,
        isBannerLoadingFailed: isBannerLoadingFailed?? this.isBannerLoadingFailed,
        isProductListLoadingFailed: isProductListLoadingFailed?? this.isProductListLoadingFailed,
        isProductListLoading: isProductListLoading ?? this.isProductListLoading,
      isBannerLoading: isBannerLoading ?? this.isBannerLoading,
      isCategoryListLoading: isCategoryListLoading ?? this.isCategoryListLoading,
      username: username ?? this.username,
      bannerImages: bannerImages ?? this.bannerImages,
      categories: categories ?? this.categories,
      products: products ?? this.products,
      errorMessage: errorMessage,
      favoriteProductIds: favoriteProductIds ?? this.favoriteProductIds,
      productCartCount: productCartCount ?? this.productCartCount,
      currentProduct: currentProduct ?? this.currentProduct,
      skip: this.skip
    );
  }
}
