//
//  AppDelegate.swift
//  War Card Game
//
//  Created by David Christie on 19/10/2015.
//  Copyright © 2015 David Christie. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SkillzDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        Skillz.skillzInstance().initWithGameId("1387", forDelegate: self, withEnvironment: SkillzEnvironment.Sandbox);
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func tournamentWillBegin(gameParameters: [NSObject : AnyObject]!, withMatchInfo matchInfo: SKZMatchInfo!) {
        // This code is called when a pleyer starts a game in the Skillz portal.
        NSLog("Game Parameters : %@", gameParameters)
        NSLog("Now starting a game...")
    }
    
    func skillzWillExit() {
        // This code is called when exiting the Skillz portal back to the normal game
        NSLog("Skillz portal exited.")
    }
    
    func preferredSkillzInterfaceOrientation() -> SkillzOrientation {
        // The orientation mus be locked when using the Skillz portal
        // return SkillzOrientation.Portrait for portrait based applications
        // return SkillzOrientation.Landscape for landscape based applications
        return SkillzOrientation.Landscape
    }
    /*
    func application(application: UIApplication, supportedInterfaceOrientationsForWindow window: UIWindow?) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Landscape
    }
    */
    (NSUInteger) application
}

