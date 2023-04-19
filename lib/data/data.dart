class Product {
  final String productName;
  final String productImageUrl;
  final String currentPrice;
  final String oldPrice;
  final bool isLiked;

  const Product({
    required this.productName,
    required this.productImageUrl,
    required this.currentPrice,
    required this.oldPrice,
    required this.isLiked,
  });
}

class Category {
  final String categoryName;
  final String productCount;
  final String thumbnailImage;

  const Category({
    required this.categoryName,
    required this.productCount,
    required this.thumbnailImage,
  });
}

// list of categories
final categories = [
  const Category(
    categoryName: "T-SHIRT",
    productCount: "240",
    thumbnailImage:
    "https://images.unsplash.com/photo-1576871337622-98d48d1cf531?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  ),
  const Category(
    categoryName: "SHOES",
    productCount: "120",
    thumbnailImage:
    "https://images.unsplash.com/photo-1595341888016-a392ef81b7de?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1179&q=80",
  ),
  const Category(
    categoryName: "HODDIE",
    productCount: "200",
    thumbnailImage:
    "https://images.unsplash.com/photo-1647771746277-eac927afab2c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
  ),
  const Category(
    categoryName: "JEANS",
    productCount: "240",
    thumbnailImage:
    "https://images.unsplash.com/photo-1576995853123-5a10305d93c0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
  ),
];

// list of products
final products = [
  const Product(
    productName: "Apple - iPhone 14 Pro",
    productImageUrl:
    "https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/iphone-14-pro-model-unselect-gallery-2-202209?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660753617559",
    currentPrice: "6999",
    oldPrice: "8000",
    isLiked: true,
  ),
  const Product(
    productName: "Apple - iPhone 13 Pro",
    productImageUrl:
    "https://www.iplace.com.br/ccstore/v1/images/?source=/file/v3072666941191469708/products/216250.00-apple-iphone-13-pro-512gb-azul-sierra-mlvu3bz-a.jpg&height=424&width=424&quality=0.9",
    currentPrice: "6000",
    oldPrice: "7000",
    isLiked: false,
  ),
  const Product(
    productName: "Apple - iPhone 12 Pro",
    productImageUrl:
    "https://carrefourbr.vtexassets.com/arquivos/ids/41870000-540-auto?v=637835759429070000&width=540&height=auto&aspect=true",
    currentPrice: "5000",
    oldPrice: "6000",
    isLiked: false,
  ),
  const Product(
    productName: "Apple - iPhone 11",
    productImageUrl:
    "https://carrefourbr.vtexassets.com/arquivos/ids/94712018/e94efcb349384be586a8a19422588e66.jpg?v=638088949482800000",
    currentPrice: "3500",
    oldPrice: "4000",
    isLiked: true,
  ),
  const Product(
    productName: "Console Xbox Series S",
    productImageUrl:
    "https://static.nagem.com.br/util/artefatos/produtos/m/n/920341670352537/525316_1.jpg",
    currentPrice: "3000",
    oldPrice: "2000",
    isLiked: false,
  ),
  const Product(
    productName: "Console Playstation 5",
    productImageUrl:
    "https://t.ctcdn.com.br/ZmNiqbLg1jVlxkL_-Wn3r8Ouq9Y=/fit-in/400x400/filters:format(webp):fill(transparent):watermark(wm/prd.png,-32p,center,1,none,15)/i413671.png",
    currentPrice: "5000",
    oldPrice: "4500",
    isLiked: true,
  ),
  const Product(
    productName: "Samsung - Galaxy S23 Ultra",
    productImageUrl:
    "https://http2.mlstatic.com/D_NQ_NP_804825-MLA53452227194_012023-O.jpg",
    currentPrice: "6000",
    oldPrice: "5000",
    isLiked: false,
  ),
  const Product(
    productName: "Samsung - Galaxy ZFold 4",
    productImageUrl:
    "https://image-us.samsung.com/us/smartphones/galaxy-z-fold4/configurator/02-Q4-burgundy-MB-720x720.jpg",
    currentPrice: "8000",
    oldPrice: "6000",
    isLiked: false,
  ),
  const Product(
    productName: "Apple - MacBook Pro M1",
    productImageUrl:
    "https://i.zst.com.br/thumbs/12/23/39/1272724388.jpg",
    currentPrice: "10000",
    oldPrice: "9000",
    isLiked: false,
  ),
  const Product(
    productName: "Dell - Alieanware",
    productImageUrl:
    "https://m.media-amazon.com/images/I/51BQ2IKGxdL._AC_SY450_.jpg",
    currentPrice: "12000",
    oldPrice: "11000",
    isLiked: true,
  ),
];
