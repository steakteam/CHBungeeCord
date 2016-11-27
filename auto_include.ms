proc(_GetIP, @player,
        @ba = byte_array()
        ba_put_string(@ba, 'IP')
        #broadcast(colorize('&bUsing this as decoded string: ('.@ba')'),devtest)
        send_plugin_message(@player, 'BungeeCord', @ba)
)
 
proc(_PlayerCount, @server,
        @ba = byte_array()
        ba_put_string(@ba, 'PlayerCount')
        ba_put_string(@ba, @server)
        #broadcast(colorize('&bUsing this as decoded string: ('.@ba')'),devtest)
        send_plugin_message(@player, 'BungeeCord', @ba)
)
 
proc(_PlayerList, @server,
        @ba = byte_array()
        ba_put_string(@ba, 'PlayerList')
        ba_put_string(@ba, @server)
        #broadcast(colorize('&bUsing this as decoded string: ('.@ba')'),devtest)
        send_plugin_message(@player, 'BungeeCord', @ba)
)
 
proc(_GetServers,
        @ba = byte_array()
        ba_put_string(@ba, 'GetServers')
        #broadcast(colorize('&bUsing this as decoded string: ('.@ba')'),devtest)
        send_plugin_message(@player, 'BungeeCord', @ba)
)
 
proc(_Message, @playername, @message,
        @ba = byte_array()
        ba_put_string(@ba, 'Message')
        ba_put_string(@ba, @playername)
        ba_put_string(@ba, @message)
        #broadcast(colorize('&bUsing this as decoded string: ('.@ba')'),devtest)
        send_plugin_message(@player, 'BungeeCord', @ba)
)
 
proc(_GetServerName,
        @ba = byte_array()
        ba_put_string(@ba, 'GetServer')
        #broadcast(colorize('&bUsing this as decoded string: ('.@ba')'),devtest)
        send_plugin_message(@player, 'BungeeCord', @ba)
)
 
proc(_Broadcast, @channel, @message,
        @ba = byte_array()
        ba_put_string(@ba, 'Forward')
        ba_put_string(@ba, 'ALL')
        ba_put_string(@ba, @channel)
        ba_put_string(@ba, @message)
        #broadcast(colorize('&bUsing this as decoded string: ('.@ba')'),developer)
        send_plugin_message(@player, 'BungeeCord', @ba)
)
