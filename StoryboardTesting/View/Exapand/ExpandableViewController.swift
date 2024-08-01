//
//  ExpandableViewController.swift
//  StoryboardTesting
//
//  Created by cyno on 26/04/24.
//

import UIKit

class ExpandableViewController: UIViewController {
    var selectedIndexPath : IndexPath? = nil
    var ViewModel = ProductViewModel()
    @IBOutlet weak var productTabl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
      
                productTabl.estimatedRowHeight = 65
        ViewModel.fetchImageApi { result  in
            switch result {
            case .success(_) :
                DispatchQueue.main.async {
                    self.productTabl.reloadData()
                }
                
            case .failure(_):
                break
            }
        }
    }
    

  

}

extension ExpandableViewController : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ViewModel.allProduct.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = productTabl.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExpandableViewCellTableViewCell
        cell.headerLbl.text = ViewModel.allProduct[indexPath.row].title
        cell.decLbl.text = ViewModel.allProduct[indexPath.row].description
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if selectedIndexPath == indexPath {
            selectedIndexPath = nil
        }
        else{
            selectedIndexPath = indexPath
        }
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == selectedIndexPath {
                    return UITableView.automaticDimension
                } else {
                    return 65
                }
    }
    
    
    
}
