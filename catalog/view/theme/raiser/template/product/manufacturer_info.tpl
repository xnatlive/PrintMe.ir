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
  <?php if ($products) { ?>
  <div class="product-filter">
    <div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total"><?php echo $text_compare; ?></a></div>
    <div class="display"><span class="display-text"><?php echo $text_display; ?></span> <div class="list-view-active"><span class="list-text"><?php echo $text_list; ?></span></div><a onclick="display(\'grid\');"><div class="grid-view"><span class="grid-text"><?php echo $text_grid; ?></span></div></a></div>
    <div class="limit"><?php echo $text_limit; ?>
      <select class="styled" onchange="location = this.value;">
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <div class="sort"><?php echo $text_sort; ?>
      <select class="styled" onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>
  <div class="pagination"><?php echo $pagination; ?></div>
  <div class="product-list">
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
        <?php if ($product['tax']) { ?>
        <br />
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="grid-hvrc">
			<div class="cl-area"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
			<div class="description"><?php echo $product['description']; ?></div>
			<div class="rating"><img src="catalog/view/theme/raiser/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
			<div class="cart">
				<input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" />
				<a onclick="addToCart('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_cart; ?>"><i class="icon-shopping-cart"></i></a>
			</div>
			<div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_wishlist; ?>"><i class="icon-heart"></i></a></div>
			<div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" rel="tooltip" data-placement="top" data-original-title="<?php echo $button_compare; ?>"><i class="icon-pushpin"></i></a></div>
      </div> <!-- END grid-hvrc -->
    </div> <!-- END div -->
    <?php } ?>
  </div> <!-- END product-list -->
  <div class="pagination"><?php echo $pagination; ?></div>
  <?php } else { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php }?>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div').each(function(index, element) {
			html  = '<div class="right">';
			


			html += '</div>';			
			
			html += '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}

			var rating = $(element).find('.rating').html();
			
			html += '<div class="rating">' + rating + '</div>';

			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';

			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';

			html += '  <div class="cl-area">' + $(element).find('.cl-area').html() + '</div>';

			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
				
			html += '</div>';

						
			$(element).html(html);
		});		
		
		$('.display').html('<span class="display-text"><?php echo $text_display; ?></span> <div class="list-view-active"><span class="list-text"><?php echo $text_list; ?></span></div><a onclick="display(\'grid\');"><div class="grid-view"><span class="grid-text"><?php echo $text_grid; ?></span></div></a>');

		$(function() {
		    $("[rel=tooltip]").tooltip();
		});

		$.totalStorage('display', 'list'); 
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}

			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}

			html += '<div class="grid-hvrc">';
			
			html += '<div class="cl-area">' + $(element).find('.cl-area').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';

			var rating = $(element).find('.rating').html();
			
			html += '<div class="rating">' + rating + '</div>';

			html += '</div>';
			
			$(element).html(html);
		});	
					
		$('.display').html('<span class="display-text"><?php echo $text_display; ?></span> <a onclick="display(\'list\');"><div class="list-view"><span class="list-text"><?php echo $text_list; ?></span></div></a><div  class="grid-view-active"><span class="grid-text"><?php echo $text_grid; ?></span></div>');

		$(function() {
		    $("[rel=tooltip]").tooltip();
		});

		$.totalStorage('display', 'grid');
	}
}

$(function() {
    $('select.styled').customStyle();
});

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('grid');
}
//--></script> 
<?php echo $footer; ?>
