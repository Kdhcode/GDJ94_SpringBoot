console.log("product_comment.js");

const list = document.getElementById("list");
const commentAddBtn = document.getElementById("commentAdd");
const contents = document.getElementById("contents");
const closeBtn = document.getElementById("close");
const productNum = list.getAttribute("data-product-num");

const headers = { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8" };

let editMode = false;
let editingId = null;

commentList(1);

list.addEventListener("click", (e) => {
  const t = e.target;

  // 페이지네이션
  if (t.classList.contains("page-link")) {
    const p = t.getAttribute("data-pager-num") || "1";
    commentList(p);
    return;
  }

  // 삭제
  const delBtn = t.closest(".btn-delete-comment");
  if (delBtn) {
    const id = delBtn.getAttribute("data-id");
    if (id) deleteComment(id);
    return;
  }

  // 수정: 기존 모달 재사용
  const editBtn = t.closest(".btn-edit-comment");
  if (editBtn) {
    const id = editBtn.getAttribute("data-id");
    const text = editBtn.getAttribute("data-contents") || "";
    if (!id) return;

    editMode = true;
    editingId = id;
    contents.value = text;

    // 모달 타이틀/버튼 문구 변경
    const title = document.getElementById("commentModalLabel");
    if (title) title.textContent = "댓글 수정";
    commentAddBtn.textContent = "수정 저장";

    // Bootstrap 4: 모달 열기
    if (window.$) {
      $("#commentModal").modal("show");
    } else {
      document.getElementById("commentModal").classList.add("show"); // fallback
    }
  }
});

commentAddBtn.addEventListener("click", () => {
  const text = (contents.value || "").trim();
  if (!text) { alert("내용을 입력하세요."); return; }

  if (editMode && editingId) {
    // 수정: 서버가 DTO의 boardContents/boardNum을 받는 흐름으로 전송
    const body = new URLSearchParams({ boardNum: editingId, boardContents: text });
    fetch(`./commentUpdate`, { method: "POST", headers, body })
      .then(r => r.text())
      .then(txt => {
        if (Number(txt) > 0) {
          resetModal();
          commentList(1);
        } else {
          alert("수정 실패");
        }
      })
      .catch(console.error);
  } else {
    // 등록
    const body = new URLSearchParams({ productNum, boardContents: text });
    fetch(`./commentAdd`, { method: "POST", headers, body })
      .then(r => r.text())
      .then(txt => {
        if (Number(txt) > 0) {
          resetModal();
          commentList(1);
        } else {
          alert("등록 실패");
        }
      })
      .catch(console.error);
  }
});

function commentList(page) {
  fetch(`./commentList?productNum=${encodeURIComponent(productNum)}&page=${encodeURIComponent(page)}`)
    .then(r => r.text())
    .then(html => { list.innerHTML = html; })
    .catch(console.error);
}

function deleteComment(boardNum) {
  if (!confirm("삭제할까요?")) return;
  const body = new URLSearchParams({ boardNum });
  fetch(`./commentDelete`, { method: "POST", headers, body })
    .then(r => r.text())
    .then(txt => {
      if (Number(txt) > 0) commentList(1);
      else alert("삭제 실패");
    })
    .catch(console.error);
}

function resetModal() {
  editMode = false;
  editingId = null;
  contents.value = "";
  commentAddBtn.textContent = "댓글 등록";
  const title = document.getElementById("commentModalLabel");
  if (title) title.textContent = "댓글 등록";

  if (window.$) {
    $("#commentModal").modal("hide");
  } else {
    document.getElementById("commentModal").classList.remove("show");
  }
  closeBtn?.click();
}
