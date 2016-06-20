#include <erl_nif.h>
#include "MurmurHash2.h"
#include "MurmurHash3.h"
#include "MurmurHash3Cass.hpp"

extern "C" {

ERL_NIF_TERM erlang_murmurhash2_1_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);
ERL_NIF_TERM erlang_murmurhash2_2_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);

ERL_NIF_TERM erlang_murmurhash64a_1_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);
ERL_NIF_TERM erlang_murmurhash64a_2_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);

ERL_NIF_TERM erlang_murmurhash64b_1_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);
ERL_NIF_TERM erlang_murmurhash64b_2_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);

ERL_NIF_TERM erlang_murmurhash2a_1_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);
ERL_NIF_TERM erlang_murmurhash2a_2_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);

ERL_NIF_TERM erlang_murmurhashneutral2_1_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);
ERL_NIF_TERM erlang_murmurhashneutral2_2_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);

ERL_NIF_TERM erlang_murmurhash3_x86_32_1_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);
ERL_NIF_TERM erlang_murmurhash3_x86_32_2_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);

ERL_NIF_TERM erlang_murmurhash3_x86_128_1_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);
ERL_NIF_TERM erlang_murmurhash3_x86_128_2_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);

ERL_NIF_TERM erlang_murmurhash3_x64_128_1_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);
ERL_NIF_TERM erlang_murmurhash3_x64_128_2_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);

ERL_NIF_TERM erlang_murmurhash3_x64_128_cass_impl(ErlNifEnv* env, int argc,
    const ERL_NIF_TERM argv[]);

} // extern "C"

#if (ERL_NIF_MAJOR_VERSION >= 2 && ERL_NIF_MINOR_VERSION >= 7)

static ErlNifFunc nif_funcs[] =
{
    {"murmurhash2_impl", 1, erlang_murmurhash2_1_impl, 0},
    {"murmurhash2_impl", 2, erlang_murmurhash2_2_impl, 0},
    {"murmurhash64a_impl", 1, erlang_murmurhash64a_1_impl, 0},
    {"murmurhash64a_impl", 2, erlang_murmurhash64a_2_impl, 0},
    {"murmurhash64b_impl", 1, erlang_murmurhash64b_1_impl, 0},
    {"murmurhash64b_impl", 2, erlang_murmurhash64b_2_impl, 0},
    {"murmurhash2a_impl", 1, erlang_murmurhash2a_1_impl, 0},
    {"murmurhash2a_impl", 2, erlang_murmurhash2a_2_impl, 0},
    {"murmurhashneutral2_impl", 1, erlang_murmurhashneutral2_1_impl, 0},
    {"murmurhashneutral2_impl", 2, erlang_murmurhashneutral2_2_impl, 0},
    {"murmurhash3_32_impl", 1, erlang_murmurhash3_x86_32_1_impl, 0},
    {"murmurhash3_32_impl", 2, erlang_murmurhash3_x86_32_2_impl, 0},
    {"murmurhash3_x86_128_impl", 1, erlang_murmurhash3_x86_128_1_impl, 0},
    {"murmurhash3_x86_128_impl", 2, erlang_murmurhash3_x86_128_2_impl, 0},
    {"murmurhash3_x64_128_impl", 1, erlang_murmurhash3_x64_128_1_impl, 0},
    {"murmurhash3_x64_128_impl", 2, erlang_murmurhash3_x64_128_2_impl, 0},
    {"murmurhash3_x64_128_cass_impl", 1, erlang_murmurhash3_x64_128_cass_impl, 0}
};

#else

static ErlNifFunc nif_funcs[] =
{
    {"murmurhash2_impl", 1, erlang_murmurhash2_1_impl},
    {"murmurhash2_impl", 2, erlang_murmurhash2_2_impl},
    {"murmurhash64a_impl", 1, erlang_murmurhash64a_1_impl},
    {"murmurhash64a_impl", 2, erlang_murmurhash64a_2_impl},
    {"murmurhash64b_impl", 1, erlang_murmurhash64b_1_impl},
    {"murmurhash64b_impl", 2, erlang_murmurhash64b_2_impl},
    {"murmurhash2a_impl", 1, erlang_murmurhash2a_1_impl},
    {"murmurhash2a_impl", 2, erlang_murmurhash2a_2_impl},
    {"murmurhashneutral2_impl", 1, erlang_murmurhashneutral2_1_impl},
    {"murmurhashneutral2_impl", 2, erlang_murmurhashneutral2_2_impl},
    {"murmurhash3_32_impl", 1, erlang_murmurhash3_x86_32_1_impl},
    {"murmurhash3_32_impl", 2, erlang_murmurhash3_x86_32_2_impl},
    {"murmurhash3_x86_128_impl", 1, erlang_murmurhash3_x86_128_1_impl},
    {"murmurhash3_x86_128_impl", 2, erlang_murmurhash3_x86_128_2_impl},
    {"murmurhash3_x64_128_impl", 1, erlang_murmurhash3_x64_128_1_impl},
    {"murmurhash3_x64_128_impl", 2, erlang_murmurhash3_x64_128_2_impl},
    {"murmurhash3_x64_128_cass_impl", 1, erlang_murmurhash3_x64_128_cass_impl}
};

#endif

static bool check_and_unpack_data(ErlNifEnv* env, ERL_NIF_TERM bin_term,
    ErlNifBinary *bin);

ERL_NIF_TERM
erlang_murmurhash2_1_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    uint32_t     h;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    h = MurmurHash2(bin.data, bin.size, 0);

    return enif_make_uint(env, h);
}

