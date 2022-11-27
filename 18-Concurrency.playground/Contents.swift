import UIKit

// 18.동시성 (Concurrency)

//func downloadPhoto(named: String, complete: @escaping (String) -> Void) {
//    print("named: = \(named)")
//    complete("title")
//}
//
//func show(title: String) {
//    print("title = \(title)")
//}
//
//
//// 비동기 함수 정의와 호출 (Defining and Calling Asynchronous Functions)
//func listPhotos(inGallery name: String) async -> [String] {
//    let result = ["test"] // ... some asynchronous networking code ...
//    return result
//}
//
//
//listPhotos(inGallery: "Summer Vacation") { photoNames in
//    let sortedNames = photoNames.sorted()
//    let name = sortedNames[0]
//    downloadPhoto(named: name) { photo in
//        show(photo)
//    }
//}


//func listPhotos(inGallery name: String) async -> [String] {
//    let result = // ... some asynchronous networking code ...
//    return result
//}

let photoNames = await listPhotos(inGallery: "Summer Vacation")
let sortedNames = photoNames.sorted()
let name = sortedNames[0]
let photo = await downloadPhoto(named: name)
show(photo)

let firstPhoto = await listPhotos(inGallery: "Summer Vacatioins")[0]
func move(_ photoName: String, from source: String, to destination: String) {
    add(photoName, to: destination)
    remove(photoName, from: source)
}

func listPhotos(inGallery name: String) async -> [String] {
     // await Task.sleep( .now() + 1.0)
    return ["image1", "image2"]
}


let firstPhoto = await downloadPhoto(named: photoName[0])
let secondPhoto = await downloadPhoto(named: photoName[1])
let thridPhoto = await downloadPhoto(named: photoName[2])

let photos = [firstPhoto, secondPhoto, thridPhoto]
show(photos)

async let firstPhoto = downloadPhoto(named: photoName[0])
async let secondPhoto = downloadPhoto(named: photoName[1])
async let thridPhoto = downloadPhoto(named: photoName[2])

let photos = await [firstPhoto, secondPhoto, thridPhoto]
show(photos)


/*
let photoNames = await listPhotos(inGallery: "Summer Vacation")
let sortedNames = photoNames.sorted()
let name = sortedNames[0]
let photo = await downloadPhoto(named: name)
show(photo)


let firstPhoto = await listPhotos(inGallery: "Summer Vacation")[0]
add(firstPhoto toGallery: "Road Trip")
// At this point, firstPhoto is temporarily in both galleries.
remove(firstPhoto fromGallery: "Summer Vacation")


func move(_ photoName: String, from source: String, to destination: String) {
    add(photoName, to: destination)
    remove(photoName, from: source)
}
// ...
let firstPhoto = await listPhotos(inGallery: "Summer Vacation")[0]
move(firstPhoto, from: "Summer Vacation", to: "Road Trip")


func listPhotos(inGallery name: String) async throws -> [String] {
    try await Task.sleep(until: .now + .seconds(2), clock: .continuous)
    return ["IMG001", "IMG99", "IMG0404"]
}


// 비동기 시퀀스 (Asynchronous Sequences)
import Foundation

let handle = FileHandle.standardInput
for try await line in handle.bytes.lines {
    print(line)
}


// 비동기 함수 병렬로 호출 (Calling Asynchronous Functions in Parallel)
let firstPhoto = await downloadPhoto(named: photoNames[0])
let secondPhoto = await downloadPhoto(named: photoNames[1])
let thirdPhoto = await downloadPhoto(named: photoNames[2])

let photos = [firstPhoto, secondPhoto, thirdPhoto]
show(photos)


async let firstPhoto = downloadPhoto(named: photoNames[0])
async let secondPhoto = downloadPhoto(named: photoNames[1])
async let thirdPhoto = downloadPhoto(named: photoNames[2])

let photos = await [firstPhoto, secondPhoto, thirdPhoto]
show(photos)


// 작업과 작업 그룹 (Tasks and Task Groups)
await withTaskGroup(of: Data.self) { taskGroup in
    let photoNames = await listPhotos(inGallery: "Summer Vacation")
    for name in photoNames {
        taskGroup.addTask { await downloadPhoto(named: name) }
    }
}


// 구조화되지 않은 동시성 (Unstructured Concurrency)
let newPhoto = // ... some photo data ...
let handle = Task {
    return await add(newPhoto, toGalleryNamed: "Spring Adventures")
}
let result = await handle.value


// 행위자 (Actors)
actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int

    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}


let logger = TemperatureLogger(label: "Outdoors", measurement: 25)
print(await logger.max)
// Prints "25"


extension TemperatureLogger {
    func update(with measurement: Int) {
        measurements.append(measurement)
        if measurement > max {
            max = measurement
        }
    }
}


print(logger.max)  // Error


// 전송 가능 타입 (Sendable Types)
struct TemperatureReading: Sendable {
    var measurement: Int
}

extension TemperatureLogger {
    func addReading(from reading: TemperatureReading) {
        measurements.append(reading.measurement)
    }
}

let logger = TemperatureLogger(label: "Tea kettle", measurement: 85)
let reading = TemperatureReading(measurement: 45)
await logger.addReading(from: reading)


struct TemperatureReading {
    var measurement: Int
}
*/



























