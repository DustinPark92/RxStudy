import UIKit
import RxSwift

// #1 Create 연산자 이용

let o1 = Observable<Int>.create { (observer) -> Disposable in
    observer.on(.next(0))
    observer.onNext(1)
    
    observer.onCompleted()
    
    return Disposables.create()
   
}
// #1.1
o1.subscribe {
    //observer
    print("==Start==")
    print($0)
    if let elem = $0.element {
        print(elem)
    }
    print("== End ==")
}

print("------------------------")
//# 1.2
o1.subscribe(onNext: { elem in
    print(elem)
}
)



// #2 Create 말고 다른 연산자를 이용

//from 순서대로 방출되는 연산자
Observable.from([1, 2, 3])


//옵저는 두개의 이벤트를 동시에 전달하지 않는다
