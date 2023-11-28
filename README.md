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
name                 time           std         iterations
----------------------------------------------------------
V1.n=32_000, p=0.90   356292.000 ns ±  21.18 %        1000
V1.n=32_000, p=0.95   351500.000 ns ±   1.96 %        1000
V1.n=32_000, p=0.99   372562.500 ns ±   1.43 %        1000
V1.n=65_000, p=0.90   834458.500 ns ±   2.47 %        1000
V1.n=65_000, p=0.95   830875.000 ns ±   2.01 %        1000
V1.n=65_000, p=0.99   742125.000 ns ±   2.99 %        1000
V1.n=128_000, p=0.90 1790146.000 ns ±  31.54 %        1000
V1.n=128_000, p=0.95 1606271.000 ns ±  43.81 %        1000
V1.n=128_000, p=0.99 1666146.000 ns ±   7.32 %        1000

V2.n=32_000, p=0.90   273646.000 ns ±  10.66 %        1000
V2.n=32_000, p=0.95   270604.500 ns ±  14.06 %        1000
V2.n=32_000, p=0.99   284333.000 ns ±   4.20 %        1000
V2.n=65_000, p=0.90   699166.000 ns ± 1055.71 %       1000
V2.n=65_000, p=0.95   650145.500 ns ±  27.70 %        1000
V2.n=65_000, p=0.99   607104.500 ns ±  21.24 %        1000
V2.n=128_000, p=0.90 1222895.500 ns ±  20.04 %        1000
V2.n=128_000, p=0.95 1299896.000 ns ±   3.63 %        1000
V2.n=128_000, p=0.99 1315958.000 ns ±  16.14 %        1000
```

XCTests results (1000 iterations)

```
TestTopP_Performance_V1
    ◷ test_N128_000_P95 measured (6.046 kB ±6062.376% -- Memory Physical)
    ◷ test_N128_000_P95 measured (0.098 s ±32.210% -- Clock Monotonic Time)
    ◷ test_N128_000_P95 measured (287527.476 kC ±9.340% -- CPU Cycles)
    ◷ test_N128_000_P95 measured (0.095 s ±15.660% -- CPU Time)
    ◷ test_N128_000_P95 measured (1685105.011 kI ±0.346% -- CPU Instructions Retired)
    ◷ test_N128_000_P95 measured (27614.507 kB ±21.832% -- Memory Peak Physical)
    ✔ test_N128_000_P95 (101.120 seconds)
    ◷ test_N128_000_P99 measured (2.540 kB ±17828.025% -- Memory Physical)
    ◷ test_N128_000_P99 measured (0.100 s ±23.223% -- Clock Monotonic Time)
    ◷ test_N128_000_P99 measured (282059.856 kC ±9.292% -- CPU Cycles)
    ◷ test_N128_000_P99 measured (0.096 s ±14.991% -- CPU Time)
    ◷ test_N128_000_P99 measured (1645179.960 kI ±0.268% -- CPU Instructions Retired)
    ◷ test_N128_000_P99 measured (32508.527 kB ±9.987% -- Memory Peak Physical)
    ✔ test_N128_000_P99 (102.902 seconds)
    ◷ test_N32_000_P90 measured (0.213 kB ±32851.496% -- Memory Physical)
    ◷ test_N32_000_P90 measured (0.021 s ±8.174% -- Clock Monotonic Time)
    ◷ test_N32_000_P90 measured (65035.156 kC ±5.113% -- CPU Cycles)
    ◷ test_N32_000_P90 measured (0.021 s ±6.914% -- CPU Time)
    ◷ test_N32_000_P90 measured (402137.006 kI ±0.260% -- CPU Instructions Retired)
    ◷ test_N32_000_P90 measured (29592.928 kB ±3.962% -- Memory Peak Physical)
    ✔ test_N32_000_P90 (22.021 seconds)
    ◷ test_N32_000_P95 measured (1.868 kB ±1076.128% -- Memory Physical)
    ◷ test_N32_000_P95 measured (0.020 s ±2.949% -- Clock Monotonic Time)
    ◷ test_N32_000_P95 measured (65599.130 kC ±2.728% -- CPU Cycles)
    ◷ test_N32_000_P95 measured (0.021 s ±2.834% -- CPU Time)
    ◷ test_N32_000_P95 measured (408456.691 kI ±0.269% -- CPU Instructions Retired)
    ◷ test_N32_000_P95 measured (29447.291 kB ±3.953% -- Memory Peak Physical)
    ✔ test_N32_000_P95 (21.507 seconds)
    ◷ test_N32_000_P99 measured (1.540 kB ±1232.007% -- Memory Physical)
    ◷ test_N32_000_P99 measured (0.021 s ±4.458% -- Clock Monotonic Time)
    ◷ test_N32_000_P99 measured (66672.530 kC ±3.603% -- CPU Cycles)
    ◷ test_N32_000_P99 measured (0.021 s ±4.054% -- CPU Time)
    ◷ test_N32_000_P99 measured (410983.691 kI ±0.300% -- CPU Instructions Retired)
    ◷ test_N32_000_P99 measured (30896.194 kB ±3.862% -- Memory Peak Physical)
    ✔ test_N32_000_P99 (22.023 seconds)
    ◷ test_N65_000_P95 measured (7.782 kB ±2216.907% -- Memory Physical)
    ◷ test_N65_000_P95 measured (0.046 s ±39.846% -- Clock Monotonic Time)
    ◷ test_N65_000_P95 measured (138505.212 kC ±8.116% -- CPU Cycles)
    ◷ test_N65_000_P95 measured (0.045 s ±11.278% -- CPU Time)
    ◷ test_N65_000_P95 measured (827705.558 kI ±0.202% -- CPU Instructions Retired)
    ◷ test_N65_000_P95 measured (34844.574 kB ±12.870% -- Memory Peak Physical)
    ✔ test_N65_000_P95 (47.605 seconds)
    ◷ test_N65_000_P99 measured (1.769 kB ±3256.883% -- Memory Physical)
    ◷ test_N65_000_P99 measured (0.043 s ±6.957% -- Clock Monotonic Time)
    ◷ test_N65_000_P99 measured (136957.053 kC ±6.658% -- CPU Cycles)
    ◷ test_N65_000_P99 measured (0.043 s ±6.829% -- CPU Time)
    ◷ test_N65_000_P99 measured (826861.843 kI ±0.190% -- CPU Instructions Retired)
    ◷ test_N65_000_P99 measured (32794.722 kB ±3.095% -- Memory Peak Physical)
    ✔ test_N65_000_P99 (44.548 seconds)
    ◷ testN_128_000_P90 measured (5.980 kB ±3716.101% -- Memory Physical)
    ◷ testN_128_000_P90 measured (0.090 s ±9.049% -- Clock Monotonic Time)
    ◷ testN_128_000_P90 measured (281590.020 kC ±7.385% -- CPU Cycles)
    ◷ testN_128_000_P90 measured (0.089 s ±7.589% -- CPU Time)
    ◷ testN_128_000_P90 measured (1653193.797 kI ±0.206% -- CPU Instructions Retired)
    ◷ testN_128_000_P90 measured (38027.493 kB ±9.647% -- Memory Peak Physical)
    ✔ testN_128_000_P90 (92.495 seconds)
    ◷ testN_65_000_P90 measured (2.589 kB ±8488.166% -- Memory Physical)
    ◷ testN_65_000_P90 measured (0.047 s ±12.659% -- Clock Monotonic Time)
    ◷ testN_65_000_P90 measured (145036.862 kC ±9.390% -- CPU Cycles)
    ◷ testN_65_000_P90 measured (0.046 s ±10.177% -- CPU Time)
    ◷ testN_65_000_P90 measured (832159.682 kI ±0.214% -- CPU Instructions Retired)
    ◷ testN_65_000_P90 measured (35104.539 kB ±9.203% -- Memory Peak Physical)
    ✔ testN_65_000_P90 (48.406 seconds)

