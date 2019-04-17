//
//  DetailViewController.swift
//  Proxy
//
//  Created by Artem Karmaz on 4/17/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/d/da/Internet2.jpg")!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadImage()

    }
    
    func loadImage() {
        let imageService = LoadImageService()
        let proxy = Proxy(service: imageService)
        proxy.loadImage(url: url) { [weak self] (data, response, error) in
            guard let self = self, let data = data, error == nil else { return }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
    }
    
    @IBAction func refreshButton(_ sender: UIButton) {
        cacheData = nil
        imageView.image = nil
        loadImage()
    }
    

}
