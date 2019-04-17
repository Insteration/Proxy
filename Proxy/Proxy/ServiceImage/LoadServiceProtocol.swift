//
//  LoadServiceProtocol.swift
//  Proxy
//
//  Created by Artem Karmaz on 4/17/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import Foundation

protocol LoadServiceProtocol {
    func loadImage(url: URL, completion: @escaping(Data?, URLResponse?, Error?) -> ())
}
