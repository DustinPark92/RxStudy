import UIKit
import RxSwift



let disposeBag = DisposeBag()

enum MyError : Error {
    case error
}

//subject로 이벤트가 전달 되면 즉시 전달. Async completed 가 전달되면, 마지막에 전달된 next 이벤트 하나를 구독자에게 전달한다.


let subject = AsyncSubject<Int>()

subject.subscribe {
    print($0)
}
.disposed(by: disposeBag)

subject.onNext(1)

subject.onNext(2)

subject.onNext(3)
//next이벤트가 전달 되지 않는다. 
subject.onError(MyError.error)
//
//subject.onCompleted()
