%%% @author Konstantin Sorokin <kvs@sigterm.ru>
%%%
%%% @copyright 2011 Konstantin V. Sorokin, All rights reserved. Open source, BSD License
%%% @version 1.0
%%%
-module(erlang_murmurhash).
-version(1.0).
-on_load(init/0).
-export([murmurhash2/1, murmurhash2/2,
         murmurhash2a/1, murmurhash2a/2,
         murmurhashneutral2/1, murmurhashneutral2/2,
         murmurhash64a/1, murmurhash64a/2,
         murmurhash64b/1, murmurhash64b/2]).

-ifdef(TEST).
-include_lib("eunit/include/eunit.hrl").
-endif.

-spec init() -> ok | {error, any()}.

%% @doc Initialize NIF.
init() ->
    SoName = filename:join(case code:priv_dir(?MODULE) of
                               {error, bad_name} ->
                                   %% this is here for testing purposes
                                   filename:join(
                                     [filename:dirname(
                                        code:which(?MODULE)),"..","priv"]);
                               Dir ->
                                   Dir
                           end, atom_to_list(?MODULE) ++ "_nif"),
    erlang:load_nif(SoName, 0).

murmurhash2_impl(_Data) ->
    erlang:nif_error(not_loaded).

murmurhash2_impl(_Data, _Seed) ->
    erlang:nif_error(not_loaded).

murmurhash2a_impl(_Data) ->
    erlang:nif_error(not_loaded).

murmurhash2a_impl(_Data, _Seed) ->
    erlang:nif_error(not_loaded).

murmurhash64a_impl(_Data) ->
    erlang:nif_error(not_loaded).

murmurhash64a_impl(_Data, _Seed) ->
    erlang:nif_error(not_loaded).

murmurhash64b_impl(_Data) ->
    erlang:nif_error(not_loaded).

murmurhash64b_impl(_Data, _Seed) ->
    erlang:nif_error(not_loaded).

murmurhashneutral2_impl(_Data) ->
    erlang:nif_error(not_loaded).

murmurhashneutral2_impl(_Data, _Seed) ->
    erlang:nif_error(not_loaded).

murmurhash2(Data) when is_binary(Data) ->
    murmurhash2_impl(Data);
murmurhash2(Data) when is_list(Data) ->
    murmurhash2_impl(list_to_binary(Data));
murmurhash2(Data) when is_atom(Data) ->
    murmurhash2_impl(term_to_binary(Data)).

murmurhash2(Data, Seed) when is_binary(Data) andalso is_integer(Seed) ->
    murmurhash2_impl(Data, Seed);
murmurhash2(Data, Seed) when is_list(Data) andalso is_integer(Seed) ->
    murmurhash2_impl(list_to_binary(Data), Seed);
murmurhash2(Data, Seed) when is_atom(Data) andalso is_integer(Seed) ->
    murmurhash2_impl(term_to_binary(Data), Seed).

murmurhash2a(Data) when is_binary(Data) ->
    murmurhash2a_impl(Data);
murmurhash2a(Data) when is_list(Data) ->
    murmurhash2a_impl(list_to_binary(Data));
murmurhash2a(Data) when is_atom(Data) ->
    murmurhash2a_impl(term_to_binary(Data)).

murmurhash2a(Data, Seed) when is_binary(Data) andalso is_integer(Seed) ->
    murmurhash2a_impl(Data, Seed);
murmurhash2a(Data, Seed) when is_list(Data) andalso is_integer(Seed) ->
    murmurhash2a_impl(list_to_binary(Data), Seed);
murmurhash2a(Data, Seed) when is_atom(Data) andalso is_integer(Seed) ->
    murmurhash2a_impl(term_to_binary(Data), Seed).

murmurhash64a(Data) when is_binary(Data) ->
    murmurhash64a_impl(Data);
murmurhash64a(Data) when is_list(Data) ->
    murmurhash64a_impl(list_to_binary(Data));
murmurhash64a(Data) when is_atom(Data) ->
    murmurhash64a_impl(term_to_binary(Data)).

murmurhash64a(Data, Seed) when is_binary(Data) andalso is_integer(Seed) ->
    murmurhash64a_impl(Data, Seed);
murmurhash64a(Data, Seed) when is_list(Data) andalso is_integer(Seed) ->
    murmurhash64a_impl(list_to_binary(Data), Seed);
murmurhash64a(Data, Seed) when is_atom(Data) andalso is_integer(Seed) ->
    murmurhash64a_impl(term_to_binary(Data), Seed).

murmurhash64b(Data) when is_binary(Data) ->
    murmurhash64b_impl(Data);
murmurhash64b(Data) when is_list(Data) ->
    murmurhash64b_impl(list_to_binary(Data));
murmurhash64b(Data) when is_atom(Data) ->
    murmurhash64b_impl(term_to_binary(Data)).

murmurhash64b(Data, Seed) when is_binary(Data) andalso is_integer(Seed) ->
    murmurhash64b_impl(Data, Seed);
murmurhash64b(Data, Seed) when is_list(Data) andalso is_integer(Seed) ->
    murmurhash64b_impl(list_to_binary(Data), Seed);
murmurhash64b(Data, Seed) when is_atom(Data) andalso is_integer(Seed) ->
    murmurhash64b_impl(term_to_binary(Data), Seed).

murmurhashneutral2(Data) when is_binary(Data) ->
    murmurhashneutral2_impl(Data);
murmurhashneutral2(Data) when is_list(Data) ->
    murmurhashneutral2_impl(list_to_binary(Data));
murmurhashneutral2(Data) when is_atom(Data) ->
    murmurhashneutral2_impl(term_to_binary(Data)).

murmurhashneutral2(Data, Seed) when is_binary(Data) andalso is_integer(Seed) ->
    murmurhashneutral2_impl(Data, Seed);
murmurhashneutral2(Data, Seed) when is_list(Data) andalso is_integer(Seed) ->
    murmurhashneutral2_impl(list_to_binary(Data), Seed);
murmurhashneutral2(Data, Seed) when is_atom(Data) andalso is_integer(Seed) ->
    murmurhashneutral2_impl(term_to_binary(Data), Seed).

%% ===================================================================
%% EUnit tests
%% ===================================================================
-ifdef(TEST).

%% To be written
erlang_murmurhash_test() ->
    ok.

-endif.
