/**
 * 
 */
$(document).ready(function() {
	$('#confirmDeleteMultiModal').on(
		'show.bs.modal',
		function(e) {
			var form = $('#deleteForm');
			var ids = form.find('input[name="ids"]:checked').map(
				function() {
					return $(this).val();
				}).get();
			form.attr('action', form.attr('action') + '?ids='
				+ ids.join('&ids='));
		});
	$('#confirmDeleteMultiModal').on('hidden.bs.modal', function(e) {
		var form = $('#deleteForm');
		form.attr('action', form.attr('action').replace(/\?.*$/, ''));
		$(this).find('form').trigger('reset');
		$(this).find('.modal-body').empty();
	});

	$('#confirmDeleteMultiBtn').on(
		'click',
		function() {
			var form = $('#deleteForm');
			var ids = form.find('input[name="ids"]:checked').map(
				function() {
					return $(this).val();
				}).get();
			if (ids.length === 0) {
				alert('Vui lòng chọn ít nhất một phần tử để xóa.');
				return;
			}

			$.ajax({
				url: form.attr('action'),
				type: 'GET',
				data: form.serialize(),
				success: function(data) {
					$('#confirmDeleteMultiModal').modal('hide');
					$('#deleteSuccessModal').modal('show');
					setTimeout(function() {
						location.reload();
					}, 2000);
				},
				error: function(xhr, textStatus, errorThrown) {
					alert('Lỗi khi xóa các phần tử đã chọn: '
						+ textStatus + ' ' + errorThrown);
				}
			});

		});
});

function handleDelete(url) {
	$('#confirmDeleteModal').on('show.bs.modal', function(e) {
		var id = $(e.relatedTarget).data('id');
		$('#confirmDeleteBtn').on('click', function() {
			// Gửi yêu cầu xóa đến server
			$.ajax({
				url: url + id,
				type: 'GET',
				success: function() {
					// Hiển thị modal thông báo xóa thành công
					$('#confirmDeleteModal').modal('hide');
					$('#deleteSuccessModal').modal('show');
					// Tải lại trang sau 2 giây
					setTimeout(function() {
						location.reload();
					}, 2000);
				},
				error: function() {
					// Hiển thị thông báo lỗi nếu xảy ra lỗi
					alert('Xóa không thành công');
				}
			});
		});
	});
}

