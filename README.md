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
V1.n=16_000, p=0.90   189208.000 ns ±   5.37 %       1000
V1.n=32_000, p=0.90   358292.000 ns ±   1.79 %       1000
V1.n=64_000, p=0.90   785000.000 ns ±   3.95 %       1000
V1.n=128_000, p=0.90 1676625.000 ns ±   2.54 %       1000

cumsum V1.n=16_000     56833.000 ns ±   4.42 %       1000
cumsum V1.n=32_000    113250.000 ns ±   4.54 %       1000
cumsum V1.n=64_000    236917.000 ns ±   3.81 %       1000
cumsum V1.n=128_000   489292.000 ns ±   5.08 %       1000

V2.n=16_000, p=0.90   145958.000 ns ±  18.46 %       1000
V2.n=32_000, p=0.90   224917.000 ns ±   5.09 %       1000
V2.n=64_000, p=0.90   665750.000 ns ±   5.61 %       1000
V2.n=128_000, p=0.90 1151020.500 ns ±   8.68 %       1000

cumsum V2.n=16_000      9000.000 ns ±  88.01 %       1000
cumsum V2.n=32_000     16375.000 ns ± 133.69 %       1000
cumsum V2.n=64_000     29666.500 ns ±  67.85 %       1000
cumsum V2.n=128_000    60479.500 ns ±  18.18 %       1000
```

XCTests results (1000 iterations)

```
TestCumsum_Performance_V1
    ◷ test_cumsum_N128_000 measured (14.320 kB ±433.950% -- Memory Physical)
    ◷ test_cumsum_N128_000 measured (0.026 s ±5.444% -- Clock Monotonic Time)
    ◷ test_cumsum_N128_000 measured (84694.982 kC ±5.247% -- CPU Cycles)
    ◷ test_cumsum_N128_000 measured (0.026 s ±5.368% -- CPU Time)
    ◷ test_cumsum_N128_000 measured (525180.230 kI ±0.583% -- CPU Instructions Retired)
    ◷ test_cumsum_N128_000 measured (25225.242 kB ±23.556% -- Memory Peak Physical)
    ✔ test_cumsum_N128_000 (27.348 seconds)
    ◷ test_cumsum_N16_000 measured (1.688 kB ±322.574% -- Memory Physical)
    ◷ test_cumsum_N16_000 measured (0.003 s ±1.409% -- Clock Monotonic Time)
    ◷ test_cumsum_N16_000 measured (11193.489 kC ±0.895% -- CPU Cycles)
    ◷ test_cumsum_N16_000 measured (0.003 s ±1.237% -- CPU Time)
    ◷ test_cumsum_N16_000 measured (68542.716 kI ±0.241% -- CPU Instructions Retired)
    ◷ test_cumsum_N16_000 measured (27341.756 kB ±1.781% -- Memory Peak Physical)
    ✔ test_cumsum_N16_000 (4.086 seconds)
    ◷ test_cumsum_N32_000 measured (4.817 kB ±1009.440% -- Memory Physical)
    ◷ test_cumsum_N32_000 measured (0.007 s ±7.273% -- Clock Monotonic Time)
    ◷ test_cumsum_N32_000 measured (21934.105 kC ±5.036% -- CPU Cycles)
    ◷ test_cumsum_N32_000 measured (0.007 s ±5.371% -- CPU Time)
    ◷ test_cumsum_N32_000 measured (133896.646 kI ±0.684% -- CPU Instructions Retired)
    ◷ test_cumsum_N32_000 measured (31467.870 kB ±5.233% -- Memory Peak Physical)
    ✔ test_cumsum_N32_000 (7.481 seconds)
    ◷ test_cumsum_N64_000 measured (6.701 kB ±1064.257% -- Memory Physical)
    ◷ test_cumsum_N64_000 measured (0.013 s ±10.112% -- Clock Monotonic Time)
    ◷ test_cumsum_N64_000 measured (42634.394 kC ±3.383% -- CPU Cycles)
    ◷ test_cumsum_N64_000 measured (0.013 s ±6.369% -- CPU Time)
    ◷ test_cumsum_N64_000 measured (263856.856 kI ±0.242% -- CPU Instructions Retired)
    ◷ test_cumsum_N64_000 measured (35194.282 kB ±7.697% -- Memory Peak Physical)
    ✔ test_cumsum_N64_000 (14.318 seconds)

