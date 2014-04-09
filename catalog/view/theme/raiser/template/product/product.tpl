<?php echo $header; ?>
<div class="location-bar">
	<h1><?php echo $heading_title; ?></h1>
	<div class="breadcrumb">
		<?php foreach ($breadcrumbs as $breadcrumb) { ?>
		<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
		<?php } ?>
	</div>
</div>
	<?php echo $column_left; ?><?php echo $column_right; ?>
		<div id="content"><?php echo $content_top; ?>
			<div id="tabs" class="htabs">
				<a href="#tab-information">GENERAL INFO</a>
				<a href="#tab-description"><?php echo $tab_description; ?></a>
				<?php if ($attribute_groups) { ?>
					<a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
				<?php } ?>
				<?php if ($review_status) { ?>
					<a href="#tab-review"><?php echo $tab_review; ?></a>
				<?php } ?>
			</div>
			<div class="product-info">
				<div id="tab-information" class="tab-content">

					<div class="review">
						<div><img src="catalog/view/theme/raiser/image/stars-large-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" /><br /><a onclick="$('a[href=\'#tab-review\']').trigger('click');"><?php echo $reviews; ?></a>&nbsp;&nbsp;&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');"><i class="icon-pencil"></i><?php echo $text_write; ?></a></div>
						<div class="share">
						<!-- AddThis Button BEGIN -->
						<!--div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
						<script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script--> 
						<!-- AddThis Button END --> 
						</div>
					</div>
				
					<?php if ($thumb || $images) { ?>
					
						<div class="product-images">
							<?php if ($thumb) { ?>
								<div class="image"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" /></a></div>
							<?php } ?>
							<?php if ($images) { ?>
								<div class="image-additional">
									<?php foreach ($images as $image) { ?>
										<a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="colorbox" rel="colorbox"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a>
									<?php } ?>
								</div>
							<?php } ?>
						</div>
						
					<?php } ?>

					<div class="product-content">

						<?php if ($price) { ?>
						<div class="price">
							<?php if (!$special) { ?>
							<div class="price-regular"><?php echo $price; ?></div>
							<?php } else { ?>
							<span class="price-old"><?php echo $price; ?></span><br /> <span class="price-new"><?php echo $special; ?></span>
							<?php } ?>
							<?php if ($tax) { ?>
							<span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
							<?php } ?>
							<?php if ($points) { ?>
							<span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
							<?php } ?>
							<?php if ($discounts) { ?>
							<br />
							<div class="discount">
								<?php foreach ($discounts as $discount) { ?>
								<?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
								<?php } ?>
							</div>
							<?php } ?>
						</div>
						<?php } ?>

						<div class="description">
							<?php if ($manufacturer) { ?>
								<span class="dcolumn1"><?php echo $text_manufacturer; ?></span> <span class="dcolumn2"><a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a></span><br />
							<?php } ?>
								<span class="dcolumn1"><?php echo $text_model; ?></span> <span class="dcolumn2"><?php echo $model; ?></span><br />
							<?php if ($reward) { ?>
								<span class="dcolumn1"><?php echo $text_reward; ?></span> <span class="dcolumn2"><?php echo $reward; ?></span><br />
							<?php } ?>
								<span class="dcolumn1"><?php echo $text_stock; ?></span> <span class="dcolumn2"><?php echo $stock; ?></span>
						</div>

						<?php if ($options) { ?>
						<div class="options">
						<h2><span  class="heading-lines"><?php echo $text_option; ?></span></h2>
						<br />
						<?php foreach ($options as $option) { ?>
						<?php if ($option['type'] == 'select') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
							<?php if ($option['required']) { ?>
							<span class="required">*</span>
							<?php } ?>
							<b><?php echo $option['name']; ?>:</b><br />
							<select name="option[<?php echo $option['product_option_id']; ?>]">
							<option value=""><?php echo $text_select; ?></option>
							<?php foreach ($option['option_value'] as $option_value) { ?>
							<option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
							<?php if ($option_value['price']) { ?>
							(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
							<?php } ?>
							</option>
							<?php } ?>
							</select>
							</div>
							<br />
						<?php } ?>
						<?php if ($option['type'] == 'radio') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
							<?php if ($option['required']) { ?>
							<span class="required">*</span>
							<?php } ?>
							<b><?php echo $option['name']; ?>:</b><br />
							<?php foreach ($option['option_value'] as $option_value) { ?>
							<input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
							<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
							<?php if ($option_value['price']) { ?>
							(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
							<?php } ?>
							</label>
							<br />
							<?php } ?>
							</div>
							<br />
						<?php } ?>
						<?php if ($option['type'] == 'checkbox') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
							<?php if ($option['required']) { ?>
							<span class="required">*</span>
							<?php } ?>
							<b><?php echo $option['name']; ?>:</b><br />
							<?php foreach ($option['option_value'] as $option_value) { ?>
							<input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
							<label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
							<?php if ($option_value['price']) { ?>
							(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
							<?php } ?>
							</label>
							<br />
							<?php } ?>
							</div>
							<br />
						<?php } ?>
						<?php if ($option['type'] == 'image') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
							<?php if ($option['required']) { ?>
							<span class="required">*</span>
							<?php } ?>
							<b><?php echo $option['name']; ?>:</b><br />
							<table class="option-image">
							<?php foreach ($option['option_value'] as $option_value) { ?>
							<tr>
							  <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
							  <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
							  <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
								  <?php if ($option_value['price']) { ?>
								  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
								  <?php } ?>
								</label></td>
							</tr>
							<?php } ?>
							</table>
							</div>
							<br />
						<?php } ?>
						<?php if ($option['type'] == 'text') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
							<?php if ($option['required']) { ?>
							<span class="required">*</span>
							<?php } ?>
							<b><?php echo $option['name']; ?>:</b><br />
							<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
							</div>
							<br />
						<?php } ?>
						<?php if ($option['type'] == 'textarea') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
							<?php if ($option['required']) { ?>
							<span class="required">*</span>
							<?php } ?>
							<b><?php echo $option['name']; ?>:</b><br />
							<textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
							</div>
							<br />
						<?php } ?>
						<?php if ($option['type'] == 'file') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
							<?php if ($option['required']) { ?>
							<span class="required">*</span>
							<?php } ?>
							<b><?php echo $option['name']; ?>:</b><br />
							<input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="button">
							<input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
							</div>
							<br />
						<?php } ?>
						<?php if ($option['type'] == 'date') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
							<?php if ($option['required']) { ?>
							<span class="required">*</span>
							<?php } ?>
							<b><?php echo $option['name']; ?>:</b><br />
							<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
							</div>
							<br />
						<?php } ?>
						<?php if ($option['type'] == 'datetime') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
							<?php if ($option['required']) { ?>
							<span class="required">*</span>
							<?php } ?>
							<b><?php echo $option['name']; ?>:</b><br />
							<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
							</div>
							<br />
						<?php } ?>
						<?php if ($option['type'] == 'time') { ?>
							<div id="option-<?php echo $option['product_option_id']; ?>" class="option">
							<?php if ($option['required']) { ?>
							<span class="required">*</span>
							<?php } ?>
							<b><?php echo $option['name']; ?>:</b><br />
							<input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
							</div>
							<br />
						<?php } ?>
						<?php } ?>
						</div> <!-- END options -->
						<?php } ?>

						<div class="cart">
							<?php if ($minimum > 1) { ?>
							<div class="minimum"><?php echo $text_minimum; ?></div>
							<?php } ?>
							<input id="qty" type="text" name="quantity" size="2" value="<?php echo $minimum; ?>" class="qty-input"/>
							<input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
							<input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button button-large" />
							<div class="wishlist"><a onclick="addToWishList('<?php echo $product_id; ?>');" title="<?php echo $button_wishlist; ?>"><?php echo $button_wishlist; ?></a></div>
							<div class="compare"><a onclick="addToCompare('<?php echo $product_id; ?>');" title="<?php echo $button_compare; ?>"><?php echo $button_compare; ?></a></div>
						</div>

						<?php if ($tags) { ?>
						<div class="tags">
							<div><?php echo $text_tags; ?></div>
							<?php foreach ($tags as $tag) { ?>
							<a href="<?php echo $tag['href']; ?>">/ <?php echo $tag['tag']; ?></a>
							<?php } ?>
						</div>
						<?php } ?>

					</div> <!-- END product-content -->
				</div> <!-- END tab-information -->

				<div id="tab-description" class="tab-content"><?php echo $description; ?></div>
					<?php if ($attribute_groups) { ?>
					<div id="tab-attribute" class="tab-content">
						<table class="attribute">
						<?php foreach ($attribute_groups as $attribute_group) { ?>
						<thead>
							<tr>
							<td colspan="2"><?php echo $attribute_group['name']; ?></td>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($attribute_group['attribute'] as $attribute) { ?>
							<tr>
							<td><?php echo $attribute['name']; ?></td>
							<td><?php echo $attribute['text']; ?></td>
							</tr>
							<?php } ?>
						</tbody>
						<?php } ?>
						</table>
					</div> <!-- END tab-attribute -->
					<?php } ?>
				<?php if ($review_status) { ?>
				<div id="tab-review" class="tab-content">
					<div id="review"></div>
						<h2 id="review-title"><span class="heading-lines"><?php echo $text_write; ?></span></h2>
						<span class="text-styling"><?php echo $entry_name; ?></span><br /><br />
						<input type="text" name="name" value="" />
						<br />
						<br />
						<span class="text-styling"><?php echo $entry_review; ?></span><br /><br />
						<textarea name="text" cols="40" rows="8" style="width: 98%;"></textarea><br /><br />
						<span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
						<br />
						<span class="text-styling"><?php echo $entry_rating; ?></span><br /><br /><span><?php echo $entry_bad; ?></span>&nbsp;
						<input type="radio" name="rating" value="1" />
						&nbsp;
						<input type="radio" name="rating" value="2" />
						&nbsp;
						<input type="radio" name="rating" value="3" />
						&nbsp;
						<input type="radio" name="rating" value="4" />
						&nbsp;
						<input type="radio" name="rating" value="5" />
						&nbsp;<span><?php echo $entry_good; ?></span><br />
						<br />
						<br />
						<span class="text-styling"><?php echo $entry_captcha; ?></span><br /><br />
						<input type="text" name="captcha" value="" />
						<br />
						<br />
						<img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
						<br />
							<div class="buttons">
								<div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
							</div>
				</div> <!-- END tab-review -->
			</div> <!-- END product-info -->
			<?php } ?>
			<?php if ($products) { ?>
			<div class="related-product"><span><?php echo $tab_related; ?></span></div>
				<div id="tab-related">
					<div class="related-product-wrapper">
					<div class="box-product">
						<?php foreach ($products as $product) { ?>
						<div>
							<?php if ($product['thumb']) { ?>
								<div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
							<?php } ?>
							<div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
							<?php if ($product['price']) { ?>
								<div class="price">
								<?php if (!$product['special']) { ?>
								<?php echo $product['price']; ?>
								<?php } else { ?>
								<span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
								<?php } ?>
								</div>
							<?php } ?>
							<div class="grid-hvrc">
								<div class="cl-area"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
								<div class="description"><?php echo $product['description']; ?></div>
								<div class="rating"><img src="catalog/view/theme/raiser/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
								<div class="cart">
									<a onclick="addToCart('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_cart; ?>"><i class="icon-shopping-cart"></i></a>
								</div>
								<div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_wishlist; ?>"><i class="icon-heart"></i></a></div>
								<div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_compare; ?>"><i class="icon-pushpin"></i></a></div>
							</div> <!-- END grid-hvrc -->
						</div> <!-- END div -->
						<?php } ?>
					</div> <!-- END box-product -->
					</div> <!-- END related-product-wrapper -->
				</div> <!-- END tab-related -->
			<?php } ?>
		</div> <!-- END content -->
	<?php echo $content_bottom; ?>
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.5
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').bind('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			} 
			
			if (json['success']) {
				$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/raiser/image/remove-small.png" alt="" class="close" /></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				
				setTimeout(function() {
					$('.success').fadeOut('slow');
				}, 5000);
			}	
		}
	});
});
//--></script>
<script type="text/javascript">
$(function() {
    $('select.styled').customStyle();
});
</script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/raiser/image/loading.gif" class="loading" style="padding-left: 5px;" />');
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
	},
	onComplete: function(file, json) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
		
		$('.error').remove();
		
		if (json['success']) {
			alert(json['success']);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
		}
		
		if (json['error']) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json['error'] + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').fadeOut('slow');
		
	$('#review').load(this.href);
	
	$('#review').fadeIn('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/raiser/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data['error']) {
				$('#review-title').after('<div class="warning">' + data['error'] + '</div>');
			}
			
			if (data['success']) {
				$('#review-title').after('<div class="success">' + data['success'] + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	if ($.browser.msie && $.browser.version == 6) {
		$('.date, .datetime, .time').bgIframe();
	}

	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
	$('.datetime').datetimepicker({
		dateFormat: 'yy-mm-dd',
		timeFormat: 'h:m'
	});
	$('.time').timepicker({timeFormat: 'h:m'});
});
//--></script> 
<?php echo $footer; ?>
