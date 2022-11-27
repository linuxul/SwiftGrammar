import UIKit

// 24.프로토콜

class Device: NSObject {
    var modelName: String

    init(name: String) {
        modelName = name
    }
}


// 선택적으로 하고 싶을 경우 @objc

@objc protocol MediaPlayable {
    func play()
    func pause()
    func stop()

    @objc optional func nextMedia()
    @objc optional func prevMedia()
}

@objc protocol RemoteControllable: MediaPlayable {

    static var firmwareVersion: String { get }
    var isOn: Bool { get set }

    func on()
    func off()
    func volumeUp()
    func volumeDown()

    @objc optional func nextChannel()
    @objc optional func prevChannel()
}

protocol Repairable {
    func repair()
}

protocol AppleRepairable: Repairable {
    func checkAppleWarranty() -> Bool
}




@objc class DVDPlayer: Device, MediaPlayable, RemoteControllable {

    static var firmwareVersion: String {
        return "1.0"
    }

    var isOn: Bool {
        get {
            return self.isOn
        }
        set {
            self.isOn = newValue
        }
    }

    func play() {
        print("DVDPlayer = \(#function)")
    }

    func pause() {
        print("DVDPlayer = \(#function)")
    }

    func stop() {
        print("DVDPlayer = \(#function)")
    }

    func on() {
        print("DVDPlayer = \(#function)")
    }

    func off() {
        print("DVDPlayer = \(#function)")
    }

    func volumeUp() {
        print("DVDPlayer = \(#function)")
    }

    func volumeDown() {
        print("DVDPlayer = \(#function)")
    }

    func eject() {
        print("DVDPlayer = \(#function)")
    }

}


@objc class MP3Player: Device, MediaPlayable, Repairable {

    func play() {
        print("MP3Player = \(#function)")
    }

    func pause() {
        print("MP3Player = \(#function)")
    }

    func stop() {
        print("MP3Player = \(#function)")
    }

    func nextMedia() {
        print("MP3Player = \(#function)")
    }

    func prevMedia() {
        print("MP3Player = \(#function)")
    }

    func repair() {
        print("MP3Player = \(#function)")
    }
}


@objc class SmartTV: Device, RemoteControllable {

    static var firmwareVersion: String = "1.1"
    var isOn: Bool = false
    var volume = 0

    func play() {
        print("SmartTV = \(#function)")
    }

    func pause() {
        print("SmartTV = \(#function)")
    }

    func stop() {
        print("SmartTV = \(#function)")
    }

    func nextMedia() {
        print("SmartTV = \(#function)")
    }

    func prevMedia() {
        print("SmartTV = \(#function)")
    }

    func on() {
        print("SmartTV = \(#function)")
    }

    func off() {
        print("SmartTV = \(#function)")
    }

    func volumeUp() {
        volume = min(100, volume + 1)

        print("SmartTV = \(#function), volume = \(volume)")
    }

    func volumeDown() {
        volume = max(0, volume - 1)

        print("SmartTV = \(#function), volume = \(volume)")
    }

    func nextChannel() {
        print("SmartTV = \(#function)")
    }

    func prevChannel() {
        print("SmartTV = \(#function)")
    }
}


@objc class RemoteController: Device {
    var pairedDevice: RemoteControllable?
    static var firmwareVersion: String = "2.0"
    var isOn: Bool = false

    func play() {
        guard let paired = pairedDevice else {
            return
        }

        paired.play()
    }

    func pause() {
        guard let paired = pairedDevice else {
            return
        }

        paired.pause()
    }

    func stop() {
        guard let paired = pairedDevice else {
            return
        }

        paired.stop()
    }

    func nextMedia() {
        guard let paired = pairedDevice else {
            return
        }

        paired.nextMedia?()
    }

    func prevMedia() {
        guard let paired = pairedDevice else {
            return
        }

        paired.prevMedia?()
    }

    func on() {
        guard let paired = pairedDevice else {
            return
        }

        paired.on()
    }

    func off() {
        guard let paired = pairedDevice else {
            return
        }

        paired.off()
    }

    func volumeUp() {
        guard let paired = pairedDevice else {
            return
        }

        paired.volumeUp()
    }

    func volumeDown() {
        guard let paired = pairedDevice else {
            return
        }

        paired.volumeDown()
    }

    func nextChannel() {
        guard let paired = pairedDevice else {
            return
        }

        paired.nextChannel?()
    }

    func prevChannel() {
        guard let paired = pairedDevice else {
            return
        }

        paired.prevChannel?()
    }

    func pair(with device: RemoteControllable) -> Bool {
        pairedDevice = device
        return true
    }
}

class MacBook: Device, AppleRepairable {
    func repair() {
        print("MacBook = \(#function)")
    }

    func checkAppleWarranty() -> Bool {
        print("MacBook = \(#function)")
        return true
    }
}

class AppleMusicDevice: MP3Player, AppleRepairable {

    override func repair() {
        print("AppleMusicDevice = \(#function)")
    }

    func checkAppleWarranty() -> Bool {
        print("AppleMusicDevice = \(#function)")
        return true
    }
}

class AppleMediaDeviceCenter {

    func repair(device: MediaPlayable & AppleRepairable) -> Bool {
        if device.checkAppleWarranty() {
            device.repair()
            return true
        }

        return false
    }
}



let lgSmartTV = SmartTV(name: "LG 60LF6500")

if lgSmartTV is RemoteControllable {
    print("conforming to RemoteControllable")
} else {
    print("not conforming to RemoteControllable")
}


let nearDevices: [AnyObject] = [
    SmartTV(name: "LG 60FA"),
    MP3Player(name: "Apple iPod"),
    DVDPlayer(name: "SONY DVD")
]

for device in nearDevices {
    guard let _ = device as? RemoteControllable else {
        continue
    }

    if let device = device as? Device {
        print("model = \(device.modelName)")
    }
}

let magicRemote = RemoteController(name: "Magic Remote Controller")

var lgStartTV = SmartTV(name: "LG 60FA")
var iPod = MP3Player(name: "Apple iPod")
var sonyDVDPlayer = DVDPlayer(name: "SONY DVD")

if magicRemote.pair(with: lgSmartTV) {
    magicRemote.on()
    magicRemote.volumeUp()
    magicRemote.volumeUp()
    magicRemote.volumeDown()
    magicRemote.nextMedia()
    magicRemote.off()
} else {
    print("Paring Failed")
}

//if magicRemote.pair(with: iPod) {
//    magicRemote.on()
//    magicRemote.off()
//} else {
//    print("Paring Failed")
//}

if magicRemote.pair(with: sonyDVDPlayer) {
    magicRemote.on()
    magicRemote.play()
    magicRemote.nextChannel()
    magicRemote.stop()
    magicRemote.off()
} else {
    print("Paring Failed")
}


let repairCenter = AppleMediaDeviceCenter()

lgStartTV = SmartTV(name: "LG 60FA")
iPod = MP3Player(name: "Apple iPod")
sonyDVDPlayer = DVDPlayer(name: "SONY DVD")
var macBookPro = MacBook(name: "MacBook Pro")
var iPodNono = AppleMusicDevice(name: "iPod Nono")

//if repairCenter.repair(device: lgSmartTV) {
//    print("done")
//} else {
//    print("cannot repair")
//}

//if repairCenter.repair(device: sonyDVDPlayer) {
//    print("done")
//} else {
//    print("cannot repair")
//}
//
//if repairCenter.repair(device: macBookPro) {
//    print("done")
//} else {
//    print("cannot repair")
//}

if repairCenter.repair(device: iPodNono) {
    print("done")
} else {
    print("cannot repair")
}

