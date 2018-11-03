//
//  ViewController.swift
//  ElementTableView
//
//  Created by Ani Adhikary on 18/11/17.
//  Copyright © 2017 Ani Adhikary. All rights reserved.
//
//  https://cocoacasts.com/how-to-add-pull-to-refresh-to-a-table-view-or-collection-view

import UIKit

class ElementViewController: UIViewController {

    @IBOutlet weak var elementTableView: UITableView!
    
    var elements = [Element]()
    //Step 1
    private let refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func loadElements() {
        elements = [
            Element(elementName: "Hydrogen", elementSymbol: "H"),
            Element(elementName: "Helium", elementSymbol: "He"),
            Element(elementName: "Lithium", elementSymbol: "Li"),
            Element(elementName: "Beryllium", elementSymbol: "Be"),
            Element(elementName: "Boron", elementSymbol: "B"),
            Element(elementName: "Carbon", elementSymbol: "C"),
            Element(elementName: "Nitrogen", elementSymbol: "N"),
            Element(elementName: "Oxygen", elementSymbol: "O"),
            Element(elementName: "Fluorine", elementSymbol: "F"),
            Element(elementName: "Neon", elementSymbol: "Ne"),
            Element(elementName: "Sodium", elementSymbol: "Na"),
            Element(elementName: "Magnesium", elementSymbol: "Mg"),
            Element(elementName: "Aluminum", elementSymbol: "Al"),
            Element(elementName: "Silicon", elementSymbol: "Si"),
            Element(elementName: "Phosphorus", elementSymbol: "P"),
            Element(elementName: "Sulfur", elementSymbol: "S"),
            Element(elementName: "Chlorine", elementSymbol: "Cl"),
            Element(elementName: "Argon", elementSymbol: "Ar"),
            Element(elementName: "Potassium", elementSymbol: "K"),
            Element(elementName: "Calcium", elementSymbol: "Ca"),
            Element(elementName: "Scandium", elementSymbol: "Sc")
        ]
    }
    
    func setupTableView() {
        elementTableView.dataSource = self
        elementTableView.register(UINib(nibName: "ElementTableViewCell", bundle: nil), forCellReuseIdentifier: "ElementCell")
        loadElements()
        
        //Step 2
        // Add Refresh Control to Table View
        if #available(iOS 10.0, *) {
            elementTableView.refreshControl = refreshControl
        } else {
            elementTableView.addSubview(refreshControl)
        }
        
        //Step 3
        // Configure Refresh Control
        refreshControl.addTarget(self, action: #selector(refreshElements(_:)), for: .valueChanged)
        
        //Additional Step 6
        //Customizing the Refresh Control
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        //refreshControl.attributedTitle = NSAttributedString(string: "Fetching Element Data ...", attributes: attributes)
    }
    
    //Step 4
    // Write the method for refreshing
    @objc private func refreshElements(_ sender: Any) {
        fetchElements()
    }
    
    //Step 5
    // End refreshing
    func fetchElements() {
        elements.insert(Element(elementName: "Titanium", elementSymbol: "Ti"), at: 0)
        elements.insert(Element(elementName: "Vanadium", elementSymbol: "V"), at: 1)
        elementTableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension ElementViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let elementCell = tableView.dequeueReusableCell(withIdentifier: "ElementCell", for: indexPath) as! ElementTableViewCell
        
        let element = elements[indexPath.row]
        elementCell.elementNameLabel.text = element.elementName
        elementCell.elementSymbolLabel.text = element.elementSymbol
        return elementCell
    }
}
