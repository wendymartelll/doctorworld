//
//  ViewController.swift
//  Mega
//
//  Created by Tope Abayomi on 10/11/2014.
//  Copyright (c) 2014 App Design Vault. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var viewLinks : [ViewInfo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
        viewLinks = [ViewInfo]()
        viewLinks.append(ViewInfo(title: "Doctor World", segue: "eCommerce", description: "Get a makeover vacation"))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // I did this
    func configureView(){
        // Changing the font and size of text
        if let navBarFont = UIFont (name: "HelveticaNeue-Thin", size: 20.00){
          let navBarAttributesDictionary: [NSObject:AnyObject]? = [ NSForegroundColorAttributeName:UIColor.whiteColor(),NSFontAttributeName: navBarFont
            ]
            navigationController?.navigationBar.titleTextAttributes = navBarAttributesDictionary
        }
      
    }
    //->

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewLinks.count;
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MetaCell") as! MetaCell
        
        let info = viewLinks[indexPath.row]
        cell.titleLabel.text = info.title
        cell.subtitleLabel.text = info.description
        
        return cell;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let info = viewLinks[indexPath.row]
        
        if(info.segue != "none"){
            let storyboard = UIStoryboard(name: info.segue, bundle: nil)
            let controller = storyboard.instantiateInitialViewController()as! UIViewController
            
            showViewController(controller, sender: self)

        }
    }
}

class ViewInfo {
    var title: String!
    var segue:  String!
    var description:  String!
    
    init(title: String, segue: String){
        self.title = title
        self.segue = segue
    }
    
    init(title: String, segue: String, description: String){
        self.title = title
        self.segue = segue
        self.description = description
    }
}

