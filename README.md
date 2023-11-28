# TopP

Comparison of different implementations of TopP function.

* V1 - implementation of TopP function using cumulative sum implemented using Swift std lib
* V2 - implementation of TopP function using cumulative sum implemented using Accelerate framework

## Usage

To run Google Benchmark:

```
$ swift run -c release TopPCLI
```

To run XCTest Benchmark:

```
$ swift test 2>&1 | xcbeautify
```

## Results

MacBook Air M1 2020, 16GB RAM

Google Benchmark results (1000 iterations)

```
name                 time           std        iterations
---------------------------------------------------------
V1.n=32_000, p=0.90   358458.000 ns ±  16.37 %       1000
V1.n=32_000, p=0.95   371125.000 ns ±   2.04 %       1000
V1.n=32_000, p=0.99   361167.000 ns ±   2.70 %       1000
V1.n=65_000, p=0.90   820708.500 ns ±   4.80 %       1000
V1.n=65_000, p=0.95   790125.000 ns ±   4.44 %       1000
V1.n=65_000, p=0.99   843020.500 ns ±   4.39 %       1000
V1.n=128_000, p=0.90 1644312.500 ns ±   9.03 %       1000
V1.n=128_000, p=0.95 1735646.000 ns ±   2.73 %       1000
V1.n=128_000, p=0.99 1521667.000 ns ±   7.76 %       1000

V2.n=32_000, p=0.90   234542.000 ns ±  21.69 %       1000
V2.n=32_000, p=0.95   217854.000 ns ±   3.33 %       1000
V2.n=32_000, p=0.99   244875.000 ns ±   3.95 %       1000
V2.n=65_000, p=0.90   691292.000 ns ±   3.12 %       1000
V2.n=65_000, p=0.95   573917.000 ns ±   3.69 %       1000
V2.n=65_000, p=0.99   580729.000 ns ±   3.18 %       1000
V2.n=128_000, p=0.90 1330104.000 ns ±   2.28 %       1000
V2.n=128_000, p=0.95 1219375.000 ns ±   3.53 %       1000
V2.n=128_000, p=0.99 1283792.000 ns ±   3.57 %       1000
```

XCTests results (1000 iterations)

