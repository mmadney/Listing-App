import Foundation

struct Products: Codable {
    let results: [Product]
    let pagination: Pagination
}

// MARK: - Pagination

struct Pagination: Codable {
    let key: String?
}

// MARK: - Result

struct Product: Codable {
    let createdAt, price, name, uid: String
    let imageIDS: [String]
    let imageUrls, imageUrlsThumbnails: [String]

    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name, uid
        case imageIDS = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}

struct ProductModel: Identifiable, Hashable {
    let id = UUID()
    let createdAt, price, name, uid: String
    let imageIDS: [String]
    let imageUrls, imageUrlsThumbnails: [String]

    init(product: Product) {
        createdAt = product.createdAt
        price = product.price
        name = product.name
        uid = product.uid
        imageIDS = product.imageIDS
        imageUrls = product.imageUrls
        imageUrlsThumbnails = product.imageUrlsThumbnails
    }
}
