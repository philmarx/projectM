	(function($) {
		/**
		 * 该插件依赖jquery和bootstrap3
		 * paginationSize为显示多少页
		 * totalPages为一共有多少页 
		 * pageSize为每页显示多少行
		 * handler为点击按钮触发的函数,该函数带两个参数,分别是pageNumber第几页从1开始,pageSize每页大小
		 */
		$.fn.pagination = function(paginationSize, totalPages, pageSize, handler) {
			var $ul = $(this);
			$ul.addClass('pagination');
			var $first1 = $('<li><a href="javascript:void(0)">&laquo;&laquo;</a></li>');
			var $first2 = $('<li><a href="javascript:void(0)">&laquo;</a></li>');
			var $last2 = $('<li><a href="javascript:void(0)">&raquo;</a></li>');
			var $last1 = $('<li><a href="javascript:void(0)">&raquo;&raquo;</a></li>');
			$first1.appendTo($ul);
			$first2.appendTo($ul);
			$last2.appendTo($ul);
			$last1.appendTo($ul);
			function initPagination(start, length) {
				start = start || 0;
				start = start < 0 ? 0 : start;
				length = length || 5;
				var end = parseInt(start) + parseInt(length);
				end = end <= totalPages ? end : totalPages;
				if (start < end) {
					$('.pageLi').replaceWith('');
					for (var i = start; i < end;) {
						$last2.before($('<li class="pageLi"><a href="javascript:void(0)">'
										+ (++i) + '</a></li>'));
						if (handler) {
							$last2.prev().unbind().on('click',function() {
								var pageNumber = parseInt($(this).children('a').html());
								handler(pageNumber, pageSize);
							});
						}
					}
				}
			}
			initPagination(0, paginationSize);
			$first1.unbind().click(function() {
				initPagination(0, paginationSize);
			});
			$last1.unbind().click(function() {
				var end = totalPages;
				var start = parseInt(end) - parseInt(paginationSize);
				start = start < 0 ? 0 : start;
				initPagination(start, paginationSize);
			});
			$first2.unbind().click(function() {
				var pageNumber = parseInt($(this).next().children('a').html());
				pageNumber -= paginationSize;
				initPagination(pageNumber - 1, paginationSize);
			});
			$last2.unbind().click(function() {
				var pageNumber = parseInt($(this).prev().children('a').html());
				initPagination(pageNumber, paginationSize);
			});
		
		};
	})(jQuery);