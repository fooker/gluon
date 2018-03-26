
return function(form, uci)
	local outdoor_mode = uci:get_bool('gluon', 'wireless', 'outdoor')

	if not outdoor_mode then
		-- only shown when enabled. enabled through preset or web-wifi-config.
		return
	end

	local pkg_i18n = i18n 'gluon-config-mode-outdoor'

	local section = form:section(Section, nil, pkg_i18n.translate(
		"Please enable this option in case the node is to be installed outdoors "
		.. "to comply with local frequency regulations."
	))

	local outdoor = section:option(Flag, 'outdoor', pkg_i18n.translate("Node will be installed outdoors"))
	outdoor.default = outdoor_mode

	function outdoor:write(data)
		uci:set('gluon', 'wireless', 'outdoor', data)
	end
end
