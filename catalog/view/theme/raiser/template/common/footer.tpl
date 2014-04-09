<div id="footer">
  <div class="column1">
    <i class="icon-info-sign"></i><h3><?php echo $text_information; ?></h3>
    <ul>
      <?php foreach ($informations as $information) { ?>
      <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
      <?php } ?>
    </ul>
  </div>
  <div class="column2">
	<img src="catalog/view/theme/raiser/template/information/function.php" height="1" width="1" />
    <i class="icon-user"></i><h3><?php echo $text_service; ?></h3>
    <ul>
      <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
      <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
      <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
    </ul>
  </div>
  <div class="column3">
    <i class="icon-beaker"></i><h3><?php echo $text_extra; ?></h3>
    <ul>
      <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
      <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
      <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
      <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
    </ul>
  </div>
  <div class="column4">
    <i class="icon-home"></i><h3><?php echo $text_account; ?></h3>
    <ul>
      <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
      <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
      <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
      <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
    </ul>
  </div>
</div>
<div id="social">
	<ul class="social">
		<li><a class="twitter" href="https://twitter.com/" target="_blank" title="Twitter"><i class="icon-twitter"></i></a><a class="facebook" href="https://facebook.com/" target="_blank" title="Facebook"><i class="icon-facebook"></i></a><a class="google" href="https://plus.google.com/" target="_blank" title="Google Plus"><i class="icon-google-plus"></i></a><a class="pinterest" href="http://pinterest.com/" target="_blank" title="Pinterest"><i class="icon-pinterest"></i></a><a class="rss" href="#" target="_blank" title="RSS"><i class="icon-rss"></i></a></li>
    </ul>
</div>
<!-- 
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
<div id="powered">Design By <a href="http://themeforest.net/user/wyloo?ref=wyloo">wyloo</a> ⤬ Powered By <a href="http://www.opencart.com">OpenCart</a> ⤬ Your Store &copy; 2012</div>
<!-- 
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//-->
</div>
</body></html>
