## 📅 Día 2: Segmentación y Máscaras de Subred
**Concepto Clave:** La máscara de subred actúa como un muro de contención para limitar el tráfico y mejorar la seguridad.

### Tabla de Referencia (CIDR):
| CIDR | Máscara | IPs Disponibles | Uso Típico |
| :--- | :--- | :--- | :--- |
| **/24** | 255.255.255.0 | ~254 Hosts | Red doméstica o VLAN departamental (Pequeña). |
| **/16** | 255.255.0.0 | ~65,534 Hosts | Infraestructura corporativa amplia (Grande). |

### Seguridad:
- **Segmentación:** Dividir una red grande (/16) en varias pequeñas (/24) impide el **Movimiento Lateral**. Si un atacante infecta una PC en "Ventas", no puede saltar directamente a "Servidores" si están en subredes distintas separadas por un Firewall.

---

## 📅 Día 3: Protocolo DNS y Análisis con Wireshark
**Concepto Clave:** El DNS es la "agenda telefónica" de internet. Los atacantes lo usan para esconder sus servidores.

### Ejercicio Práctico:
Intercepté tráfico real visitando `www.ferrari.com` usando Wireshark y el filtro `dns`.

### Estructura de la Petición DNS:
1. **Standard Query (La Pregunta):** Mi PC pregunta "¿Cuál es la IP de ferrari.com?".
2. **Standard Query Response (La Respuesta):** El servidor responde.

   Día 1 — Fundamentos de Redes (Networking Basics)
Este módulo documenta mi primer día en el Roadmap hacia Analista SOC / Blue Team.
Aquí construí los fundamentos de redes que necesito para analizar tráfico, detectar intrusiones y entender cómo se mueve un atacante dentro de una red.

🧠 Conceptos clave aprendidos
✔ Dirección IP
Identificador único de un dispositivo en la red.
✔ Máscara de subred
Determina cuántos hosts caben en una red.
✔ Puerta de enlace (Gateway)
Ruta por la que salen los dispositivos hacia otras redes.

🌍 Analogía del “Barrio” (Subredes explicadas)
Una subred es un barrio:
La dirección del barrio → 192.168.1.0/24

Cada casa → una IP (192.168.1.10, 192.168.1.20, etc.)
La calle principal por donde entra y sale todo → el Gateway (192.168.1.1)
El tamaño del barrio depende del /CIDR
/24 = barrio de 254 casas
/16 = ciudad más grande
/8 = enorme población
Esta analogía me permite visualizar redes con claridad y evitó confusiones.

🖥️ Cómo ver tu IP (Kali y Windows)
🔹 Kali Linux
ip a
🔹 Windows
ipconfig
🛠️ Configuración de VMs en Bridged (VMware)
En este día aprendí a:
Configurar VMnet0 en modo Puente (Bridged)
Seleccionar la tarjeta física correcta (Ethernet real)

— Escaneo SYN + Wireshark (Primer laboratorio real)
Este módulo documenta mi primera interacción real entre Kali y Windows dentro de una red bridged.
Aquí aprendo a ver ataques en vivo, capturar paquetes y analizar lo que hace un atacante.

🔥 Herramientas utilizadas
Nmap → para escaneo sigiloso (SYN Stealth)
Wireshark → para capturar y analizar paquetes
VMware → red bridged (192.168.1.x)

🧠 Conceptos clave aprendidos
✔ Escaneo SYN Stealth (-sS)
Ataque sigiloso muy usado por pentesters/hackers.
Solo envía un SYN y observa la respuesta:
SYN/ACK → puerto abierto
RST → puerto cerrado
Silencio → puerto filtrado (firewall)
✔ -Pn → Ignorar Ping
Obliga a Nmap a escanear aunque el host no responda ICMP.
✔ Windows Firewall filtra puertos por defecto
Windows ignora conexiones desconocidas → por eso los puertos aparecen como filtered.

🧪 Comandos ejecutados
🔹 Escaneo de puertos:
nmap -sS -Pn 192.168.1.103

🔹 Filtro en Wireshark:
tcp.flags.syn == 1 && tcp.flags.ack == 0
📉 Interpretación del resultado

Nmap mostró:
All 1000 scanned ports are in ignored states.
Not shown: 1000 filtered tcp ports (no-response)


Esto significa:
Kali envió SYN
Windows escuchó
Windows NO respondió (bloqueado por firewall)
Nmap detecta “filtered”
Este comportamiento es típico de sistemas modernos protegidos.

📊 Wireshark — ¿Qué observé?

✔ SYN desde Kali → Windows
✔ Tráfico HTTPS legítimo desde Windows hacia Internet
✔ Paquetes filtrados
✔ Retransmisiones
✔ RST (puertos cerrados)
✔ Diferencia entre tráfico legítimo y tráfico del escaneo

📂 Archivos incluidos
nmap_syn_scan.md
wireshark_syn_filter.md
nmap_syn_scan_windows_vm.pcap
syn_screenshot.png
