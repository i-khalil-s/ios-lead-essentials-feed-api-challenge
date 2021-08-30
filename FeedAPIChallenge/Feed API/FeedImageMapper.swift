//
//  FeedImageMapper.swift
//  FeedAPIChallenge
//
//  Created by Sergio Khalil Bello Garcia on 30/08/21.
//  Copyright © 2021 Essential Developer Ltd. All rights reserved.
//

import Foundation

internal final class FeedImageMapper {
	internal struct Root: Decodable {
		let images: [Image]
	}

	internal struct Image: Decodable {
		let image_id: UUID
		let image_desc, image_loc: String?
		let image_url: URL

		var feedImage: FeedImage {
			return FeedImage(id: image_id, description: image_desc, location: image_loc, url: image_url)
		}
	}

	internal static func map(_ data: Data) -> Root? {
		return try? JSONDecoder().decode(Root.self, from: data)
	}
}
