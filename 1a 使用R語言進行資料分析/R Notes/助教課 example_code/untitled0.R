# Fibonacci Number

#Return the n(th) value in sequence
fibonacci = function(n) {
    if (n==1 | n==2) {
        return(1)
    } else {
        return(fibonacci(n-2) + fibonacci(n-1))
    }
}

fibonacci(20)
for (i in 1:20) {
    print(fibonacci(i))
}



