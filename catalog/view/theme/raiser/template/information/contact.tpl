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
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <div class="contact-info">
    <h2 class ="h2-wm"><span class="heading-lines"><?php echo $text_location; ?></span></h2>
		<div class="content"><div class="left"><span class="text-styling"><?php echo $text_address; ?></span><br /><br />
			<p><?php echo $store; ?></p><br />
			<p><?php echo $address; ?></p></div>
			<div class="right">
				<?php if ($telephone) { ?>
				<span class="text-styling"><?php echo $text_telephone; ?></span><br /><br />
				<p><?php echo $telephone; ?></p><br />
				<br />
				<br />
				<?php } ?>
				<?php if ($fax) { ?>
				<span class="text-styling"><?php echo $text_fax; ?></span><br /><br />
				<p><?php echo $fax; ?></p>
				<?php } ?>
			</div>
		</div>
    </div>
    <div class="contact-form">
    <h2 class ="h2-wm"><span class="heading-lines"><?php echo $text_contact; ?></span></h2>
		<div class="content">
			<span class="text-styling"><?php echo $entry_name; ?></span><br /><br />
			<input type="text" name="name" value="<?php echo $name; ?>" />
			<br />
			<?php if ($error_name) { ?>
			<span class="error"><?php echo $error_name; ?></span>
			<?php } ?>
			<br />
			<span class="text-styling"><?php echo $entry_email; ?></span><br /><br />
			<input type="text" name="email" value="<?php echo $email; ?>" />
			<br />
			<?php if ($error_email) { ?>
			<span class="error"><?php echo $error_email; ?></span>
			<?php } ?>
			<br />
			<span class="text-styling"><?php echo $entry_enquiry; ?></span><br /><br />
			<textarea name="enquiry" cols="40" rows="10" style="width: 96%;"><?php echo $enquiry; ?></textarea>
			<br />
			<?php if ($error_enquiry) { ?>
			<span class="error"><?php echo $error_enquiry; ?></span>
			<?php } ?>
			<br />
			<span class="text-styling"><?php echo $entry_captcha; ?></span><br /><br />
			<input type="text" name="captcha" value="<?php echo $captcha; ?>" />
			<br /><br />
			<img src="index.php?route=information/contact/captcha" alt="" />
			<?php if ($error_captcha) { ?>
			<span class="error"><?php echo $error_captcha; ?></span>
			<?php } ?>
			</div>
			<div class="buttons">
			<div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
		</div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>
