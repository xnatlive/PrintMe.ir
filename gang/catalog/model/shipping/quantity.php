<?php 
class ModelShippingQuantity extends Model {    
  	public function getQuote($address) {
		$this->load->language('shipping/quantity');
		
		$quote_data = array();

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "geo_zone ORDER BY name DESC");
	
		foreach ($query->rows as $result) {
			if ($this->config->get('quantity_' . $result['geo_zone_id'] . '_status')) {
				$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "zone_to_geo_zone WHERE geo_zone_id = '" . (int)$result['geo_zone_id'] . "' AND country_id = '" . (int)$address['country_id'] . "' AND (zone_id = '" . (int)$address['zone_id'] . "' OR zone_id = '0')");
			
				if ($query->num_rows) {
					$status = true;
				} else {
					$status = false;
				}
			} else {
				$status = false;
			}
		
			if ($status) {
				$cost = '';
				$quantity = $this->cart->countProducts();
				
			$products = $this->cart->getProducts();

      		foreach ($products as $product) {
			
        		foreach ($product['option'] as $option) {
					if ($option['type'] != 'file') {
						$value = $option['option_value'];	
					} else {
						$filename = $this->encryption->decrypt($option['option_value']);
						
						$value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
					}
					
					$option_data[] = array(
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
        		}
				
				//	print_r($product);
				
				}
		
			
				$rates = explode(',', $this->config->get('quantity_' . $result['geo_zone_id'] . '_rate'));
				
				
				
				foreach ($rates as $rate) {
					$data = explode(':', $rate);
					
					
					
				if ($data[0] == 1) {
					$prc = $data[1];
					
					}
				
				if ($data[0] == 2) {
					$prc1 = $data[1];
					$prc2 = $prc+$prc1;
					}
				
					
				if ($data[0] == 3) {
					
					$prc3 = $data[1]+$prc2;
					}
				
				
					if ($data[0] >= $quantity && $quantity >=4) {
						if (isset($data[1])) {
							$cant = $quantity - 3;				
							$cost = $prc3+($cant*$data[1]);
						}
				
						break;
					}
					
					
						if ($data[0] == 1 && $quantity == 1 ) {
						if (isset($data[1])) {
										
							$cost = $data[1];
						}
				
						break;
					}
				
				
				
					if ($data[0] == 2 && $quantity == 2 ) {
						if (isset($data[1])) {
										
							$cost = $prc2;
						}
				
						break;
					}
				
				
				
					if ($data[0] == 3 && $quantity == 3 ) {
						if (isset($data[1])) {
										
							$cost = $prc3;
						}
				
						break;
					}
				
				
					
					
				}
				
				if ((string)$cost != '') { 
					$quote_data['quantity_' . $result['geo_zone_id']] = array(
						'code'         => 'quantity.quantity_' . $result['geo_zone_id'],
						'title'        => $result['name'] . '  (' . $this->language->get('text_quantity') . ' ' . $quantity . ')',
						'cost'         => $cost,
						'tax_class_id' => $this->config->get('quantity_tax_class_id'),
						'text'          => $this->currency->format($this->tax->calculate($cost, $this->config->get('quantity_tax_class_id'), $this->config->get('config_tax')))
					);	
				}
			}
		}
		
		$method_data = array();
	
		if ($quote_data) {
      		$method_data = array(
        		'code'       => 'quantity',
        		'title'      => $this->language->get('text_title'),
        		'quote'      => $quote_data,
				'sort_order' => $this->config->get('quantity_sort_order'),
        		'error'      => false
      		);
		}
	
		return $method_data;
  	}
}
?>