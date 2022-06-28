function idCheck(){ // join.jsp
	let id = join.id.value;
	let url = "idCheck.jsp?id=" +id;
	
	if(!id) {
		alert("아이디를 입력하세요");
	}
	window.open(url, "idCheck", "width=400, height=200"); // idCheck라는 임의의 이름으로 창이 열린다.
}

function joinCheck() { // join.jsp
	if(join.hidden_id.value=="0"){ // 중복체크를 위한 코드
		alert("중복체크를 진행해주세요");
		return false;
	}
}