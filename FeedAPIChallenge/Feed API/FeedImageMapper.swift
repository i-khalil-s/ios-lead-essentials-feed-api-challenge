//
//  FeedImageMapper.swift
//  FeedAPIChallenge
//
//  Created by Sergio Khalil Bello Garcia on 30/08/21.
//  Copyright © 2021 Essential Developer Ltd. All rights reserved.
//

import Foundation

internal final class FeedImageMapper {
	private struct Root: Decodable {
		let images: [Image]
	}

	private struct Image: Decodable {
		let image_id: UUID
		let image_desc, image_loc: String?
		let image_url: URL

		var feedImage: FeedImage {
			return FeedImage(id: image_id, description: image_desc, location: image_loc, url: image_url)
		}
	}

	private static var HTTP_200_OK = 200

	internal static func map(_ data: Data, from response: HTTPURLResponse) -> FeedLoader.Result {
		guard response.statusCode == HTTP_200_OK, let _ = try? JSONDecoder().decode(Root.self, from: data) else {
			return .failure(RemoteFeedLoader.Error.invalidData)
		}

		return .failure(RemoteFeedLoader.Error.invalidData)
	}
}
