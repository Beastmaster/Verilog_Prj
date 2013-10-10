ok_inst : ok PORT MAP (
		asdo_in	 => asdo_in_sig,
		asmi_access_granted	 => asmi_access_granted_sig,
		dclk_in	 => dclk_in_sig,
		ncso_in	 => ncso_in_sig,
		noe_in	 => noe_in_sig,
		asmi_access_request	 => asmi_access_request_sig,
		data0_out	 => data0_out_sig
	);
