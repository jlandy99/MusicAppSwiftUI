//
//  PlayerViewController.swift
//  MusicApp
//
//  Created by John Landy on 5/8/21.
//  Copyright © 2021 John Landy. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func appRemoteDisconnect() {
        print("disconnecting")
    }

    func appRemoteConnected() {
        print("connecting")
    }
}
