//
//  CustomImageView.swift
//  Batman
//
//  Created by Peter on 27/03/2021.
//

import UIKit


    var imageCache = [String:UIImage]()

    class CustomImageView: UIImageView {
        
        var lastURLUsedToLoadImage : String?
        
        
        func loadImage(urlstring : String) {
            
            lastURLUsedToLoadImage = urlstring
            
 
            
            guard let url = URL(string: urlstring) else {return}
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let err = error {
                    print("Failed to fetch image", err)
                    return
                }
                
                
                if (url.absoluteString != self.lastURLUsedToLoadImage){
                    return
                }
                
                
                //Picture Data Retrieved
                guard let imageData = data else { return }
                let photoImage = UIImage(data: imageData)
                
                // the CacheDictionary and store this Image that is already downloaded and ready to be used
                //Note We use the url.absoluteString key in storing so we can use it in detecting not to run this Img session again
                imageCache[url.absoluteString] = photoImage
                
             
                DispatchQueue.main.async {
                    //The UIImageView's image that is instantiang this Class is set to the loaded image from URL
                    self.image = photoImage
                }
                
                
                }.resume()
            
        }
        func loadImageWithTintColor(urlstring: String, tintColor: UIColor) {
            
            lastURLUsedToLoadImage = urlstring

            
            guard let url = URL(string: urlstring) else {return}
            
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                if let err = error {
                    print("Failed to fetch image", err)
                    return
                }
                
                if (url.absoluteString != self.lastURLUsedToLoadImage){
                    return
                }
                
                //Picture Data Retrieved
                guard let imageData = data else { return }
                let photoImage = UIImage(data: imageData)
                

                imageCache[url.absoluteString] = photoImage?.tintImageColor(color: tintColor)
                
              
                DispatchQueue.main.async {
                    //The UIImageView's image that is instantiang this Class is set to the loaded image from URL
                    self.image = photoImage?.tintImageColor(color: tintColor)
                }
                
                
                }.resume()
        }
}
