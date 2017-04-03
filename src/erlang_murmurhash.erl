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
         murmurhash64b/1, murmurhash64b/2,
         murmurhash3_32/1, murmurhash3_32/2,
         murmurhash3_x86_128/1, murmurhash3_x86_128/2,
         murmurhash3_x64_128/1, murmurhash3_x64_128/2,
         murmurhash3_x64_128_cass/1
        ]).

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

murmurhash3_32_impl(_Data) ->
    erlang:nif_error(not_loaded).

murmurhash3_32_impl(_Data, _Seed) ->
    erlang:nif_error(not_loaded).

murmurhash3_x86_128_impl(_Data) ->
    erlang:nif_error(not_loaded).

murmurhash3_x86_128_impl(_Data, _Seed) ->
    erlang:nif_error(not_loaded).

murmurhash3_x64_128_impl(_Data) ->
    erlang:nif_error(not_loaded).

murmurhash3_x64_128_impl(_Data, _Seed) ->
    erlang:nif_error(not_loaded).

murmurhash3_x64_128_cass_impl(_Data) ->
    erlang:nif_error(not_loaded).

-spec murmurhash2(binary() | list() | atom()) -> non_neg_integer().

murmurhash2(Data) when is_binary(Data) ->
    murmurhash2_impl(Data);
murmurhash2(Data) when is_list(Data) ->
    murmurhash2_impl(list_to_binary(Data));
murmurhash2(Data) when is_atom(Data) ->
    murmurhash2_impl(term_to_binary(Data)).

-spec murmurhash2(binary() | list() | atom(), integer()) -> non_neg_integer().

murmurhash2(Data, Seed) when is_binary(Data) andalso is_integer(Seed) ->
    murmurhash2_impl(Data, Seed);
murmurhash2(Data, Seed) when is_list(Data) andalso is_integer(Seed) ->
    murmurhash2_impl(list_to_binary(Data), Seed);
murmurhash2(Data, Seed) when is_atom(Data) andalso is_integer(Seed) ->
    murmurhash2_impl(term_to_binary(Data), Seed).

-spec murmurhash2a(binary() | list() | atom()) -> non_neg_integer().

murmurhash2a(Data) when is_binary(Data) ->
    murmurhash2a_impl(Data);
murmurhash2a(Data) when is_list(Data) ->
    murmurhash2a_impl(list_to_binary(Data));
murmurhash2a(Data) when is_atom(Data) ->
    murmurhash2a_impl(term_to_binary(Data)).

-spec murmurhash2a(binary() | list() | atom(), integer()) -> non_neg_integer().

murmurhash2a(Data, Seed) when is_binary(Data) andalso is_integer(Seed) ->
    murmurhash2a_impl(Data, Seed);
murmurhash2a(Data, Seed) when is_list(Data) andalso is_integer(Seed) ->
    murmurhash2a_impl(list_to_binary(Data), Seed);
murmurhash2a(Data, Seed) when is_atom(Data) andalso is_integer(Seed) ->
    murmurhash2a_impl(term_to_binary(Data), Seed).

-spec murmurhash64a(binary() | list() | atom()) -> non_neg_integer().

murmurhash64a(Data) when is_binary(Data) ->
    murmurhash64a_impl(Data);
murmurhash64a(Data) when is_list(Data) ->
    murmurhash64a_impl(list_to_binary(Data));
murmurhash64a(Data) when is_atom(Data) ->
    murmurhash64a_impl(term_to_binary(Data)).

-spec murmurhash64a(binary() | list() | atom(), integer()) -> non_neg_integer().

murmurhash64a(Data, Seed) when is_binary(Data) andalso is_integer(Seed) ->
    murmurhash64a_impl(Data, Seed);
murmurhash64a(Data, Seed) when is_list(Data) andalso is_integer(Seed) ->
    murmurhash64a_impl(list_to_binary(Data), Seed);
murmurhash64a(Data, Seed) when is_atom(Data) andalso is_integer(Seed) ->
    murmurhash64a_impl(term_to_binary(Data), Seed).

-spec murmurhash64b(binary() | list() | atom()) -> non_neg_integer().

murmurhash64b(Data) when is_binary(Data) ->
    murmurhash64b_impl(Data);
murmurhash64b(Data) when is_list(Data) ->
    murmurhash64b_impl(list_to_binary(Data));
murmurhash64b(Data) when is_atom(Data) ->
    murmurhash64b_impl(term_to_binary(Data)).

-spec murmurhash64b(binary() | list() | atom(), integer()) -> non_neg_integer().

