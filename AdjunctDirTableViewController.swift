//
//  AdjunctDirTableViewController.swift
//  amsl_mobile_rough_v1
//
//  Created by Matthew Myers on 8/16/17.
//  Copyright © 2017 Ave Maria School of Law. All rights reserved.
//

import UIKit

class AdjunctDirTableViewController: UITableViewController, UISearchBarDelegate {

    // set url to where json data is read
    private final let urlString = "https://matmyers.github.io/amsl_mobile/mobileAppAdjunctDir.json"
    
    // store persons from json file in this array
    private var personArray = [Person]()
    
    // store persons from json file in this array, filtered by search
    private var filteredArray = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.downloadJsonWithURL()
        
        self.searchBarSetup()
    }
    
    func searchBarSetup() {
        let searchBar = UISearchBar(frame: CGRect(x:0,y:0,width:(UIScreen.main.bounds.width),height:70))
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["Name"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        self.tableView.tableHeaderView = searchBar
    }
    
    // MARK: - search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            personArray = filteredArray
            self.tableView.reloadData()
        }else {
            filterTableView(text: searchText)
        }
    }
    
    func filterTableView(text: String) {
        personArray = filteredArray.filter({ (mod) -> Bool in
            return mod.name.lowercased().contains(text.lowercased())
        })
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - table view data source
    
    // function that downloads and parses json data from github
    func downloadJsonWithURL() {
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                if let persons = jsonObj!.value(forKey: "persons") as? NSArray {
                    
                    var personToBeEdited = Person(name: "", job: "", phoneNumber: "", emailAddress: "")
                    
                    for person in persons{
                        
                        personToBeEdited = Person(name: "", job: "", phoneNumber: "", emailAddress: "")
                        
                        if let personDict = person as? NSDictionary {
                            if let name = personDict.value(forKey: "name") {
                                personToBeEdited?.name = name as! String
                            }
                            if let job = personDict.value(forKey: "job") {
                                personToBeEdited?.job = job as! String
                            }
                            if let phoneNumber = personDict.value(forKey: "phoneNumber") {
                                personToBeEdited?.phoneNumber = phoneNumber as? String
                            }
                            if let emailAddress = personDict.value(forKey: "emailAddress") {
                                personToBeEdited?.emailAddress = emailAddress as! String
                            }
                            
                            self.personArray.append(personToBeEdited!)
                            self.filteredArray.append(personToBeEdited!)
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    self.tableView.reloadData()
                })
            }
        }).resume()
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return personArray.count
    }
    
    // populates tableview cells with data from json file
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AdjunctDirectoryTableViewCell") as! AdjunctDirectoryTableViewCell
        
        cell.personName.text = personArray[indexPath.row].name
        cell.personJob.text = personArray[indexPath.row].job
        
        return cell
    }
    
    // sets height of tableview cell
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75;
    }
    
    // passes data for announcement to PersonViewController when user selects this cell
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "PersonViewController") as! PersonViewController
        
        vc.nameString = personArray[indexPath.row].name
        vc.jobString = personArray[indexPath.row].job
        vc.phoneString = personArray[indexPath.row].phoneNumber
        vc.emailString = personArray[indexPath.row].emailAddress
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