```
TestTopP_Performance_V1
    ◷ test_N128_000_P95 measured (9.044 kB ±4084.071% -- Memory Physical)
    ◷ test_N128_000_P95 measured (0.138 s ±22.875% -- Clock Monotonic Time)
    ◷ test_N128_000_P95 measured (414020.007 kC ±7.454% -- CPU Cycles)
    ◷ test_N128_000_P95 measured (0.134 s ±10.606% -- CPU Time)
    ◷ test_N128_000_P95 measured (2368820.640 kI ±0.206% -- CPU Instructions Retired)
    ◷ test_N128_000_P95 measured (27062.157 kB ±21.951% -- Memory Peak Physical)
    ✔ test_N128_000_P95 (141.680 seconds)
    ◷ test_N128_000_P99 measured (2.441 kB ±14869.806% -- Memory Physical)
    ◷ test_N128_000_P99 measured (0.170 s ±28.897% -- Clock Monotonic Time)
    ◷ test_N128_000_P99 measured (433201.322 kC ±11.499% -- CPU Cycles)
    ◷ test_N128_000_P99 measured (0.160 s ±20.031% -- CPU Time)
    ◷ test_N128_000_P99 measured (2380156.988 kI ±0.220% -- CPU Instructions Retired)
    ◷ test_N128_000_P99 measured (33379.012 kB ±10.188% -- Memory Peak Physical)
    ✔ test_N128_000_P99 (174.178 seconds)
    ◷ test_N32_000_P90 measured (1.835 kB ±4380.596% -- Memory Physical)
    ◷ test_N32_000_P90 measured (0.033 s ±8.432% -- Clock Monotonic Time)
    ◷ test_N32_000_P90 measured (100090.495 kC ±4.804% -- CPU Cycles)
    ◷ test_N32_000_P90 measured (0.033 s ±6.122% -- CPU Time)
    ◷ test_N32_000_P90 measured (588130.934 kI ±0.184% -- CPU Instructions Retired)
    ◷ test_N32_000_P90 measured (33052.970 kB ±7.405% -- Memory Peak Physical)
    ✔ test_N32_000_P90 (34.298 seconds)
    ◷ test_N32_000_P95 measured (4.178 kB ±1672.262% -- Memory Physical)
    ◷ test_N32_000_P95 measured (0.035 s ±17.560% -- Clock Monotonic Time)
    ◷ test_N32_000_P95 measured (100727.008 kC ±5.231% -- CPU Cycles)
    ◷ test_N32_000_P95 measured (0.034 s ±8.106% -- CPU Time)
    ◷ test_N32_000_P95 measured (588053.776 kI ±0.179% -- CPU Instructions Retired)
    ◷ test_N32_000_P95 measured (33702.530 kB ±7.910% -- Memory Peak Physical)
    ✔ test_N32_000_P95 (36.253 seconds)
    ◷ test_N32_000_P99 measured (1.933 kB ±9754.678% -- Memory Physical)
    ◷ test_N32_000_P99 measured (0.046 s ±41.966% -- Clock Monotonic Time)
    ◷ test_N32_000_P99 measured (109198.580 kC ±12.339% -- CPU Cycles)
    ◷ test_N32_000_P99 measured (0.041 s ±19.570% -- CPU Time)
    ◷ test_N32_000_P99 measured (588614.858 kI ±0.275% -- CPU Instructions Retired)
    ◷ test_N32_000_P99 measured (34862.304 kB ±7.477% -- Memory Peak Physical)
    ✔ test_N32_000_P99 (48.408 seconds)
    ◷ test_N65_000_P95 measured (4.932 kB ±4155.035% -- Memory Physical)
    ◷ test_N65_000_P95 measured (0.075 s ±17.713% -- Clock Monotonic Time)
    ◷ test_N65_000_P95 measured (207309.135 kC ±7.135% -- CPU Cycles)
    ◷ test_N65_000_P95 measured (0.073 s ±10.495% -- CPU Time)
    ◷ test_N65_000_P95 measured (1192166.846 kI ±0.259% -- CPU Instructions Retired)
    ◷ test_N65_000_P95 measured (39865.535 kB ±8.602% -- Memory Peak Physical)
    ✔ test_N65_000_P95 (77.686 seconds)
    ◷ test_N65_000_P99 measured (3.326 kB ±8463.189% -- Memory Physical)
    ◷ test_N65_000_P99 measured (0.077 s ±25.388% -- Clock Monotonic Time)
    ◷ test_N65_000_P99 measured (209983.015 kC ±7.537% -- CPU Cycles)
    ◷ test_N65_000_P99 measured (0.073 s ±13.619% -- CPU Time)
    ◷ test_N65_000_P99 measured (1196941.032 kI ±0.353% -- CPU Instructions Retired)
    ◷ test_N65_000_P99 measured (39356.878 kB ±7.507% -- Memory Peak Physical)
    ✔ test_N65_000_P99 (79.546 seconds)
    ◷ testN_128_000_P90 measured (2.884 kB ±3790.630% -- Memory Physical)
    ◷ testN_128_000_P90 measured (0.130 s ±10.588% -- Clock Monotonic Time)
    ◷ testN_128_000_P90 measured (410266.352 kC ±8.855% -- CPU Cycles)
    ◷ testN_128_000_P90 measured (0.130 s ±8.868% -- CPU Time)
    ◷ testN_128_000_P90 measured (2332230.025 kI ±0.167% -- CPU Instructions Retired)
    ◷ testN_128_000_P90 measured (41549.762 kB ±9.395% -- Memory Peak Physical)
    ✔ testN_128_000_P90 (133.558 seconds)
    ◷ testN_65_000_P90 measured (2.834 kB ±6702.189% -- Memory Physical)
    ◷ testN_65_000_P90 measured (0.069 s ±26.382% -- Clock Monotonic Time)
    ◷ testN_65_000_P90 measured (210182.759 kC ±7.752% -- CPU Cycles)
    ◷ testN_65_000_P90 measured (0.068 s ±10.495% -- CPU Time)
    ◷ testN_65_000_P90 measured (1202445.626 kI ±0.191% -- CPU Instructions Retired)
    ◷ testN_65_000_P90 measured (41497.382 kB ±7.124% -- Memory Peak Physical)
    ✔ testN_65_000_P90 (71.934 seconds)

TestTopP_Performance_V2
    ◷ test_N128_000_P95 measured (3.178 kB ±14754.198% -- Memory Physical)
    ◷ test_N128_000_P95 measured (0.141 s ±30.222% -- Clock Monotonic Time)
    ◷ test_N128_000_P95 measured (340710.819 kC ±12.708% -- CPU Cycles)
    ◷ test_N128_000_P95 measured (0.130 s ±20.223% -- CPU Time)
    ◷ test_N128_000_P95 measured (1834570.042 kI ±0.255% -- CPU Instructions Retired)
    ◷ test_N128_000_P95 measured (41625.013 kB ±5.912% -- Memory Peak Physical)
    ✔ test_N128_000_P95 (145.433 seconds)
    ◷ test_N128_000_P99 measured (1.966 kB ±7696.211% -- Memory Physical)
    ◷ test_N128_000_P99 measured (0.109 s ±33.465% -- Clock Monotonic Time)
    ◷ test_N128_000_P99 measured (323422.369 kC ±6.924% -- CPU Cycles)
    ◷ test_N128_000_P99 measured (0.106 s ±9.207% -- CPU Time)
    ◷ test_N128_000_P99 measured (1854447.024 kI ±0.135% -- CPU Instructions Retired)
    ◷ test_N128_000_P99 measured (42318.548 kB ±6.840% -- Memory Peak Physical)
    ✔ test_N128_000_P99 (111.493 seconds)
    ◷ test_N32_000_P90 measured (0.027 s ±21.883% -- Clock Monotonic Time)
    ◷ test_N32_000_P90 measured (79097.113 kC ±3.957% -- CPU Cycles)
    ◷ test_N32_000_P90 measured (0.026 s ±6.906% -- CPU Time)
    ◷ test_N32_000_P90 measured (462992.337 kI ±0.198% -- CPU Instructions Retired)
    ◷ test_N32_000_P90 measured (36874.374 kB ±1.960% -- Memory Peak Physical)
    ✔ test_N32_000_P90 (28.052 seconds)
    ◷ test_N32_000_P95 measured (5.243 kB ±2520.804% -- Memory Physical)
    ◷ test_N32_000_P95 measured (0.024 s ±7.266% -- Clock Monotonic Time)
    ◷ test_N32_000_P95 measured (77347.266 kC ±3.470% -- CPU Cycles)
    ◷ test_N32_000_P95 measured (0.025 s ±5.205% -- CPU Time)
    ◷ test_N32_000_P95 measured (456802.748 kI ±0.193% -- CPU Instructions Retired)
    ◷ test_N32_000_P95 measured (38162.599 kB ±4.363% -- Memory Peak Physical)
    ✔ test_N32_000_P95 (25.955 seconds)
    ◷ test_N32_000_P99 measured (0.033 s ±32.557% -- Clock Monotonic Time)
    ◷ test_N32_000_P99 measured (83189.618 kC ±13.101% -- CPU Cycles)
    ◷ test_N32_000_P99 measured (0.031 s ±20.299% -- CPU Time)
    ◷ test_N32_000_P99 measured (450995.986 kI ±0.877% -- CPU Instructions Retired)
    ◷ test_N32_000_P99 measured (38288.854 kB ±6.581% -- Memory Peak Physical)
    ✔ test_N32_000_P99 (35.524 seconds)
    ◷ test_N65_000_P95 measured (0.999 kB ±34630.979% -- Memory Physical)
    ◷ test_N65_000_P95 measured (0.070 s ±30.772% -- Clock Monotonic Time)
    ◷ test_N65_000_P95 measured (167881.957 kC ±8.493% -- CPU Cycles)
    ◷ test_N65_000_P95 measured (0.064 s ±12.549% -- CPU Time)
    ◷ test_N65_000_P95 measured (928127.828 kI ±0.334% -- CPU Instructions Retired)
    ◷ test_N65_000_P95 measured (36816.686 kB ±5.896% -- Memory Peak Physical)
    ✔ test_N65_000_P95 (73.276 seconds)
    ◷ test_N65_000_P99 measured (5.603 kB ±3948.744% -- Memory Physical)
    ◷ test_N65_000_P99 measured (0.062 s ±22.187% -- Clock Monotonic Time)
    ◷ test_N65_000_P99 measured (164143.711 kC ±6.349% -- CPU Cycles)
    ◷ test_N65_000_P99 measured (0.060 s ±10.578% -- CPU Time)
    ◷ test_N65_000_P99 measured (935887.994 kI ±0.218% -- CPU Instructions Retired)
    ◷ test_N65_000_P99 measured (40001.719 kB ±6.915% -- Memory Peak Physical)
    ✔ test_N65_000_P99 (64.283 seconds)
    ◷ testN_128_000_P90 measured (3.817 kB ±4595.697% -- Memory Physical)
    ◷ testN_128_000_P90 measured (0.104 s ±27.164% -- Clock Monotonic Time)
    ◷ testN_128_000_P90 measured (316844.429 kC ±7.010% -- CPU Cycles)
    ◷ testN_128_000_P90 measured (0.102 s ±9.406% -- CPU Time)
    ◷ testN_128_000_P90 measured (1823533.466 kI ±0.199% -- CPU Instructions Retired)
    ◷ testN_128_000_P90 measured (40542.424 kB ±6.164% -- Memory Peak Physical)
    ✔ testN_128_000_P90 (106.638 seconds)
    ◷ testN_65_000_P90 measured (1.819 kB ±9454.597% -- Memory Physical)
    ◷ testN_65_000_P90 measured (0.054 s ±11.052% -- Clock Monotonic Time)
    ◷ testN_65_000_P90 measured (166302.163 kC ±6.989% -- CPU Cycles)
    ◷ testN_65_000_P90 measured (0.054 s ±8.624% -- CPU Time)
    ◷ testN_65_000_P90 measured (944861.162 kI ±0.157% -- CPU Instructions Retired)
    ◷ testN_65_000_P90 measured (40232.340 kB ±8.444% -- Memory Peak Physical)
    ✔ testN_65_000_P90 (56.052 seconds)
```