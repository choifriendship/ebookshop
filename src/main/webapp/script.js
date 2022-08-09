function add(num) {
	document.getElementById("result").value += num
} // 값을 입력하는 함수

function solve() {
	let x = document.getElementById("result").value
	let y = eval(x)
	document.getElementById("result").value = y
} // 결과 값을 나타내는 함수

function res() {
	document.getElementById("result").value = ""
} // 전부 지우기