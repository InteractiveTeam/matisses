	$(document).ready(function(){
		$('#image-selectbutton').click(function(e) {
			$('#image').trigger('click');
		});

		$('#image-name').click(function(e) {
			$('#image').trigger('click');
		});

		$('#image-name').on('dragenter', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});

		$('#image-name').on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
		});

		$('#image-name').on('drop', function(e) {
			e.preventDefault();
			var files = e.originalEvent.dataTransfer.files;
			$('#image')[0].files = files;
			$(this).val(files[0].name);
		});

		$('#image').change(function(e) {
			if ($(this)[0].files !== undefined)
			{
				var files = $(this)[0].files;
				var name  = '';

				$.each(files, function(index, value) {
					name += value.name+', ';
				});

				$('#image-name').val(name.slice(0, -2));
			}
			else // Internet Explorer 9 Compatibility
			{
				var name = $(this).val().split(/[\\/]/);
				$('#image-name').val(name[name.length-1]);
			}
		});

		if (typeof image_max_files !== 'undefined')
		{
			$('#image').closest('form').on('submit', function(e) {
				if ($('#image')[0].files.length > image_max_files) {
					e.preventDefault();
					alert('You can upload a maximum of  files');
				}
			});
		}
	});