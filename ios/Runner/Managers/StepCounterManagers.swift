import Foundation
import CoreMotion
import Combine

class StepCounterManager {
    private let pedometer = CMPedometer()
    private var stepSubject = CurrentValueSubject<Int, Never>(0) // 최신 걸음 수만 유지
    private var isPedometerRunning = false

    // 걸음 수 데이터를 Publisher로 노출
    var stepPublisher: AnyPublisher<Int, Never> {
        return stepSubject.eraseToAnyPublisher()
    }

    //  걸음 수 가져오기
    func startStepCounting() {
        guard !isPedometerRunning, CMPedometer.isStepCountingAvailable() else { return }
        isPedometerRunning = true

        pedometer.startUpdates(from: Date()) { [weak self] (data, error) in
            guard let self = self, let stepData = data, error == nil else { return }
            let stepCount = stepData.numberOfSteps.intValue

            // 최신 값으로 덮어쓰기
            self.stepSubject.send(stepCount)
        }
    }

    // 만보기 중지
    func stopStepCounting() {
        guard isPedometerRunning else { return }
        pedometer.stopUpdates()
        isPedometerRunning = false
        stepSubject.send(completion: .finished)
    }
}
