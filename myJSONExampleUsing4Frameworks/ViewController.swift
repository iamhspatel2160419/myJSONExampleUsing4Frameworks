//
//  ViewController.swift
//  myJSONExampleUsing4Frameworks
//
//  Created by hp ios on 2/21/18.
//  Copyright © 2018 andiosdev. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var dataSourceArray = [Actor]()

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        let apiCall = APIManager.mySingletone.fetchActorsFromAPI()
        let _ = apiCall.then
            {
            actors -> Void in
                self.dataSourceArray = actors
                self.tableView.reloadData()
            }.catch
            {
               error->Void in
                
            }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActorCell", for: indexPath) as! ActorCell
        cell.selectionStyle = .none
        cell.actorName.text = dataSourceArray[indexPath.row].name!
        cell.actorBirthDate.text = dataSourceArray[indexPath.row].dob!
        cell.actorCountry.text = dataSourceArray[indexPath.row].country!
        cell.actorHeight.text = "Height: \(dataSourceArray[indexPath.row].height!)"
        cell.actorDescription.text = dataSourceArray[indexPath.row].description!
        cell.actorSpouse.text = dataSourceArray[indexPath.row].spouse!
        cell.actorChildren.text = dataSourceArray[indexPath.row].children!
        
        let url = NSURL(string:dataSourceArray[indexPath.row].image!)
        
        cell.actorImageView.af_setImage(withURL: url! as URL,
                                        placeholderImage: UIImage(named:"placeholder"),
                                        filter: nil,
                                        imageTransition:.crossDissolve(0.5),
                                        runImageTransitionIfCached: true,
                                        completion: nil)
        return cell
        
    }
 


}

