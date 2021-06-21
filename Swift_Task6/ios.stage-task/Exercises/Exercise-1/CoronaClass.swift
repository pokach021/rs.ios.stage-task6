import Foundation

class CoronaClass {
    
    var seats = [Int]()
    var seatsOnRow: Int
    
    
    
    init(n: Int) {
        self.seatsOnRow = n
    }
    
    func seat() -> Int {
        var val = 0
        var result = 0
        if seats.count < seatsOnRow && seats.count != 0 {
            if (seats[0] == 0 && seats.count == 1) || seats.last != seatsOnRow - 1 {
                result = seatsOnRow - 1
            } else {
                for index in 1 ..< seats.count {
                    if (seats[index] - seats[index - 1]) / 2 > val {
                        val = (seats[index] - seats[index - 1]) / 2
                        result = seats[index - 1] + val
                        
                    }
                }
            }
        }
        seats.append(result)
        seats.sort()
        return result
    }
    
    func leave(_ p: Int) {
        if let index = seats.firstIndex(of: p) {
            seats.remove(at: index)
        }
        
    }
}

