//
//  ViewController.swift
//  StoryboardTesting
//
//  Created by Cynotecck on 17/04/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var loading: UIActivityIndicatorView!
    let ViewModel : ProductViewModel = ProductViewModel()
    @IBOutlet weak var imageCollectionView: UICollectionView!
    var images: [UIImage?] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        loading.startAnimating()
        ViewModel.fetchDataAndUpdate {
            print(self.ViewModel.ProductImages)
            self.downloadImage()
         
        }
    }
    func downloadImage(){
        ViewModel.downloadImages { image in
            self.images = image
            DispatchQueue.main.async {
                print(self.images)
                           self.imageCollectionView.reloadData()
                self.loading.stopAnimating()
                self.loading.hidesWhenStopped = true
                       }
        }
        
    }


}
extension ViewController : UICollectionViewDelegateFlowLayout , UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(images)
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageViewCell
        cell.imageView.image = images[indexPath.row]
        cell.lbl.text = ViewModel.productLbl[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
          let spacingBetweenItems: CGFloat = 10
      
          
          let totalSpacing = spacingBetweenItems * 3 
     
          let itemWidth = (collectionViewWidth - totalSpacing) / 2 
       
          
          return CGSize(width: itemWidth, height: itemWidth)
    }

    
    
}



