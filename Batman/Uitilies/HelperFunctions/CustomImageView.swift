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
            
            //We check if this urlstring exists in the Cache if it is equal to something i.e Exists in the Dictionary - We assign the image to the already
            //Downloaded one in our Cache and we return
    //        if let cachedImage = imageCache[urlstring] {
    //            //the image of the ImageView instantiating this Class
    //            self.image = cachedImage
    //            return
    //        }
            
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
                
                //We use the CacheDictionary and store this Image that is already downloaded and ready to be used
                //Note We use the url.absoluteString key in storing so we can use it in detecting not to run this Img session again
                imageCache[url.absoluteString] = photoImage
                
                //Wait for the whole App to be ready
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
                
                //We use the CacheDictionary and store this Image that is already downloaded and ready to be used
                //Note We use the url.absoluteString key in storing so we can use it in detecting not to run this Img session again
                imageCache[url.absoluteString] = photoImage?.tintImageColor(color: tintColor)
                
                //Wait for the whole App to be ready
                DispatchQueue.main.async {
                    //The UIImageView's image that is instantiang this Class is set to the loaded image from URL
                    self.image = photoImage?.tintImageColor(color: tintColor)
                }
                
                
                }.resume()
        }
}
