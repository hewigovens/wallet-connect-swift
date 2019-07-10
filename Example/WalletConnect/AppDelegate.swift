// Copyright © 2017-2019 Trust Wallet.
//
// This file is part of Trust. The full Trust copyright notice, including
// terms governing use, modification, and redistribution, is contained in the
// file LICENSE at the root of the source code distribution tree.

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var rootViewController: WCSessionViewController? {
        return window?.rootViewController as? WCSessionViewController
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { (granted, error) in
            print("<== notification permission: \(granted)")
            if let error = error {
                print(error)
            }
        }
        return true
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        rootViewController?.applicationWillEnterForeground(application)
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        rootViewController?.applicationDidEnterBackground(application)
    }
}
