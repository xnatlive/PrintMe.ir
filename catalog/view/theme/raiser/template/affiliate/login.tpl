<?php echo $header; ?>
<div class="location-bar">
  <h1><?php echo $heading_title; ?></h1>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
</div>
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="login-content">
  <p><?php echo $text_description; ?></p>
    <div class="left">
      <h2 class ="h2-wm"><span class="heading-lines"><?php echo $text_new_affiliate; ?></span></h2>
      <div class="content"><?php echo $text_register_account; ?> <a href="<?php echo $register; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
    <div class="right">
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <h2 class ="h2-wm"><span class="heading-lines"><?php echo $text_returning_affiliate; ?></span></h2>
        <div class="content">
          <p><?php echo $text_i_am_returning_affiliate; ?></p>
          <span class="text-styling"><?php echo $entry_email; ?></span><br /><br />
          <input type="text" name="email" value="<?php echo $email; ?>" />
          <br />
          <br />
          <span class="text-styling"><?php echo $entry_password; ?></span><br /><br />
          <input type="password" name="password" value="<?php echo $password; ?>" />
          <br />
          <br />
          <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a><br />
          <br />
          <input type="submit" value="<?php echo $button_login; ?>" class="button" />
          <?php if ($redirect) { ?>
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
          <?php } ?>
        </div>
      </form>
    </div>
  </div>
  <?php echo $content_bottom; ?></div>
<?php echo $footer; ?>