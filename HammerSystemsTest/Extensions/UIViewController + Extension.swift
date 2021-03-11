//
//  UIViewController + Extension.swift
//  HammerSystemsTest
//
//  Created by Angelina on 04.02.2021.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    func loadImageFromUrl(withUrl urlString : String, onDownloaded: ((UIImage)->Void)? = nil) {
        let url = URL(string: urlString)
        if url == nil {return}
        self.image = nil
        
        if let cachedImage = imageCache.object(forKey: urlString as NSString)  {
            self.image = cachedImage
            return
        }
        
        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            DispatchQueue.main.async {
                if let image = UIImage(data: data!) {
                    imageCache.setObject(image, forKey: urlString as NSString)
                    self.image = image
                    onDownloaded?(image)
                }
            }
        }).resume()
    }
}
