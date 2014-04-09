<div class="box">
  <div class="box-heading"><span class="heading-lines"><?php echo $heading_title; ?></span></div>
  <div class="box-content">
    <div class="box-product">
      <?php foreach ($products as $product) { ?>
      <div>
        <?php if ($product['thumb']) { ?>
        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
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
      </div>
      <?php } ?>
    </div>
  </div>
</div>