TestCumsum_Performance_V2
    ◷ test_cumsum_N128_000 measured (1.425 kB ±1651.909% -- Memory Physical)
    ◷ test_cumsum_N128_000 measured (0.000 s ±6.872% -- Clock Monotonic Time)
    ◷ test_cumsum_N128_000 measured (1354.813 kC ±3.445% -- CPU Cycles)
    ◷ test_cumsum_N128_000 measured (0.000 s ±4.870% -- CPU Time)
    ◷ test_cumsum_N128_000 measured (5590.434 kI ±0.629% -- CPU Instructions Retired)
    ◷ test_cumsum_N128_000 measured (34829.584 kB ±0.648% -- Memory Peak Physical)
    ✔ test_cumsum_N128_000 (1.032 seconds)
    ◷ test_cumsum_N16_000 measured (0.492 kB ±707.892% -- Memory Physical)
    ◷ test_cumsum_N16_000 measured (0.000 s ±8.117% -- Clock Monotonic Time)
    ◷ test_cumsum_N16_000 measured (907.667 kC ±2.982% -- CPU Cycles)
    ◷ test_cumsum_N16_000 measured (0.000 s ±4.010% -- CPU Time)
    ◷ test_cumsum_N16_000 measured (3591.490 kI ±0.464% -- CPU Instructions Retired)
    ◷ test_cumsum_N16_000 measured (35944.122 kB ±0.662% -- Memory Peak Physical)
    ✔ test_cumsum_N16_000 (0.809 seconds)
    ◷ test_cumsum_N32_000 measured (0.180 kB ±948.204% -- Memory Physical)
    ◷ test_cumsum_N32_000 measured (0.000 s ±2.972% -- Clock Monotonic Time)
    ◷ test_cumsum_N32_000 measured (967.306 kC ±2.237% -- CPU Cycles)
    ◷ test_cumsum_N32_000 measured (0.000 s ±2.772% -- CPU Time)
    ◷ test_cumsum_N32_000 measured (3876.980 kI ±0.376% -- CPU Instructions Retired)
    ◷ test_cumsum_N32_000 measured (35980.789 kB ±0.209% -- Memory Peak Physical)
    ✔ test_cumsum_N32_000 (0.842 seconds)
    ◷ test_cumsum_N64_000 measured (0.541 kB ±2168.120% -- Memory Physical)
    ◷ test_cumsum_N64_000 measured (0.000 s ±119.342% -- Clock Monotonic Time)
    ◷ test_cumsum_N64_000 measured (1104.556 kC ±6.489% -- CPU Cycles)
    ◷ test_cumsum_N64_000 measured (0.000 s ±8.718% -- CPU Time)
    ◷ test_cumsum_N64_000 measured (4448.900 kI ±1.207% -- CPU Instructions Retired)
    ◷ test_cumsum_N64_000 measured (36324.231 kB ±0.460% -- Memory Peak Physical)
    ✔ test_cumsum_N64_000 (0.976 seconds)

