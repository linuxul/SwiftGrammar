import UIKit

// Sendable
// 값을 복사하여 동시성 도메인 간에 안전하게 전달할 수 있는 형식입니다.
// 작업 (Tasks) 와 행위자 (actors) 는 프로그램을 동시에 안전하게 실행할 수 있는 조각으로 나눌 수 있습니다.

// protocol Sendable



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

extension TemperatureLogger {
    func update(with measurement: Int) {
        measurements.append(measurement)
        if measurement > max {
            max = measurement
        }
    }
}

struct TemperatureReading: Sendable {
    var measurement: Int
}


extension TemperatureLogger {
    func addReading(from reading: TemperatureReading)  {
        measurements.append(reading.measurement)
    }
}

let logger = TemperatureLogger(label: "Tea kettle", measurement: 85)
let reading = TemperatureReading(measurement: 45)
logger.addReading(from: reading)



