//
//  ViewController.swift
//  PhotoCollector
//
//  Created by David Groomes on 9/16/16.
//  Copyright © 2016 Arc Towers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var photos: [Photo] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
       photos =  try context.fetch(Photo.fetchRequest())
            print(photos)
            tableView.reloadData()
    } catch {
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let photo = photos[indexPath.row]
        cell.textLabel?.text = photo.title
        cell.imageView?.image = UIImage(data: photo.image as! Data)
        return cell
    }
}

