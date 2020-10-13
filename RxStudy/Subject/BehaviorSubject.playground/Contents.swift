import UIKit
import RxSwift

let disposeBag = DisposeBag()

enum MyError : Error {
    case error
}

//BehaviorSubject
//가장 최근의 넥스트 이벤트 하나를 저장했다가 새로운 구독자로 전달함. 최신 이벤트를 제외한 모든 이벤트는 사라진다.

let p = PublishSubject<Int>()
p.subscribe {
    print("PublishSubject >>", $0)
    
}
.disposed(by: disposeBag)
//하나의 값을 전달해야 함. type Parameter가 Int기 때문에 -> 0 전달
let b = BehaviorSubject<Int>(value: 0)
//내부에 next event가 추가 됨.

b.subscribe {
    print("BehaviorSubject >>", $0)
}
.disposed(by: disposeBag)

//next event 바로 전달
b.onNext(1)

//새로운 옵저버 추가
b.subscribe {
    print("BehaviorSubject >>2", $0)
}
b.onCompleted()

//complete되었기 떄문에 next event 전달 안됌.
b.subscribe {
    print("BehaviorSubject >>3", $0)
}
