%%%-------------------------------------------------------------------
%%% @copyright (C) 2012-2016, 2600Hz, INC
%%% @doc
%%%
%%% @end
%%% @contributors
%%%-------------------------------------------------------------------
-module(whistle_transactions_app).

-behaviour(application).

-export([start/2, stop/1]).

-include("../include/whistle_transactions.hrl").

%%--------------------------------------------------------------------
%% @public
%% @doc
%% Implement the application start behaviour
%% @end
%%--------------------------------------------------------------------
-spec start(_, _) -> {'ok', pid()} | {'error', startlink_err()}.
start(_Type, _Args) ->
    whistle_transactions_sup:start_link().

%%--------------------------------------------------------------------
%% @public
%% @doc
%% Implement the application stop behaviour
%% @end
%%--------------------------------------------------------------------
-spec stop(_) -> 'true'.
stop(_State) ->
    exit(whereis('whistle_transactions_sup'), 'shutdown').
