//
//  SongsListTableView.swift
//  MusicList (iOS)
//
//  Created by Dylan Nienberg on 7/8/21.
//

import Foundation
import UIKit

class SongsListView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var songsList:[[String:Any]]?
    var tableView = UITableView(forAutoLayout: ())
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        setupTableView(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupTableView(frame: CGRect) {
        tableView.delegate = self
        tableView.dataSource = self
        self.addSubview(tableView)
        tableView.autoPinEdge(.top, to: .top, of: self, withOffset: 0)
        tableView.autoPinEdge(.left, to: .left, of: self, withOffset: 0)
        tableView.autoPinEdge(.right, to: .right, of: self, withOffset: 0)
        tableView.autoPinEdge(.bottom, to: .bottom, of: self, withOffset: 0)
        tableView.register(SongsTableViewCell.self, forCellReuseIdentifier: SongsTableViewCell.identifier)
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return songsList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:SongsTableViewCell.identifier, for: indexPath) as! SongsTableViewCell
        
        if let details = songsList?[indexPath.section] {
            cell.artistName.text = details["artistName"] as? String ?? ""
            cell.trackName.text = details["trackName"] as? String ?? ""
            cell.releaseDate.text = (UIApplication.shared.delegate as? AppDelegate)?.dateFormatter.convertDateFormatFromStartingFormatToEndingFormat(date:details["releaseDate"] as? String ?? "", startingFormat:"yyyy-MM-dd'T'HH:mm:ss'Z'", endingFormat:"MM-dd-yyyy")
            cell.primaryGenreName.text = details["primaryGenreName"] as? String ?? ""
            cell.trackPrice.text = "$\(String(format: "%.2f", details["trackPrice"] as? Double ?? 0.00))"
        }
        
        
        
        
        
        return cell
    }
}
