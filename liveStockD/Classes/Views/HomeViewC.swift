//
//  HomeViewC.swift
//  liveStockD
//
//  Created by Vinay Bharwani on 24/02/20.
//  Copyright © 2020 Vinay Bharwani. All rights reserved.
//

import UIKit

class HomeViewC: UIViewController,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var hamburgerIcon: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var sliders : SliderList?
    var products : ProductList?
    var magazines : MagazineList?
    var events : EventList?
    var news : NewsList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///Setting SWReveal Controller
        hamburgerIcon.target = self.revealViewController()
        hamburgerIcon.action = #selector(SWRevealViewController.revealToggle(_:))
        
        NetworkManager.shared.getSliders(completionHandler: { (sliders) in
            DispatchQueue.main.async { [unowned self] in
                self.sliders = sliders
                self.tableView.reloadData()
                
            }
        })
        NetworkManager.shared.getProducts(completionHandler: { (products) in
            DispatchQueue.main.async { [unowned self] in
                self.products = products
                self.tableView.reloadData()
                
            }
        })
        NetworkManager.shared.getMagazines(completionHandler: { (magazines) in
            DispatchQueue.main.async { [unowned self] in
                self.magazines = magazines
                self.tableView.reloadData()
                
            }
        })

//        items()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 82/255, green: 51/255, blue: 172/255, alpha: 1)
    }
//    func items(){
//        var item = [Any]()
//        item.append(1)
//        item.append("R")
//        item.forEach { (element) in
//            print(String(describing: type(of: element)))
//        }
//        print(item)
//    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0{
            return 185
        } else if indexPath.section == 1{
            return 255
        } else if indexPath.section == 2{
            return 255
        }
        else if indexPath.section == 3{
            return 255
        }
        else if indexPath.section == 4{
            return 255
        }
        return 50
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell =  tableView.dequeueReusableCell(withIdentifier: "sliderTbC", for: indexPath) as! SliderTbC
            if sliders != nil{
                cell.populateWithData(self.sliders!)
            }
            return cell
        } else if indexPath.section == 1{
            let cell =  tableView.dequeueReusableCell(withIdentifier: "productTbC", for: indexPath) as! ProductTbC
            if products != nil{
                cell.populateWithData(self.products!)
            }
            return cell
        }
        else if indexPath.section == 2{
            let cell =  tableView.dequeueReusableCell(withIdentifier: "magazineTbC", for: indexPath) as! MagazineTbC
            if magazines != nil{
                cell.populateWithData(self.magazines!)
            }
            return cell
        }
        else if indexPath.section == 4{
            let cell =  tableView.dequeueReusableCell(withIdentifier: "eventTbC", for: indexPath) as! EventTbC
            if events != nil{
                cell.populateWithData(self.events!)
            }
            return cell
        }
        else {
            let cell =  tableView.dequeueReusableCell(withIdentifier: "newsTbC", for: indexPath) as! NewsTbC
            if news != nil{
                cell.populateWithData(self.news!)
            }
            return cell
        }
        
//        else if indexPath.section == 3{
//            let cell =  tableView.dequeueReusableCell(withIdentifier: "productTbC", for: indexPath) as! ProductTbC
//            if products != nil{
//                cell.populateWithData(self.products!)
//            }
//            return cell
//        }
        return UITableViewCell()
    }
}

