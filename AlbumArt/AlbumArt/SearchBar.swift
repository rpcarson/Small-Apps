//
//  SearchBar.swift
//  AlbumArt
//
//  Created by Reed Carson on 5/31/15.
//  Copyright (c) 2015 Reed Carson. All rights reserved.
//

import UIKit






class SearchBar: UISearchBar, UISearchBarDelegate {
    



    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
        println(searchBar.text)
        
    }


    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
        println("cancelled")
    }
    
}
