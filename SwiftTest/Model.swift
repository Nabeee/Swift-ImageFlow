

import UIKit

class Model: NSObject {
    var images : [UIImage] = []
    
    
    // Assemble an array of images to use for sample content for the collectionView
    func buildDataSource(){
        
        let image1 = UIImage(named: "Image1")
        let image2 = UIImage(named: "Image2")
        let image3 = UIImage(named: "Image3")
        let image4 = UIImage(named: "Image4")
        let image5 = UIImage(named: "Image5")
        let image6 = UIImage(named: "Image6")
        let image7 = UIImage(named: "Image7")
        
        images.append(image1!)
        images.append(image2!)
        images.append(image3!)
        images.append(image4!)
        images.append(image5!)
        images.append(image6!)
        images.append(image7!)
        
        
    }
}