TestTopP_Performance_V2
    ◷ test_N128_000_P95 measured (0.077 s ±33.918% -- Clock Monotonic Time)
    ◷ test_N128_000_P95 measured (196943.310 kC ±11.187% -- CPU Cycles)
    ◷ test_N128_000_P95 measured (0.071 s ±20.629% -- CPU Time)
    ◷ test_N128_000_P95 measured (1111854.005 kI ±0.382% -- CPU Instructions Retired)
    ◷ test_N128_000_P95 measured (29311.272 kB ±14.990% -- Memory Peak Physical)
    ✔ test_N128_000_P95 (80.344 seconds)
    ◷ test_N128_000_P99 measured (8.290 kB ±4676.801% -- Memory Physical)
    ◷ test_N128_000_P99 measured (0.082 s ±42.816% -- Clock Monotonic Time)
    ◷ test_N128_000_P99 measured (198304.818 kC ±12.388% -- CPU Cycles)
    ◷ test_N128_000_P99 measured (0.073 s ±21.558% -- CPU Time)
    ◷ test_N128_000_P99 measured (1121332.206 kI ±0.401% -- CPU Instructions Retired)
    ◷ test_N128_000_P99 measured (34606.531 kB ±10.817% -- Memory Peak Physical)
    ✔ test_N128_000_P99 (85.492 seconds)
    ◷ test_N32_000_P90 measured (0.015 s ±11.016% -- Clock Monotonic Time)
    ◷ test_N32_000_P90 measured (46062.976 kC ±4.268% -- CPU Cycles)
    ◷ test_N32_000_P90 measured (0.015 s ±6.072% -- CPU Time)
    ◷ test_N32_000_P90 measured (280553.446 kI ±0.428% -- CPU Instructions Retired)
    ◷ test_N32_000_P90 measured (34489.041 kB ±3.691% -- Memory Peak Physical)
    ✔ test_N32_000_P90 (15.780 seconds)
    ◷ test_N32_000_P95 measured (0.015 s ±43.637% -- Clock Monotonic Time)
    ◷ test_N32_000_P95 measured (45237.220 kC ±5.280% -- CPU Cycles)
    ◷ test_N32_000_P95 measured (0.014 s ±8.673% -- CPU Time)
    ◷ test_N32_000_P95 measured (277023.196 kI ±0.404% -- CPU Instructions Retired)
    ◷ test_N32_000_P95 measured (33862.271 kB ±1.525% -- Memory Peak Physical)
    ✔ test_N32_000_P95 (15.837 seconds)
    ◷ test_N32_000_P99 measured (3.293 kB ±2611.092% -- Memory Physical)
    ◷ test_N32_000_P99 measured (0.016 s ±13.668% -- Clock Monotonic Time)
    ◷ test_N32_000_P99 measured (48686.407 kC ±6.283% -- CPU Cycles)
    ◷ test_N32_000_P99 measured (0.016 s ±10.576% -- CPU Time)
    ◷ test_N32_000_P99 measured (287838.247 kI ±0.340% -- CPU Instructions Retired)
    ◷ test_N32_000_P99 measured (37742.199 kB ±6.715% -- Memory Peak Physical)
    ✔ test_N32_000_P99 (16.898 seconds)
    ◷ test_N65_000_P95 measured (4.194 kB ±4372.566% -- Memory Physical)
    ◷ test_N65_000_P95 measured (0.031 s ±14.098% -- Clock Monotonic Time)
    ◷ test_N65_000_P95 measured (96489.701 kC ±7.844% -- CPU Cycles)
    ◷ test_N65_000_P95 measured (0.031 s ±10.953% -- CPU Time)
    ◷ test_N65_000_P95 measured (572346.162 kI ±0.256% -- CPU Instructions Retired)
    ◷ test_N65_000_P95 measured (39609.876 kB ±8.816% -- Memory Peak Physical)
    ✔ test_N65_000_P95 (32.762 seconds)
    ◷ test_N65_000_P99 measured (6.472 kB ±2415.075% -- Memory Physical)
    ◷ test_N65_000_P99 measured (0.030 s ±10.742% -- Clock Monotonic Time)
    ◷ test_N65_000_P99 measured (95108.473 kC ±7.934% -- CPU Cycles)
    ◷ test_N65_000_P99 measured (0.030 s ±9.401% -- CPU Time)
    ◷ test_N65_000_P99 measured (568125.871 kI ±0.342% -- CPU Instructions Retired)
    ◷ test_N65_000_P99 measured (39889.273 kB ±6.857% -- Memory Peak Physical)
    ✔ test_N65_000_P99 (31.608 seconds)
    ◷ testN_128_000_P90 measured (0.071 s ±21.709% -- Clock Monotonic Time)
    ◷ testN_128_000_P90 measured (197164.046 kC ±8.500% -- CPU Cycles)
    ◷ testN_128_000_P90 measured (0.068 s ±14.464% -- CPU Time)
    ◷ testN_128_000_P90 measured (1146862.676 kI ±0.208% -- CPU Instructions Retired)
    ◷ testN_128_000_P90 measured (41047.884 kB ±8.322% -- Memory Peak Physical)
    ✔ testN_128_000_P90 (73.053 seconds)
    ◷ testN_65_000_P90 measured (2.458 kB ±11606.004% -- Memory Physical)
    ◷ testN_65_000_P90 measured (0.042 s ±29.106% -- Clock Monotonic Time)
    ◷ testN_65_000_P90 measured (101845.961 kC ±11.781% -- CPU Cycles)
    ◷ testN_65_000_P90 measured (0.039 s ±16.946% -- CPU Time)
    ◷ testN_65_000_P90 measured (570316.550 kI ±0.400% -- CPU Instructions Retired)
    ◷ testN_65_000_P90 measured (39027.245 kB ±8.353% -- Memory Peak Physical)
    ✔ testN_65_000_P90 (43.893 seconds)
```