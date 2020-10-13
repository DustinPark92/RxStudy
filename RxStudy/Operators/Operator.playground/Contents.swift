import UIKit
import RxSwift

//oberable protocol
//생성,방출필터,여러 요소 합치기 => 연산자

let bag = DisposeBag()

//대부분의 연산자는 옵저버블 상에서 동작 새로운 옵저버블을 리턴, 옵저버블을 리턴하기때문에 두개이상의 연산자를 호출 할수 있음.

//take 처음 5개만
//filter
//순서에 주의해야 한다.

Observable.from([1,2,3,4,5,6,7,8])
    .take(5)
    //5까지
    .filter{
        $0.isMultiple(of: 2)
    }
    //짝수만
    .subscribe {
        print($0)
    }
    .disposed(by: bag)