ERL_NIF_TERM
erlang_murmurhash2_2_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    uint32_t     h;
    uint32_t     seed;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    if (!enif_get_uint(env, argv[1], &seed)) {
        return enif_make_badarg(env);
    }

    h = MurmurHash2(bin.data, bin.size, seed);

    return enif_make_uint(env, h);
}

ERL_NIF_TERM
erlang_murmurhash64a_1_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    uint64_t     h;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    h = MurmurHash64A(bin.data, bin.size, 0);

    return enif_make_uint64(env, h);
}

ERL_NIF_TERM
erlang_murmurhash64a_2_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    uint64_t     h;
    uint64_t     seed;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    if (!enif_get_uint64(env, argv[1], &seed)) {
        return enif_make_badarg(env);
    }

    h = MurmurHash64A(bin.data, bin.size, seed);

    return enif_make_uint64(env, h);
}

ERL_NIF_TERM
erlang_murmurhash64b_1_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    uint64_t     h;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    h = MurmurHash64B(bin.data, bin.size, 0);

    return enif_make_uint64(env, h);
}

ERL_NIF_TERM
erlang_murmurhash64b_2_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    uint64_t     h;
    uint64_t     seed;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    if (!enif_get_uint64(env, argv[1], &seed)) {
        return enif_make_badarg(env);
    }

    h = MurmurHash64B(bin.data, bin.size, seed);

    return enif_make_uint64(env, h);
}

ERL_NIF_TERM
erlang_murmurhash2a_1_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    uint32_t     h;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    h = MurmurHash2A(bin.data, bin.size, 0);

    return enif_make_uint(env, h);
}

ERL_NIF_TERM
erlang_murmurhash2a_2_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    uint32_t     h;
    uint32_t     seed;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    if (!enif_get_uint(env, argv[1], &seed)) {
        return enif_make_badarg(env);
    }

    h = MurmurHash2A(bin.data, bin.size, seed);

    return enif_make_uint(env, h);
}

ERL_NIF_TERM
erlang_murmurhashneutral2_1_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    uint32_t     h;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    h = MurmurHashNeutral2(bin.data, bin.size, 0);

    return enif_make_uint(env, h);
}

ERL_NIF_TERM
erlang_murmurhashneutral2_2_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    uint32_t     h;
    uint32_t     seed;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    if (!enif_get_uint(env, argv[1], &seed)) {
        return enif_make_badarg(env);
    }

    h = MurmurHashNeutral2(bin.data, bin.size, seed);

    return enif_make_uint(env, h);
}

ERL_NIF_TERM
erlang_murmurhash3_x86_32_1_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    uint32_t     h;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    MurmurHash3_x86_32(bin.data, bin.size, 0, &h);

    return enif_make_uint(env, h);
}

ERL_NIF_TERM
erlang_murmurhash3_x86_32_2_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    uint32_t     h;
    uint32_t     seed;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    if (!enif_get_uint(env, argv[1], &seed)) {
        return enif_make_badarg(env);
    }

    MurmurHash3_x86_32(bin.data, bin.size, seed, &h);

    return enif_make_uint(env, h);
}

ERL_NIF_TERM
erlang_murmurhash3_x86_128_1_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    ERL_NIF_TERM ret;
    unsigned char *h;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    h = enif_make_new_binary(env, 16, &ret);

    MurmurHash3_x86_128(bin.data, bin.size, 0, (void *)h);

    return ret;
}

ERL_NIF_TERM
erlang_murmurhash3_x86_128_2_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    uint32_t     seed;
    ERL_NIF_TERM ret;
    unsigned char *h;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    if (!enif_get_uint(env, argv[1], &seed)) {
        return enif_make_badarg(env);
    }

    h = enif_make_new_binary(env, 16, &ret);

    MurmurHash3_x86_128(bin.data, bin.size, seed, (void *)h);

    return ret;
}

ERL_NIF_TERM
erlang_murmurhash3_x64_128_1_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    ERL_NIF_TERM ret;
    unsigned char *h;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    h = enif_make_new_binary(env, 16, &ret);

    MurmurHash3_x64_128(bin.data, bin.size, 0, (void *)h);

    return ret;
}

ERL_NIF_TERM
erlang_murmurhash3_x64_128_2_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    uint32_t     seed;
    ERL_NIF_TERM ret;
    unsigned char *h;

    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    if (!enif_get_uint(env, argv[1], &seed)) {
        return enif_make_badarg(env);
    }

    h = enif_make_new_binary(env, 16, &ret);

    MurmurHash3_x64_128(bin.data, bin.size, seed, (void *)h);

    return ret;
}

ERL_NIF_TERM
erlang_murmurhash3_x64_128_cass_impl(ErlNifEnv* env, int, const ERL_NIF_TERM argv[])
{
    ErlNifBinary bin;
    if (!check_and_unpack_data(env, argv[0], &bin)) {
        return enif_make_badarg(env);
    }

    int64_t ret = cass::MurmurHash3_x64_128(bin.data, bin.size, 0);

    return enif_make_int64(env, ret);
}


bool
check_and_unpack_data(ErlNifEnv* env, ERL_NIF_TERM bin_term, ErlNifBinary *bin)
{
    if (!enif_is_binary(env, bin_term)) {
        return false;
    }

    if (!enif_inspect_binary(env, bin_term, bin)) {
        return false;
    }

    return true;
}

ERL_NIF_INIT(erlang_murmurhash, nif_funcs, NULL, NULL, NULL, NULL);
