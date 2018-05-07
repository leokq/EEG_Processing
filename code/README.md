data_jieduan.m ---> 实现数据重叠截断

wavelete_energy_decompose.m ---> 实现小波7层分解（每次分解一个通道信号），并计算delta、theta、Alpha、beta波的能量 

energy.m ---> 实现信号16通道能量计算（调用wavelete_energy_decompose.m）

main.m ----> 主函数