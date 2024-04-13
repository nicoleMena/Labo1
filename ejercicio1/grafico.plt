set terminal png
set output "grafico.png"

set xdata time
set timefmt "%d-%m-%Y %H:%M:%S"
set format x "%H:%M:%S"
set ylabel "Uso (%)"
set title "Uso de CPU y Memoria de procesar_info.sh"

plot "archivo_log.txt" using 1:3 title "CPU" with lines,      "archivo_log.txt" using 1:4 title "Memoria" with lines
