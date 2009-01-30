-include_lib("kernel/include/inet.hrl").

-define (NAMESPACE, ?MODULE).
-define (TIMEOUT, 20000).
-define (DEFAULT_PORT, 5001).
-define (DB, talker_db).

-define (DATABASES, [node]).

-define (PACKET_SETUP, [binary, {packet, 4}, {nodelay, true}, {active, once}, {send_timeout, 60000}]).

% Records
-record (node, {key, address, port, pid, socket, tuple}).