murmurhash64b(Data, Seed) when is_binary(Data) andalso is_integer(Seed) ->
    murmurhash64b_impl(Data, Seed);
murmurhash64b(Data, Seed) when is_list(Data) andalso is_integer(Seed) ->
    murmurhash64b_impl(list_to_binary(Data), Seed);
murmurhash64b(Data, Seed) when is_atom(Data) andalso is_integer(Seed) ->
    murmurhash64b_impl(term_to_binary(Data), Seed).

-spec murmurhashneutral2(binary() | list() | atom()) -> non_neg_integer().

murmurhashneutral2(Data) when is_binary(Data) ->
    murmurhashneutral2_impl(Data);
murmurhashneutral2(Data) when is_list(Data) ->
    murmurhashneutral2_impl(list_to_binary(Data));
murmurhashneutral2(Data) when is_atom(Data) ->
    murmurhashneutral2_impl(term_to_binary(Data)).

-spec murmurhashneutral2(binary() | list() | atom(), integer()) ->
    non_neg_integer().

murmurhashneutral2(Data, Seed) when is_binary(Data) andalso is_integer(Seed) ->
    murmurhashneutral2_impl(Data, Seed);
murmurhashneutral2(Data, Seed) when is_list(Data) andalso is_integer(Seed) ->
    murmurhashneutral2_impl(list_to_binary(Data), Seed);
murmurhashneutral2(Data, Seed) when is_atom(Data) andalso is_integer(Seed) ->
    murmurhashneutral2_impl(term_to_binary(Data), Seed).

-spec murmurhash3_32(binary() | list() | atom()) -> non_neg_integer().

murmurhash3_32(Data) when is_binary(Data) ->
    murmurhash3_32_impl(Data);
murmurhash3_32(Data) when is_list(Data) ->
    murmurhash3_32_impl(list_to_binary(Data));
murmurhash3_32(Data) when is_atom(Data) ->
    murmurhash3_32_impl(term_to_binary(Data)).

-spec murmurhash3_32(binary() | list() | atom(), integer()) ->
    non_neg_integer().

murmurhash3_32(Data, Seed) when is_binary(Data) andalso is_integer(Seed) ->
    murmurhash3_32_impl(Data, Seed);
murmurhash3_32(Data, Seed) when is_list(Data) andalso is_integer(Seed) ->
    murmurhash3_32_impl(list_to_binary(Data), Seed);
murmurhash3_32(Data, Seed) when is_atom(Data) andalso is_integer(Seed) ->
    murmurhash3_32_impl(term_to_binary(Data), Seed).

-spec murmurhash3_x86_128(binary() | list() | atom()) -> non_neg_integer().

murmurhash3_x86_128(Data) when is_binary(Data) ->
    murmurhash3_x86_128_wrapper(Data);
murmurhash3_x86_128(Data) when is_list(Data) ->
    murmurhash3_x86_128_wrapper(list_to_binary(Data));
murmurhash3_x86_128(Data) when is_atom(Data) ->
    murmurhash3_x86_128_wrapper(term_to_binary(Data)).

murmurhash3_x86_128_wrapper(Data) ->
    binary:decode_unsigned(
      flip_4_32bit_words(murmurhash3_x86_128_impl(Data)), little).

-spec murmurhash3_x86_128(binary() | list() | atom(), integer()) ->
    non_neg_integer().

murmurhash3_x86_128(Data, Seed) when is_binary(Data) andalso is_integer(Seed) ->
    murmurhash3_x86_128_wrapper(Data, Seed);
murmurhash3_x86_128(Data, Seed) when is_list(Data) andalso is_integer(Seed) ->
    murmurhash3_x86_128_wrapper(list_to_binary(Data), Seed);
murmurhash3_x86_128(Data, Seed) when is_atom(Data) andalso is_integer(Seed) ->
    murmurhash3_x86_128_wrapper(term_to_binary(Data), Seed).

murmurhash3_x86_128_wrapper(Data, Seed) ->
    binary:decode_unsigned(
      flip_4_32bit_words(murmurhash3_x86_128_impl(Data, Seed)), little).

flip_4_32bit_words(<<A:4/binary, B:4/binary, C:4/binary, D:4/binary>>) ->
    <<D/binary, C/binary, B/binary, A/binary>>.

-spec murmurhash3_x64_128(binary() | list() | atom()) -> non_neg_integer().

murmurhash3_x64_128(Data) when is_binary(Data) ->
    murmurhash3_x64_128_wrapper(Data);
