import 'package:shopping_app/features/home_page/model/product_model.dart';
import 'package:shopping_app/features/main_screen/model/user_data_model.dart';

class HomeState {
  final bool isProductListLoading;
  final bool isCategoryListLoading;
  final bool isBannerLoading;
  final bool isProductListLoadingFailed;
  final bool isCategoryListLoadingFailed;
  final bool isBannerLoadingFailed;
  final int skip;
  final List<String> bannerImages;
  final List<ProductModel> products;
  final List<ProductModel>filteredProducts;
  final String? errorMessage;
  final ProductModel? currentProduct;
  final bool isCurrentProductDataLoading;
  final bool isUserDataLoading;
  final UserDataModel? userData;
  final String searchText;

  const HomeState({
    this.currentProduct,
    required this.isCurrentProductDataLoading,
    required this.isBannerLoadingFailed,
    required this.isProductListLoadingFailed,
    required this.isCategoryListLoadingFailed,
    required this.isBannerLoading,
    required this.isCategoryListLoading,
    required this.isProductListLoading,
    required this.bannerImages,
    required this.products,
    required this.isUserDataLoading,
    required this.userData,
    required this.filteredProducts,
    required this.searchText,
    this.errorMessage,
    required this.skip
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
      isUserDataLoading: true,
      skip:0,
      bannerImages: [],
      products: [],
      filteredProducts :[],
      userData: null,
      searchText:"",
    );
  }

  HomeState copyWith({
    String? searchText,
    bool? isCurrentProductDataLoading,
    bool? isCategoryListLoadingFailed,
    bool? isBannerLoadingFailed,
    bool? isProductListLoadingFailed,
    bool? isCategoryListLoading,
    bool? isProductListLoading,
    bool? isBannerLoading,
    bool? isUserDataLoading,
    UserDataModel? userData,
    List<String>? bannerImages,
    List<ProductModel>? products,
    List<ProductModel>? filteredProducts,
    String? errorMessage,
    ProductModel? currentProduct,
    int? skip
  }) {
    return HomeState(
        isCurrentProductDataLoading: isCurrentProductDataLoading ??
            this.isCurrentProductDataLoading,
        isCategoryListLoadingFailed: isCategoryListLoadingFailed ??
            this.isCategoryListLoadingFailed,
        isBannerLoadingFailed: isBannerLoadingFailed ??
            this.isBannerLoadingFailed,
        isProductListLoadingFailed: isProductListLoadingFailed ??
            this.isProductListLoadingFailed,
        isProductListLoading: isProductListLoading ?? this.isProductListLoading,
        isBannerLoading: isBannerLoading ?? this.isBannerLoading,
        isCategoryListLoading: isCategoryListLoading ??
            this.isCategoryListLoading,
        bannerImages: bannerImages ?? this.bannerImages,
        products: products ?? this.products,
        errorMessage: errorMessage,
        currentProduct: currentProduct ?? this.currentProduct,
        skip: skip ?? this.skip,
        isUserDataLoading: isUserDataLoading ?? this.isUserDataLoading,
        userData: userData ?? this.userData,
        filteredProducts:filteredProducts?? this.filteredProducts,
        searchText:searchText??this.searchText

    );
  }
}
