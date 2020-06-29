//
//  NotificationScheduler.swift
//  ForestClone
//
//  Created by Christian Leovido on 18/06/2020.
//  Copyright © 2020 Christian Leovido. All rights reserved.
//

import Foundation
import UserNotifications

struct NotificationScheduler {

    let center = UNUserNotificationCenter.current()

    func createSuccessNotification(with seconds: Seconds,
                                   and id: String,
                                   semaphore: DispatchSemaphore = DispatchSemaphore(value: 0)) -> Result<Bool, Error> {

        var result: Result<Bool, Error>!

        // 1. Request authorization
        center.requestAuthorization(options: [.alert, .sound]) { _, error in
            if let error = error {
                print(error.localizedDescription)
            }
        }

        // 2. Create a notification content
        let content = UNMutableNotificationContent()

        content.title = "Session Success!"
        content.body = "You planted a new tree"

        // 3. Transform the Seconds into TimeInterval and create a new Date()
        let timeInterval = TimeInterval(seconds)

        let date = Date().addingTimeInterval(timeInterval)

        let dateComponents = Calendar.current.dateComponents(
            [.year, .month, .day, .hour, .minute, .second],
            from: date
        )

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)

        // 5. Create a Notification Request that will trigger after our focus session has finished.
        let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)

        center.add(request) { error in
            if let error = error {
                result = Result.failure(error)
                semaphore.signal()
            } else {
                result = Result.success(true)
                semaphore.signal()
            }
        }

        _ = semaphore.wait(wallTimeout: .distantFuture)

        return result

    }

    func cancelExistingNotification(id: String) {
        center.removePendingNotificationRequests(withIdentifiers: [id])
    }
}
