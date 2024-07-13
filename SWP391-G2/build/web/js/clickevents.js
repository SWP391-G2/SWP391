function confirmLogout(modalID) {
let modalElement = document.getElementById(modalID);
        let modal = `
<div class="modal-dialog modal-dialog-centered" role="document" style="text-align:center">
    <div class="modal-content" style="width:500px; margin: 0 auto">
      <div class="modal-header" style="font-size:28px;padding: 30px 0; font-weight: 600; margin: 0 auto"><div>Đăng xuất</div></div>
      <div class="modal-body" style="font-size: 16px; font-weight: 600; color: red" >Bạn có chắc chắn muốn đăng xuất tài khoản của mình ?</div>
        <div class="modal-footer" style="justify-content: center;">
            <div style="width:40%; background-color: white"><a style="background-color: white!important; color: black; border-color: black;" class="btn btn-primary btn-block" href="logout">Đăng xuất</a></div>
            <div style="width:40%"><button onclick="closeModal('${modalID}')" class="btn btn-primary btn-block">Hủy</button></div>
        </div>
    </div>
</div>`;
        modalElement.innerHTML = modal;
        modalElement.style.display = 'block';
}

function closeModal(modalID) {
let modalElement = document.getElementById(modalID);
        modalElement.style.display = 'none';
}

// Close the modal if the user clicks anywhere outside of it
window.onclick = function(event) {
const modal = document.getElementById('logoutModal');
        if (event.target == modal) {
modal.style.display = 'none';
}
}