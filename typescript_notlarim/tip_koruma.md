# Tip Koruma

## typeof
 ```js
function printAll(strs: string | string[] | null) {
  if (typeof strs === "object") {
    for (const s of strs) {
 🚨 Object is possibly 'null'.
      console.log(s);
    }
  } else if (typeof strs === "string") {
    console.log(strs);
  } else {
    // do nothing
  }
}
 ```
## Type Narrowing
 ```js
 //bir değişkenin türünü daha dar bir alana indirgeme sürecidir
function foo(): string | number {
    return Math.random() < 0.5 ? "hello" : 42;
}

const result = foo();

if (typeof result === "string") {
    // result değişkeni artık sadece string türündedir
    console.log(result.toUpperCase()); // Güvenli bir şekilde çalışır
} else {
    console.log(result.toFixed()); // Güvenli bir şekilde çalışır
}
 ```