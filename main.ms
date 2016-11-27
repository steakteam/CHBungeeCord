if (!is_channel_registered('BungeeCord'), register_channel('BungeeCord'))
 
bind(plugin_message_received,  null, null, @event,
 
@debug=false # turn debug on or off
 
if (@debug,
        broadcast('Array Keys in event [plugin_message_recieved]: '.array_keys(@event),jwtest)
        broadcast('Channel: '.@event[channel],jwtest)
        broadcast('event_type: '.@event[event_type],jwtest)
        broadcast('macrotype: '.@event[macrotype],jwtest)
        broadcast('player: '.@event[player],jwtest)
        broadcast('Event Bytes undecoded: '.@event[bytes],jwtest)
)
)
 
bind(plugin_message_received,  null, array(Channel: 'BungeeCord'), @event,
 
@debug=false # turn debug on or off
 
if (@debug,
        console('Array Keys in event [plugin_message_recieved]: ',array_keys(@event))
        broadcast('Array Keys in event [plugin_message_recieved]: '.array_keys(@event),devtest)
       
        console('Channel: '.@event[channel])
        broadcast('Channel: '.@event[channel],devtest)
       
        console('event_type: '.@event[event_type])
        broadcast('event_type: '.@event[event_type],devtest)
       
        console('macrotype: '.@event[macrotype])
        broadcast('macrotype: '.@event[macrotype],devtest)
       
        console('player: '.@event[player])
        broadcast('player: '.@event[player],devtest)
       
        console('Event Bytes undecoded: '.@event[bytes])
        broadcast('Event Bytes undecoded: '.@event[bytes],devtest)
)
 
        @ba=byte_array()
        @ba=@event[bytes]
        ba_rewind(@ba)
        @request=ba_get_string(@ba)
 
#       console('Request: '.@request)
#       broadcast('Request: '.@request,devtest)
       
        switch (@request,
                'IP',  #get the real ip from the player
                        @ipofplayer=ba_get_string(@event[bytes])
                        @portofplayer=ba_get_int(@event[bytes])
                        console('IP: '.@ipofplayer.':'.@portofplayer)
                        broadcast('IP: '.@ipofplayer.':'.@portofplayer,devtest)
                        die,
                'PlayerCount', #shows the player count of server
                        @server=ba_get_string(@ba)
                        @playercount=ba_get_int(@ba)
                        console('server: '.@server)
                        broadcast('server: '.@server,devtest)
 
                        console('NumberOfPlayers: '.@playercount)
                        broadcast('NumberOfPlayers: '.@playercount,devtest)
                        die,
                'PlayerList', #shows every player in the server
                        @server=ba_get_string(@ba)
                        @players=split(',',ba_get_string(@ba))
                        console('server: '.@server)
                        broadcast('server: '.@server,devtest)
 
                        console('players: '.@players)
                        broadcast('players: '.@players,devtest)
                        die,
                'GetServers', #shows all servers
                        @servers=split(',',ba_get_string(@ba))
                        console('Servers: '.@servers)
                        broadcast('Servers: '.@servers,devtest)
                        die,
                'GetServer', #shows current server
                        @servername=ba_get_string(@ba)
                        console('Servername: '.@servername)
                        broadcast('Servername: '.@servername,devtest)
                        die,
                'Forward', #recieve incoming message           
                        @channel=ba_get_string(@event[bytes])
                        @message=ba_get_string(@event[bytes])
                        console('Channel: '.@channel)
                        broadcast('Channel: '.@channel,devtest)
 
                        console('Message: '.@message)
                        broadcast('Message: '.@message,devtest)
                        die,
                'Developer', #recieve incoming message         
                        @message=ba_get_string(@event[bytes])
                        console(colorize('CHAT: '.@message))
                        broadcast(colorize(@message),developer)
                        die,
                'UUID',  #shows Unique User ID of currentplayer
                        @UUID=ba_get_string(@event[bytes])
                        console('UUID: '.@UUID)
                        broadcast('UUID: '.@UUID,devtest)
                        die,
                'UUIDOther',  #shows Unique User ID of otherplayer     
                        @uuidplayer=ba_get_string(@event[bytes])
                        @uuid=ba_get_string(@event[bytes])
                        console('UUID of player: '.@uuidplayer.' = '.@uuid)
                        broadcast('UUID of player: '.@uuidplayer.' = '.@uuid,devtest)
                        die,
                , # nothing found, throw exception
                        throw(PluginInternalException,'No correct request found, are you sure BungeeCord did not change the plugin msg format?')
        )
)
 
