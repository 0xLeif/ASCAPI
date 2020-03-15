import Foundation
import OpenCombine

var bag = [AnyCancellable]()
let semaphore = DispatchSemaphore(value: 0)

print("Configure")

ASCAPI.instance.configure()

print("Fetch")

ASCAPI.instance.fetch(route: .apps)
    .value {
        print("\($0)")
        semaphore.signal()
}
.store(in: &bag)

print("Waiting...")

semaphore.wait()