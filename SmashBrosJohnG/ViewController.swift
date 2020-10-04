//
//  ViewController.swift
//  SmashBrosJohnG
//
//  Created by John Grasser on 10/2/20.
//  Copyright © 2020 John Grasser. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var smashTable: UITableView!
    
    
    let charArray = [["B", "Banjo Kazooie","Bayonetta","Bowser","Bowser Jr","Byleth"], ["C","Captain Falcon","Charizard","Chrom","Cloud","Corrin"], ["D","Daisy","Dark Pit","Dark Samus","Diddy Kong","Donkey Kong","Dr. Mario","Duck Hunt"],["F", "Falco","Fox"],["G","Ganondorf","Greninja"],["H","Hero"],["I","Ice Climbers","Ike","Incineroar","Inkling","Isabelle","Ivysaur"],["J","Jigglupuff","Joker"],["K", "Ken","King Dedede","King K. Rool","Kirby"],["L","Link","Little Mac","Lucario","Lucas","Lucina","Luigi"],["M","Mario","Marth","Mega Man","Metaknight","Mewtwo","Mii Brawler","Mii Gunner","Mii Swordfighter","Min Min","Mr. Game and Watch"],["N","Ness"],["O","Olimar"],["P","Pac-Man","Palutena","Peach","Pichu","Pikachu","Pirahna Plant","Pit"],["R","R.O.B.","Richter","Ridley","Robin","Rosalina & Luna","Roy","Ryu"],["S","Samus","Sheik","Shulk","Simon","Snake","Sonic","Squirtle"],["T","Terry Bogard","Toon Link"],["V","Villager"],["W","Wario","Wii Fit Trainer","Wolf"],["Y","Yoshi","Young Link"],["Z","Zelda","Zero Suit Samus"]]
    
    
    let indexArray = ["B","C","D","F","G","H","I","J","K","L","M","N","O","P","R","S","T","V","W","Y","Z"]
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        smashTable.dataSource = self
        smashTable.delegate = self
        smashTable.sectionIndexColor = UIColor.white
        smashTable.sectionIndexBackgroundColor = UIColor.black
        smashTable.sectionIndexTrackingBackgroundColor = UIColor.darkGray
       
        
        // Do any additional setup after loading the view.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return charArray[section].count - 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if(cell == nil)
        {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: cellID)
            
        }
        
        cell?.textLabel?.text = charArray[indexPath.section][indexPath.row + 1]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath:IndexPath)
    {
        let selectedItem = charArray[indexPath.section][indexPath.row + 1]
        let alert = UIAlertController(title: "Chosen Character:", message: "\(selectedItem)", preferredStyle: .alert)
        let okAction = UIAlertAction(title:"OK", style: .default, handler: {action -> Void in})
        
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return charArray.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        
        return charArray[section][0]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return indexArray
    }
}

