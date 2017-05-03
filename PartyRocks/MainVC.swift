//
//  ViewController.swift
//  PartyRocks
//
//  Created by Brian McAulay on 28/04/2017.
//  Copyright © 2017 Brian McAulay. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    var partyRocks = [PartyRock]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
        
        let p1 = PartyRock(imageURL: "https://i.ytimg.com/vi/-UEqvlTbGYE/maxresdefault.jpg", videoURL: "<iframe width=\"360\" height=\"200\" src=\"https://www.youtube.com/embed/pdafDj6Gki8\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Theme from the Deerhunter")
        let p2 = PartyRock(imageURL: "http://www.visitsoutheastengland.com/imageresizer/?image=%2Fdbimgs%2Fheader-events.jpg&action=FFHighPagesInside", videoURL: "<iframe width=\"360\" height=\"200\" src=\"https://www.youtube.com/embed/9G38iICHkRk\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Don't cry for me Argentina")
        let p3 = PartyRock(imageURL: "https://bootstrapzero.s3.eu-central-1.amazonaws.com/AsUlwN0LgH7sAc7XAz.jpg", videoURL: "<iframe width=\"360\" height=\"200\" src=\"https://www.youtube.com/embed/Mb3iPP-tHdA\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Whiter Shade of Pale")
        let p4 = PartyRock(imageURL: "http://www.chemistryviews.org/common/images/thumbnails/source/15597aff00a.jpg", videoURL: "<iframe width=\"360\" height=\"200\" src=\"https://www.youtube.com/embed/mrd7WYPvF70\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "I Want To KNow What Love Is")
        let p5 = PartyRock(imageURL: "http://cdn1.fast-serve.net/cdn/ohsewsimple/FREE-Tinsel-Spring-Lamb-Pattern_700_600_84CUH.jpg", videoURL: "<iframe width=\"360\" height=\"200\" src=\"https://www.youtube.com/embed/5N0dQfPxrno\" frameborder=\"0\" allowfullscreen></iframe>", videoTitle: "Halleluja")
        partyRocks.append(p1)
        partyRocks.append(p2)
        partyRocks.append(p3)
        partyRocks.append(p4)
        partyRocks.append(p5)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return partyRocks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PartyCell", for: indexPath) as? PartyCell{
            //Redundant cell found so use this one to show the new data
            let partyRock = partyRocks[indexPath.row]
            cell.updateUI(partyRock: partyRock)
            return cell
        }
        else{
            //No spare table cell found so create a new one
            return UITableViewCell()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? VideoVC{
            destination.partyRock = sender as! PartyRock
        }

    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "VideoVC", sender: partyRocks[indexPath.row])
    }
    
    
}

