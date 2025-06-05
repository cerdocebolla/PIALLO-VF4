#!/usr/bin/env swift

import Foundation

let projectPath = "/path/to/YourApp.xcodeproj"
let scheme = "YourAppScheme"
let simulatorID = "booted" // or get actual device ID
let bundleID = "com.yourcompany.YourApp" // Update with your app's bundle identifier

// Step 1: Build the app
print("🔨 Building the app...")
let buildProcess = Process()
buildProcess.launchPath = "/usr/bin/xcrun"
buildProcess.arguments = ["xcodebuild", "-scheme", scheme, "-project", projectPath, "-destination", "platform=iOS Simulator,name=iPhone 14", "build"]

let buildPipe = Pipe()
buildProcess.standardOutput = buildPipe
buildProcess.launch()
buildProcess.waitUntilExit()

if buildProcess.terminationStatus != 0 {
    print("❌ Build failed.")
    exit(1)
}

// Step 2: Install app to simulator
print("📲 Installing app to simulator...")
let installProcess = Process()
installProcess.launchPath = "/usr/bin/xcrun"
installProcess.arguments = ["simctl", "install", simulatorID, "./build/Build/Products/Debug-iphonesimulator/YourApp.app"]

installProcess.launch()
installProcess.waitUntilExit()

if installProcess.terminationStatus != 0 {
    print("❌ Install failed.")
    exit(1)
}

// Step 3: Launch app
print("🚀 Launching the app...")
let launchProcess = Process()
launchProcess.launchPath = "/usr/bin/xcrun"
launchProcess.arguments = ["simctl", "launch", simulatorID, bundleID]

launchProcess.launch()
launchProcess.waitUntilExit()

if launchProcess.terminationStatus == 0 {
    print("✅ App launched successfully.")
} else {
    print("❌ Failed to launch app.")
}