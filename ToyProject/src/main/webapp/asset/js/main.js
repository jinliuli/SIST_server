//webapp > asset > js > main.js

//댓글 쓰기
$(document).ready(()=>{
	
	$('#btnAddComment').click(()=>{
		
		$.ajax({
			type: 'POST',
			url: '/toy/board/addcomment.do',
			data: {
				content: $('#addComment input[name=content]').val(),
				bseq: $('#view tr:nth-child(1) td:last-child').text()
			},
			dataType: 'json',
			success: function(result) {
				
				if (result.result == 1) {
					
					//alert('댓글 쓰기 성공!!');
					loadComment();
					$('#addComment input[name=content]').val('');
					
				} else {
					alert('댓글 쓰기 실패;;');
				}
				
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
		
	});//click
	
	
	//댓글 목록가져오기
	function loadComment() {
	
		//${lv};
		
		$.ajax({
			type: 'GET',
			url: '/toy/board/listcomment.do',
			data: {
				bseq: $('#view tr:nth-child(1) td:last-child').text()
			},
			dataType: 'json',
			success: function(list) {
				
				$('#comment tbody').html('');
				
				$(list).each((index, item)=>{
					
					let temp = `
					<tr data-seq="${item.seq}">
						<td>
							<div>${item.content}</div>
							<div>${item.regdate}</div>
						</td>
						<td>
							<div>
								<div>${item.name}(${item.id})</div>`;
					//익명사용자는 댓글 삭제/수정이 안보이도록 !!
					if (lv != 0 && (auth == item.id || lv == 2)) {
					temp += `<div>
									<span class="material-symbols-outlined" onclick="delComment(${item.seq});">delete</span>
									<span class="material-symbols-outlined" onclick="editComment(${item.seq});">edit_note</span>
								</div>`;
					}
					temp += `</div>
						</td>
					</tr>
					
					`;
					
					$('#comment tbody').append(temp);
				});
				
			},
			error: function(a,b,c) {
				console.log(a,b,c);
			}
		});
		
	}
	
	loadComment();
	
	
	//엔터치면 댓글쓰기
	$('#addComment input[name=content]').keydown((evt)=>{
		if (evt.keyCode == 13) {
			$('#btnAddComment').click();
		}
	});
	
});//ready




function delComment(cseq) {
	//alert(cseq);
	
	if (!confirm('정말 삭제하겠습니까?')) { return; }
	
	const tr = $(event.target).parent('tr');
	//alert(tr); //[object Object]
	//alert(tr[0].nodeName);
	
	$.ajax({
		type: 'POST',
		url: '/toy/board/delcomment.do',
		data: {
			cseq: cseq
		},
		dataType: 'json',
		success: function(result) {
			
			if (result.result == 1) {
				//alert('삭제 성공');
				//alert(event.target); //[object XMLHttpRequest] > ajax객체입니다
				tr.remove();
				
			} else {
				alert('댓글 삭제 실패 ㅠㅠ');
			}
			
		},
		error: function(a,b,c) {
			console.log(a,b,c);
		}
	});
	
}

function editComment(cseq) {
	
	//이전 눌렀던 수정 폼을 되돌리기
	$('#comment tbody tr').each((index, item)=>{
		if($(item).children().eq(0).children().eq(0).children().length) {
			const content = $(item).children().eq(0).children().eq(0).children().eq(0).val();
			$(item).children().eq(0).children().eq(0).html('');
			$(item).children().eq(0).children().eq(0).text(content);
		}
	});
	
	
	const div = $(event.target).parents('tr').children().eq(0).children().eq(0);
	const content = div.text();
	const seq = $(event.target).parents('tr').data('seq');
	div.html('');
	
	$('<input type="text" style="width: 535px;">')
		.val(content)
		.keydown((evt)=>{
			//alert(evt.keyCode); //ESC > 27
			
			if (evt.keyCode == 13) {
				
				const txt = evt.target;
				
				$.ajax({
					type: 'POST',
					url: '/toy/board/editcomment.do',
					data: {
						content: $(evt.target).val(),
						seq: seq
					},
					dataType: 'json',
					sucess: function(result) {
						
						if (result.result == 1) {
							let item = $(txt).parents('tr');
							
							const content = $(item).children().eq(0).children().eq(0).children().eq(0).val();
							$(item).children().eq(0).children().eq(0).html('');
							$(item).children().eq(0).children().eq(0).text(content);
						} else {
							alert('댓글 수정 실패;;')
						}
						
					},
					error: function(a,b,c){
						console.log(a,b,c);
					}
				});
				
			} else if (evt.keyCode == 27) {
				
				//수정누르고 포커스가 댓글에 가있을떄 ESC누르면 취소됨
				let item = $(evt.target).parents('tr');
								
				const content = $(item).children().eq(0).children().eq(0).children().eq(0).val();
				$(item).children().eq(0).children().eq(0).html('');
				$(item).children().eq(0).children().eq(0).text(content);
			}
			
		})
		.appendTo(div);
	
}

