//
//  ViewController.swift
//  Home work#12
//
//  Created by Mac on 30.12.2021.
//  Copyright © 2021 Mac. All rights reserved.
//

import UIKit

import AlamofireImage

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var categorys = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://rickandmortyapi.com/api/character"
        
        if let url = URL(string: urlString) {
            if let data = try? Data(contentsOf: url) {
                parse(json: data)
            }
        }
    }
    func parse(json: Data) {
        let decoder = JSONDecoder()
        
        if let jsonCategorys = try? decoder.decode(Categorys.self, from: json) {
            categorys = jsonCategorys.results
            tableView.reloadData()
        }
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categorys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell {
        let category = categorys[indexPath.row]
        cell.nameLabel?.text = category.name
        cell.statusLabel?.text = category.status
        cell.speciesLabel?.text = category.species
        cell.origin?.text = category.origin.name
        if category.status == "Alive" {
            cell.liveView.backgroundColor = .green
        }
        else if category.status == "Dead" {
            cell.liveView.backgroundColor = .red
        }
            else {
                cell.liveView.backgroundColor = .gray
            }
            
            if let url = URL(string: category.image) {
                cell.myImage.af_setImage(withURL: url)
            }
            return cell
        }
        return UITableViewCell()
        }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? SecondViewController {
            destination.cat = categorys[(tableView.indexPathForSelectedRow?.row)!]
        }
    }
}

