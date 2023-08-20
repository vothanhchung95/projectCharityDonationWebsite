/**
 * 
 */
$(document).ready(function() {
	$('#confirmDeleteMultiAccount').on(
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
	$('#confirmDeleteMultiAccount').on('hidden.bs.modal', function(e) {
		var form = $('#deleteForm');
		form.attr('action', form.attr('action').replace(/\?.*$/, ''));
		$(this).find('form').trigger('reset');
		$(this).find('.modal-body').empty();
	});

	
});

function handleDeleteAccount(url) {
	$('#confirmDeleteModalAccount').on('show.bs.modal', function(e) {
		var id = $(e.relatedTarget).data('id');
		$('#confirmDeleteAccountBtn').on('click', function() {
			
			window.location.href = url + id;
			
		});
	});
}

