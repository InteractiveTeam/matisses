<?php
class ws_customer extends matisses
{
	
	public function customer_add($datos)
	{
		global $errors;
		$response['error'] 		= array();
		$response['data']  		=$datos;
		$response['response']	= NULL;	
		
		$datos = $this->xml_to_array($datos);
		if(!array_key_exists('customerDTO',$datos))
		{
			array_push($response['error'],'missing <customerDTO> key');
			$response['response'] = 'wrong xml data';
			return $response;
		}
		$cedula			= str_replace('CL','',$datos['customerDTO']['id']); 
		$lastName1		= strtoupper($datos['customerDTO']['lastName1']);
		$lastName2		= strtoupper($datos['customerDTO']['lastName2']);
		$legalName		= strtoupper($datos['customerDTO']['legalName']);
		$names			= strtoupper($datos['customerDTO']['names']);
		$salesPersonCode= $datos['customerDTO']['salesPersonCode'];
		$email			= trim(strtolower($datos['customerDTO']['email']));
		$adresses		= $datos['customerDTO']['addresses'];
		$this->validate('id','isGenericName',$id_customer,true);
		$this->validate('lastName1','isName',$lastName1,true);
		$this->validate('lastName2','isName',$lastName2,true);
		$this->validate('legalName','isGenericName',$legalName,false);
		$this->validate('names','isName',$names,true);
		$this->validate('email','isEmail',$email,true);
		Customer::getByEmail($email) || Customer::getByCedula($cedula) ? $errors[sizeof($errors)+1] = 'The customer already exists' : NULL;
		if($errors)
		{
			array_push($response['error'],$this->array_to_xml($errors,2,false));
			$response['response'] = 'Can´t create the customer';
			return $response;
		}else{
			$customer = new Customer();
			$customer->lastname 			= $lastName1;
			$customer->secondname 	= $lastName2;
			$customer->firstname 			= $names;
			$customer->charter 				= $cedula;
			$customer->company				= $legalName;
			$customer->passwd				= Tools::encrypt($cedula);
			$customer->email				= $email;
 			try
			{
				//ini_set('display_errors',true);
				$customer->add(); 
				$address = new Address();
				foreach($adresses as $d => $v)
				{
					$address->id_customer 	= Customer::customerExists($customer->email,true);
					$address->lastname		= $lastName1.($lastName2 ? ' '.$lastName2 : NULL);
					$address->firstname		= $lastName1.($lastName2 ? ' '.$lastName2 : NULL);
					$address->address1		= $adresses[$d]['address'];
					$address->alias			= (strtoupper(trim($adresses[$d]['addressType']))=='F' ? 'Facturación' : 'Entrega');
					$address->id_country	= Country::getByIso(trim($adresses[$d]['cityCode']));
					$address->id_state		= State::getIdByIso(str_replace(trim($adresses[$d]['cityCode']),'',trim($adresses[$d]['stateCode'])));
					$address->city			= $adresses[$d]['cityName'].' ('.$adresses[$d]['stateName'].')';
					try
					{
						$address->add();
					}catch(Exception $e){
						array_push($response['error'],$e);
					}
				} 
				$response['response'] = 'Customer created';
				
			}catch(Exception $e){
				array_push($response['error'],$e);
			} 
		}
		return $response;
	}
	
	
	public function customer_get($datos) 
	{
		$response['error'] 		= array();
		$response['data']  		=$datos;
		$response['response']	= NULL;	
		$datos = $this->xml_to_array($datos);
		
		if(!array_key_exists('customerDTO',$datos))
		{
			array_push($response['error'],'missing <customerDTO> key');
			$response['response'] = 'wrong xml data';
			return $response;
		}

		$cedula			= str_replace('CL','',$datos['customerDTO']['id']); 
		$customer		= new Customer();
		$customerinfo	= $customer->getByCedula(pSQL($cedula));
		!is_object($customer) ? array_push($response['error'],'The customer not exists' ) : NULL;
		
		if(!$response['error'])
		{
			$array['customerDTO']['id'] 			= $customerinfo->charter.'CL';
			$array['customerDTO']['lastName1'] 		= $customerinfo->lastname;
			$array['customerDTO']['lastName2'] 		= $customerinfo->secondname;
			$array['customerDTO']['legalName']		= $customerinfo->company ? $customerinfo->company : $customerinfo->lastname.' '.$customerinfo->firstname.($customerinfo->secondname ? ' '.$customerinfo->secondname : NULL);
			$array['customerDTO']['names']			= $customerinfo->firstname;
			$array['customerDTO']['email']			= $customerinfo->email;
			$array['customerDTO']['salesPersonCode']= '';
			
			$customer->id	= $customerinfo->id;
			$addresses 		= $customer->getAddresses((int)Configuration::get('PS_LANG_DEFAULT'));
			if(is_array($addresses))
			{
				foreach($addresses as $d => $v)
				{
					$array['customerDTO']['addresses'][$d]['address'] 	= $addresses[$d]['address1'].' '.$addresses[$d]['address2'];
					$array['customerDTO']['addresses'][$d]['addressName'] = $addresses[$d]['alias'];
					$array['customerDTO']['addresses'][$d]['addressType'] = 'F';
					$array['customerDTO']['addresses'][$d]['cityCode'] 	= Country::getIsoById($addresses[$d]['id_country']).State::getIdByIso($addresses[$d]['id_state']);
					$array['customerDTO']['addresses'][$d]['cityName'] 	= $addresses[$d]['country'];
					$array['customerDTO']['addresses'][$d]['email'] 		= $customerinfo->email;
					$array['customerDTO']['addresses'][$d]['mobile'] 		= $addresses[$d]['phone_mobile'];
					$array['customerDTO']['addresses'][$d]['phone'] 		= $addresses[$d]['phone'];
					$array['customerDTO']['addresses'][$d]['stateCode'] 	= State::getIdByIso($addresses[$d]['id_state']);
					$array['customerDTO']['addresses'][$d]['stateName'] 	= $addresses[$d]['state'];
				}
			}
			$response['response']	= $this->array_to_xml($array);
		}
		
		return $response;
	}
	
	

}
?>