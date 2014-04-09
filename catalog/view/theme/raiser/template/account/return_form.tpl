<?php echo $header; ?>
<div class="location-bar">
  <h1><?php echo $heading_title; ?></h1>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
  <div id="return-info">
    <h2 class ="h2-wm"><span class="heading-lines"><?php echo $text_order; ?></span></h2>
    <p><?php echo $text_description; ?></p>
    <div class="content">
      <div class="left"><span class="text-styling"><?php echo $entry_firstname; ?> <span class="required">(*)</span></span><br /><br />
        <input type="text" name="firstname" value="<?php echo $firstname; ?>" class="large-field" />
        <br />
        <?php if ($error_firstname) { ?>
        <span class="error"><?php echo $error_firstname; ?></span>
        <?php } ?>
        <br />
        <span class="text-styling"><?php echo $entry_lastname; ?> <span class="required">(*)</span></span><br /><br />
        <input type="text" name="lastname" value="<?php echo $lastname; ?>" class="large-field" />
        <br />
        <?php if ($error_lastname) { ?>
        <span class="error"><?php echo $error_lastname; ?></span>
        <?php } ?>
        <br />
        <span class="text-styling"><?php echo $entry_email; ?> <span class="required">(*)</span></span><br /><br />
        <input type="text" name="email" value="<?php echo $email; ?>" class="large-field" />
        <br />
        <?php if ($error_email) { ?>
        <span class="error"><?php echo $error_email; ?></span>
        <?php } ?>
        <br />
        <span class="text-styling"><?php echo $entry_telephone; ?> <span class="required">(*)</span></span><br /><br />
        <input type="text" name="telephone" value="<?php echo $telephone; ?>" class="large-field" />
        <br />
        <?php if ($error_telephone) { ?>
        <span class="error"><?php echo $error_telephone; ?></span>
        <?php } ?>
        <br />
      </div>
      <div class="right"><span class="text-styling"><?php echo $entry_order_id; ?> <span class="required">(*)</span></span><br /><br />
        <input type="text" name="order_id" value="<?php echo $order_id; ?>" class="large-field" />
        <br />
        <?php if ($error_order_id) { ?>
        <span class="error"><?php echo $error_order_id; ?></span>
        <?php } ?>
        <br />
        <span class="text-styling"><?php echo $entry_date_ordered; ?></span><br /><br />
        <input type="text" name="date_ordered" value="<?php echo $date_ordered; ?>" class="large-field date" />
        <br />
      </div>
    </div>
    </div>
    <div id="return-product">
      <div class="content">
      <h2><span class="heading-lines"><?php echo $text_product; ?></span></h2>
        <div class="return-product">
		  <div class="return-data">
          <div class="return-name"><span class="text-styling"><?php echo $entry_product; ?> <span class="required">(*)</span></span><br /><br />
            <input type="text" name="product" value="<?php echo $product; ?>" class="large-field" />
            <br />
            <?php if ($error_product) { ?>
            <span class="error"><?php echo $error_product; ?></span>
            <?php } ?>
          </div>
          <div class="return-model"><span class="text-styling"><?php echo $entry_model; ?> <span class="required">(*)</span></span><br /><br />
            <input type="text" name="model" value="<?php echo $model; ?>" class="large-field" />
            <br />
            <?php if ($error_model) { ?>
            <span class="error"><?php echo $error_model; ?></span>
            <?php } ?>
          </div>
          <div class="return-quantity"><span class="text-styling"><?php echo $entry_quantity; ?></span><br /><br />
            <input type="text" name="quantity" value="<?php echo $quantity; ?>" class="large-field" />
          </div>
          </div>
          <div class="return-reason"><span class="text-styling"><?php echo $entry_reason; ?> <span class="required">(*)</span></span><br /><br />
            <table>
              <?php foreach ($return_reasons as $return_reason) { ?>
              <?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
              <tr>
                <td width="1"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" checked="checked" /></td>
                <td><label for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?></label></td>
              </tr>
              <?php } else { ?>
              <tr>
                <td width="1"><input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" /></td>
                <td><label for="return-reason-id<?php echo $return_reason['return_reason_id']; ?>"><?php echo $return_reason['name']; ?></label></td>
              </tr>
              <?php  } ?>
              <?php  } ?>
            </table>
            <?php if ($error_reason) { ?>
            <span class="error"><?php echo $error_reason; ?></span>
            <?php } ?>
          </div>
        </div>
        <div class="return-detail">
          <div class="return-opened"><span class="text-styling"><?php echo $entry_opened; ?></span><br /><br />
            <?php if ($opened) { ?>
            <input type="radio" name="opened" value="1" id="opened" checked="checked" />
            <?php } else { ?>
            <input type="radio" name="opened" value="1" id="opened" />
            <?php } ?>
            <label for="opened"><?php echo $text_yes; ?></label>
            <?php if (!$opened) { ?>
            <input type="radio" name="opened" value="0" id="unopened" checked="checked" />
            <?php } else { ?>
            <input type="radio" name="opened" value="0" id="unopened" />
            <?php } ?>
            <label for="unopened"><?php echo $text_no; ?></label>
            <br />
            <br />
            <span class="text-styling"><?php echo $entry_fault_detail; ?></span><br /><br />
            <textarea name="comment" cols="150" rows="6"><?php echo $comment; ?></textarea>
          </div>
          <div class="return-captcha"><span class="text-styling"><?php echo $entry_captcha; ?></span><br /><br />
            <input type="text" name="captcha" value="<?php echo $captcha; ?>" />
            <br />
            <br />
            <img src="index.php?route=account/return/captcha" alt="" />
            <?php if ($error_captcha) { ?>
            <span class="error"><?php echo $error_captcha; ?></span>
            <?php } ?>
          </div>
        </div>
      </div>
    </div>
    <?php if ($text_agree) { ?>
    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
      <div class="right"><?php echo $text_agree; ?>
        <?php if ($agree) { ?>
        <input type="checkbox" name="agree" value="1" checked="checked" />
        <?php } else { ?>
        <input type="checkbox" name="agree" value="1" />
        <?php } ?>
        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
      </div>
    </div>
    <?php } else { ?>
    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
      <div class="right">
        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
      </div>
    </div>
    <?php } ?>
  </form>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script> 
<script type="text/javascript"><!--
$(document).ready(function() {
	$('.colorbox').colorbox({
		width: 640,
		height: 480
	});
});
//--></script> 
<?php echo $footer; ?>
