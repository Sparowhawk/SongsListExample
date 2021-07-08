//
//  ArtistViewController.swift
//  MusicList (iOS)
//
//  Created by Dylan Nienberg on 7/8/21.
//

import Foundation
import UIKit
import PureLayout

@objc protocol SearchDelegate: AnyObject {
    func artistNameToSearch(artistName:String)
}


class ArtistViewController: UIViewController, SearchDelegate {
    
    private let searchBarView:SearchBarView = SearchBarView(forAutoLayout: ())
    private let songsListView:SongsListView = SongsListView(forAutoLayout: ())
    var songsList:[[String:Any]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addViews()
    }
    
    private func addViews() {
        searchBarView.searchDelegate = self
        self.view.addSubview(searchBarView)
        searchBarView.autoPinEdge(toSuperviewSafeArea: .top)
        searchBarView.autoPinEdge(.left, to: .left, of: self.view, withOffset: 0)
        searchBarView.autoPinEdge(.right, to: .right, of: self.view, withOffset: 0)
        searchBarView.autoSetDimension(.height, toSize: 50)
        
        self.view.addSubview(songsListView)
        songsListView.autoPinEdge(.top, to: .bottom, of: searchBarView, withOffset: 0)
        songsListView.autoPinEdge(.left, to: .left, of: self.view, withOffset: 0)
        songsListView.autoPinEdge(.right, to: .right, of: self.view, withOffset: 0)
        songsListView.autoPinEdge(.bottom, to: .bottom, of: self.view, withOffset: 0)
    }
    
    func artistNameToSearch(artistName:String) {
        (UIApplication.shared.delegate as? AppDelegate)?.itunesAPISharedHandler.fetchArtistList(artistName: artistName, { (completed, songs) in
            if completed {
                print(songs)
                self.songsListView.songsList = songs
                self.songsListView.tableView.reloadData()
            }else{
                self.songsListView.songsList = [[:]]
                self.songsListView.tableView.reloadData()
            }
        })
    }
}