TestTopP_Performance_V1
    ◷ test_N128_000_P90 measured (2.572 kB ±5554.796% -- Memory Physical)
    ◷ test_N128_000_P90 measured (0.126 s ±5.816% -- Clock Monotonic Time)
    ◷ test_N128_000_P90 measured (398770.465 kC ±4.230% -- CPU Cycles)
    ◷ test_N128_000_P90 measured (0.126 s ±4.373% -- CPU Time)
    ◷ test_N128_000_P90 measured (2344353.509 kI ±0.170% -- CPU Instructions Retired)
    ◷ test_N128_000_P90 measured (35560.212 kB ±9.814% -- Memory Peak Physical)
    ✔ test_N128_000_P90 (129.375 seconds)
    ◷ test_N16_000_P90 measured (2.261 kB ±1708.203% -- Memory Physical)
    ◷ test_N16_000_P90 measured (0.015 s ±5.025% -- Clock Monotonic Time)
    ◷ test_N16_000_P90 measured (49124.168 kC ±2.557% -- CPU Cycles)
    ◷ test_N16_000_P90 measured (0.016 s ±3.631% -- CPU Time)
    ◷ test_N16_000_P90 measured (294222.805 kI ±0.150% -- CPU Instructions Retired)
    ◷ test_N16_000_P90 measured (33713.932 kB ±4.124% -- Memory Peak Physical)
    ✔ test_N16_000_P90 (16.392 seconds)
    ◷ test_N32_000_P90 measured (2.703 kB ±2123.961% -- Memory Physical)
    ◷ test_N32_000_P90 measured (0.031 s ±5.644% -- Clock Monotonic Time)
    ◷ test_N32_000_P90 measured (98522.649 kC ±4.209% -- CPU Cycles)
    ◷ test_N32_000_P90 measured (0.031 s ±4.582% -- CPU Time)
    ◷ test_N32_000_P90 measured (587712.002 kI ±0.224% -- CPU Instructions Retired)
    ◷ test_N32_000_P90 measured (35152.676 kB ±6.406% -- Memory Peak Physical)
    ✔ test_N32_000_P90 (32.258 seconds)
    ◷ test_N64_000_P90 measured (5.505 kB ±1857.417% -- Memory Physical)
    ◷ test_N64_000_P90 measured (0.063 s ±7.239% -- Clock Monotonic Time)
    ◷ test_N64_000_P90 measured (198458.744 kC ±4.588% -- CPU Cycles)
    ◷ test_N64_000_P90 measured (0.063 s ±5.034% -- CPU Time)
    ◷ test_N64_000_P90 measured (1164228.450 kI ±0.187% -- CPU Instructions Retired)
    ◷ test_N64_000_P90 measured (35758.376 kB ±6.752% -- Memory Peak Physical)
    ✔ test_N64_000_P90 (65.420 seconds)

TestTopP_Performance_V2
    ◷ test_N128_000_P90 measured (0.098 s ±3.538% -- Clock Monotonic Time)
    ◷ test_N128_000_P90 measured (307348.727 kC ±1.097% -- CPU Cycles)
    ◷ test_N128_000_P90 measured (0.097 s ±1.880% -- CPU Time)
    ◷ test_N128_000_P90 measured (1821969.451 kI ±0.105% -- CPU Instructions Retired)
    ◷ test_N128_000_P90 measured (29214.871 kB ±12.871% -- Memory Peak Physical)
    ✔ test_N128_000_P90 (101.175 seconds)
    ◷ test_N16_000_P90 measured (1.393 kB ±4170.049% -- Memory Physical)
    ◷ test_N16_000_P90 measured (0.012 s ±6.261% -- Clock Monotonic Time)
    ◷ test_N16_000_P90 measured (39024.430 kC ±2.603% -- CPU Cycles)
    ◷ test_N16_000_P90 measured (0.012 s ±4.133% -- CPU Time)
    ◷ test_N16_000_P90 measured (229714.179 kI ±0.411% -- CPU Instructions Retired)
    ◷ test_N16_000_P90 measured (27752.908 kB ±3.873% -- Memory Peak Physical)
    ✔ test_N16_000_P90 (13.216 seconds)
    ◷ test_N32_000_P90 measured (1.540 kB ±1744.539% -- Memory Physical)
    ◷ test_N32_000_P90 measured (0.024 s ±4.306% -- Clock Monotonic Time)
    ◷ test_N32_000_P90 measured (76074.894 kC ±1.666% -- CPU Cycles)
    ◷ test_N32_000_P90 measured (0.024 s ±2.759% -- CPU Time)
    ◷ test_N32_000_P90 measured (450803.238 kI ±0.237% -- CPU Instructions Retired)
    ◷ test_N32_000_P90 measured (29400.614 kB ±3.322% -- Memory Peak Physical)
    ✔ test_N32_000_P90 (25.463 seconds)
    ◷ test_N64_000_P90 measured (5.521 kB ±2317.039% -- Memory Physical)
    ◷ test_N64_000_P90 measured (0.049 s ±5.004% -- Clock Monotonic Time)
    ◷ test_N64_000_P90 measured (153396.032 kC ±3.431% -- CPU Cycles)
    ◷ test_N64_000_P90 measured (0.048 s ±3.744% -- CPU Time)
    ◷ test_N64_000_P90 measured (904739.855 kI ±0.244% -- CPU Instructions Retired)
    ◷ test_N64_000_P90 measured (31600.019 kB ±9.153% -- Memory Peak Physical)
    ✔ test_N64_000_P90 (50.349 seconds)
```