murmurhash3_x64_128(Data) when is_list(Data) ->
    murmurhash3_x64_128_wrapper(list_to_binary(Data));
murmurhash3_x64_128(Data) when is_atom(Data) ->
    murmurhash3_x64_128_wrapper(term_to_binary(Data)).

murmurhash3_x64_128_wrapper(Data) ->
    binary:decode_unsigned(
      flip_2_64bit_words(murmurhash3_x64_128_impl(Data)), little).

-spec murmurhash3_x64_128(binary() | list() | atom(), integer()) ->
    non_neg_integer().

murmurhash3_x64_128(Data, Seed) when is_binary(Data) andalso is_integer(Seed) ->
    murmurhash3_x64_128_wrapper(Data, Seed);
murmurhash3_x64_128(Data, Seed) when is_list(Data) andalso is_integer(Seed) ->
    murmurhash3_x64_128_wrapper(list_to_binary(Data), Seed);
murmurhash3_x64_128(Data, Seed) when is_atom(Data) andalso is_integer(Seed) ->
    murmurhash3_x64_128_wrapper(term_to_binary(Data), Seed).

murmurhash3_x64_128_wrapper(Data, Seed) ->
    binary:decode_unsigned(
      flip_2_64bit_words(murmurhash3_x64_128_impl(Data, Seed)), little).

flip_2_64bit_words(<<A:8/binary, B:8/binary>>) ->
    <<B/binary, A/binary>>.

-spec murmurhash3_x64_128_cass(binary() | list() | atom()) -> integer().

murmurhash3_x64_128_cass(Data) when is_binary(Data) ->
    murmurhash3_x64_128_cass_impl(Data);
murmurhash3_x64_128_cass(Data) when is_list(Data) ->
    murmurhash3_x64_128_cass_impl(list_to_binary(Data));
murmurhash3_x64_128_cass(Data) when is_atom(Data) ->
    murmurhash3_x64_128_cass_impl(term_to_binary(Data)).

%% ===================================================================
%% EUnit tests
%% ===================================================================
-ifdef(TEST).

read_file(Device, Acc) ->
    case io:fread(Device, "", "~ts~ts") of
        eof ->
            Acc;
        {ok, [K, V]} ->
            read_file(Device, [{K, V} | Acc])
    end.

read_test_data(FileName) ->
    {ok, Device} = file:open(FileName, [read]),
    read_file(Device, []).

apply_murmurhash64a(Item) ->
    K = element(1, Item),
    V = list_to_integer(element(2, Item)),
    V = murmurhash64a(K).

apply_murmurhash2(Item) ->
    K = element(1, Item),
    V = list_to_integer(element(2, Item)),
    V = murmurhash2(K).

apply_murmurhash3_32(Item) ->
    K = element(1, Item),
    V = list_to_integer(element(2, Item)),
    V = murmurhash3_32(K).

apply_murmurhash3_x86_128(Item) ->
    K = element(1, Item),
    V = list_to_integer(element(2, Item), 16),
    V = murmurhash3_x86_128(K).

apply_murmurhash3_x64_128(Item) ->
    K = element(1, Item),
    V = list_to_integer(element(2, Item), 16),
    V = murmurhash3_x64_128(K).

apply_murmurhash3_x64_128_cass(Item) ->
    K = element(1, Item),
    V = list_to_integer(element(2, Item), 10),
    V = murmurhash3_x64_128_cass(K).

murmurhash64a_test() ->
    TestsData = read_test_data("../tests/MurmurHash64A.data"),
    lists:foreach(fun apply_murmurhash64a/1, TestsData).

murmurhash2_test() ->
    TestsData = read_test_data("../tests/MurmurHash2.data"),
    lists:foreach(fun apply_murmurhash2/1, TestsData).

murmurhash3_32_test() ->
    TestsData = read_test_data("../tests/MurmurHash3_32.data"),
    lists:foreach(fun apply_murmurhash3_32/1, TestsData).

murmurhash3_x86_128_test() ->
    TestsData = read_test_data("../tests/MurmurHash3_x86_128.data"),
    lists:foreach(fun apply_murmurhash3_x86_128/1, TestsData).

murmurhash3_x64_128_test() ->
    TestsData = read_test_data("../tests/MurmurHash3_x64_128.data"),
    lists:foreach(fun apply_murmurhash3_x64_128/1, TestsData).

murmurhash3_x64_128_cass_test() ->
    TestsData = read_test_data("../tests/MurmurHash3_x64_128_cass.data"),
    lists:foreach(fun apply_murmurhash3_x64_128_cass/1, TestsData).

-endif.
