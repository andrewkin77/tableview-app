//
//  ViewController.swift
//  tableview-app
//
//  Created by Андрей Лебедев on 20.09.2020.
//

import UIKit

class CategoriesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var categoryTable: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryTable.dataSource = self
        categoryTable.delegate = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataService.instance.getCategories().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell") as? CategoryCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        } else {
            return CategoryCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = DataService.instance.getCategories()[indexPath.row]
        performSegue(withIdentifier: "ProductsVC", sender: category)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productsVC = segue.destination as? ProductsVC {
            let backBtn = UIBarButtonItem()
            backBtn.title = ""
            navigationItem.backBarButtonItem = backBtn
            assert(sender as? Category != nil) //will crash if sender is not of type category
            productsVC.initProducts(category: sender as! Category)
        }
    }
    

}

