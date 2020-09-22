function rSigma(num) {
    if(num > 0) {
        return rSigma(num-1) + num;
    }
    return 0
}

console.log(rSigma(5))


function rFact(num) {
    if(num > 1) {
        return rFact(num-1) * num;
    }
    return 1
}

console.log(rFact(6))