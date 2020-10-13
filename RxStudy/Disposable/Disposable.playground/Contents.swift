import UIKit
import RxSwift

let subscription1 =  Observable.from([1,2,3,])
    .subscribe(onNext: {elem in
        print("Next", elem)
        }
    , onError: {error in
        print("Error",error)
    }, onCompleted: {
        print("Completed")
    }, onDisposed: {
        print("Disposed")
    })


//Disposed 출력안됌, 모든 리소스가 제거되야 출력되는데? Observable이 호출되는 메소드가 아님. 그래서 출력이 안되는거.
var bag = DisposeBag()


Observable.from([1,2,3])
    .subscribe {
        print($0)
    }
    .disposed(by: bag)

//다시 한번 불러오면 알아서 해지됨.
bag = DisposeBag()

subscription1.dispose()
//dispose를 직접 호출하는 거보다 Disposebag을 호출



let subscription2 = Observable<Int>.interval(.seconds(1), scheduler: MainScheduler.instance)
    .subscribe(onNext: {elem in
        print("Next", elem)
        }
    , onError: {error in
        print("Error",error)
    }, onCompleted: {
        print("Completed")
    }, onDisposed: {
        print("Disposed")
    })

DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    //complete메소드 호출안됌. 이런경우는 피해야 됨. take until 사용하는 것이 좋음
    subscription2.dispose()
}
