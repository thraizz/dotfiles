#!/usr/bin/sh


if [ $# -eq 0 ]
then
	get_clients=`cat <<EOF
	local res = '' 
	for index,cl in ipairs(client.get()) do
		if cl.valid and cl.name ~= nil
		then
			res = res .. cl.window .. "  -  " .. cl.name .. " " .. '|'
		end
	end 

	return res 
EOF
	`
	res=$(echo $get_clients | awesome-client)

	res=$(echo $res | grep -P -o '([0-9]+ - [^"]*)')

	echo $res | awk -F '|' '{for(i=1;i<NF;i++){print $i}}'

else
	window=$(echo $1 | awk -F ' - ' '{print $1}')

	awesome-client "
	local urgent_window_id="$window"

	for index,cl in ipairs(client.get()) do
		if cl.window == urgent_window_id
		then
			cl.urgent = true
			cl:jump_to()
			break
		end
	end 

	"
fi

