
jQuery("body").on("touchstart", function (e) {
	if (!jQuery(e.target).closest('#mobile-flyout').length) {
    	jQuery('.mobile-menu-active').trigger('touchstart');
    }
});