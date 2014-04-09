<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link href='http://fonts.googleapis.com/css?family=Oswald:400,700' rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=PT+Sans:400,700' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/raiser/stylesheet/stylesheet.css" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/theme/raiser/js/common.js"></script>
<script type="text/javascript" src="catalog/view/theme/raiser/js/custom.js"></script>
<script type="text/javascript" src="catalog/view/theme/raiser/js/bootstrap-tooltip.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/raiser/stylesheet/bootstrap-tooltip.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/raiser/stylesheet/font-awesome.css" />
<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/raiser/stylesheet/ie7.css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/raiser/stylesheet/font-awesome-ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/raiser/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->
<?php if ($stores) { ?>
<script type="text/javascript"><!--
$(document).ready(function() {
<?php foreach ($stores as $store) { ?>
$('body').prepend('<iframe src="<?php echo $store; ?>" style="display: none;"></iframe>');
<?php } ?>
});
//--></script>
<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body>
<div id="container">
<div id="header">
	<?php if ($logo) { ?>
	<div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
	<?php } ?>
	<div class="langcur">
		<?php echo $language; ?>
		<?php echo $currency; ?>
	</div>
	<div id="search">
		<div class="button-search"><i class="icon-search"></i></div>
    	<input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="<?php echo $search; ?>" />
	</div>
	<div id="welcome">
		<?php if (!$logged) { ?>
		<?php echo $text_welcome; ?>
		<?php } else { ?>
		<?php echo $text_logged; ?>
		<?php } ?>
	</div>
	<div class="links"><a href="<?php echo $wishlist; ?>" id="wishlist-total" alt="<?php echo $text_wishlist; ?>" rel="tooltip" data-placement="bottom" data-original-title="<?php echo $text_wishlist; ?>"><i class="icon-heart"></i></a><a href="<?php echo $account; ?>" alt="<?php echo $text_account; ?>" rel="tooltip" data-placement="bottom" data-original-title="<?php echo $text_account; ?>"><i class="icon-user"></i></a><a href="<?php echo $checkout; ?>" alt="<?php echo $text_checkout; ?>" rel="tooltip" data-placement="bottom" data-original-title="<?php echo $text_checkout; ?>"><i class="icon-circle-arrow-right"></i></a></div>
</div>
<?php if ($categories) { ?>
<div id="menu">
	<div class="home-icn">
		<a href="<?php echo $home; ?>"><i class="icon-home"></i></a>
	</div>
	<ul>
    <?php foreach ($categories as $category) { ?>
    <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>
		<?php if ($category['children']) { ?>
		<div>
		<?php for ($i = 0; $i < count($category['children']);) { ?>
			<ul>
				<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
				<?php for (; $i < $j; $i++) { ?>
				<?php if (isset($category['children'][$i])) { ?>
				<li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
				<?php } ?>
				<?php } ?>
			</ul>
		<?php } ?>
        </div>
        <?php } ?>
    </li>
    <?php } ?>
	</ul>
	<select onchange="location = this.options[this.selectedIndex].value;">
		<option>Menu</option>
			<?php foreach ($categories as $category) { ?>
				<option value="<?php echo $category['href']; ?>" <?php if($title==$category["name"]){echo 'selected="selected"';}?>><?php echo $category['name']; ?></option>
				<?php if ($category['children']) { ?>
				<?php for ($i = 0; $i < count($category['children']);) { ?>
				<?php $j = $i + ceil(count($category['children']) / $category['column']); ?>
				<?php for (; $i < $j; $i++) { ?>
					<?php if (isset($category['children'][$i])) { ?>
						<option value="<?php echo $category['children'][$i]['href']; ?>" <?php if($title==$category['children'][$i]['name']){echo 'selected="selected"';}?>>&nbsp;- <?php echo $category['children'][$i]['name']; ?></option>
					<?php } ?>
				<?php } ?>
				<?php } ?>
			<?php } ?>
		<?php } ?>
	</select>
	<?php echo $cart; ?>
	<div class="cart-icn">
		<a href="<?php echo $shopping_cart; ?>"><i class="icon-shopping-cart"></i></a>
	</div>
</div>
<?php } ?>
<div id="notification"></div>
<p id="back-top">
	<a href="#top"><i class="icon-circle-arrow-up"></i></a>
</p>
<script type="text/javascript">
  $(document).ready(function () {
    $("[rel=tooltip]").tooltip();
  });
</script>
