#ifndef __STEP_RADIX2_DOMAIN_CUH__
#define __STEP_RADIX2_DOMAIN_CUH__

namespace libfqfft {

template<typename FieldT>
class step_radix2_domain {
public:
    size_t m;
    FieldT* instance;

    size_t big_m;
    size_t small_m;
    
    FieldT omega;
    FieldT big_omega;
    FieldT small_omega;

    __device__ step_radix2_domain(){};
    __device__ step_radix2_domain(const size_t m, FieldT* instance);

    static __host__ __device__ bool valid(size_t m);
    
    __device__ void FFT(libstl::vector<FieldT>& a);
    __device__ void pFFT(libstl::vector<FieldT>& a, size_t gridSize, size_t blockSize);
    __device__ void ppFFT(libstl::vector<FieldT>& a, size_t num);

    __host__ void ppFFT_host(libstl::vector<FieldT>& a, size_t num);

    __device__ void iFFT(libstl::vector<FieldT>& a);
    __device__ void piFFT(libstl::vector<FieldT>& a, size_t gridSize, size_t blockSize);
    __device__ void ppiFFT(libstl::vector<FieldT>& a, size_t num);

    __host__ void ppiFFT_host(libstl::vector<FieldT>& a, size_t num);

    __device__ void cosetFFT(libstl::vector<FieldT>& a, const FieldT& g);
    __device__ void pcosetFFT(libstl::vector<FieldT>& a, const FieldT& g, size_t gridSize, size_t blockSize);
    __device__ void ppcosetFFT(libstl::vector<FieldT>& a, const FieldT& g, size_t num);

    __host__ void ppcosetFFT_host(libstl::vector<FieldT>& a, const FieldT& g, size_t num);

    __device__ void icosetFFT(libstl::vector<FieldT>& a, const FieldT& g);
    __device__ void picosetFFT(libstl::vector<FieldT>& a, const FieldT& g, size_t gridSize, size_t blockSize);
    __device__ void ppicosetFFT(libstl::vector<FieldT>& a, const FieldT& g, size_t num);

    __host__ void ppicosetFFT_host(libstl::vector<FieldT>& a, FieldT& g, size_t num);

    __device__ libstl::vector<FieldT> evaluate_all_lagrange_polynomials(const FieldT &t);
    __device__ libstl::vector<FieldT> p_evaluate_all_lagrange_polynomials(const FieldT &t, size_t gridSize, size_t blockSize);

    __device__ FieldT get_domain_element(const size_t idx);

    __device__ FieldT compute_vanishing_polynomial(const FieldT &t);

    __device__ void add_poly_Z(const FieldT &coeff, libstl::vector<FieldT>& H);

    __device__ void divide_by_Z_on_coset(libstl::vector<FieldT>& P);

     __host__ void p_divide_by_Z_on_coset_host(libstl::vector<FieldT>& P, size_t gridSize, size_t blockSize);

};

}

#include "step_radix2_domain.cu"

#endif