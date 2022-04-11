//
//  FeedViewController.swift
//  MaratBetProject
//
//  Created by Marat Giniyatov on 10.04.2022.
//

import UIKit

class FeedViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
       var service =  MatchListService()
        service.getMatches() { [weak self] result in
            switch result {
            case .success():
                print("Good")
            case .failure(_):
                print("error")
        }

        // Do any additional setup after loading the view.
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
}
