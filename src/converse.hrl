-define (debug, true).

-define (PORT, 22002).
-define (UDPPORT, 22003).

-define (DEFAULT_TIMEOUT, 5000).

-define (LOG_MESSAGE (Message), converse_logger:append({erlang:localtime(), ?MODULE, ?LINE, Message})).
-define (DEBUG_LOG (Bool, Message, Opts), 
  case Bool of true -> 
    io:format(Message, Opts); 
  _ -> ok 
  end,
  ?LOG_MESSAGE(io_lib:fwrite(Message, Opts))).

-define (DEFAULT_SOCKET_OPTS, [binary,{packet,raw},{active,false}, {reuseaddr,true},{keepalive,true},{backlog,30}]).

-define (DEFAULT_CONFIG, [
					{port, ?PORT},
					{udp_port, ?UDPPORT},
					{timeout, ?DEFAULT_TIMEOUT},
					{hostname, "localhost"},
					{secret, "secretsdontmakefriends"},
					{queue, false},
					{sock_opts, ?DEFAULT_SOCKET_OPTS}
				]).
				
-ifdef(debug).
-define (TRACE(X, M), io:format("TRACE ~p:~p ~p ~p~n" ,[?MODULE, ?LINE, X, M])).
-endif.

-define (MAXIMUM_RESTARTS, 10).
-define (MAX_DELAY_TIME, 60).