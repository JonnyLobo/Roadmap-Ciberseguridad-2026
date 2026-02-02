# 📡 Análisis de Tráfico de Red y Segmentación

## 📋 Resumen de la Actividad
Ejecución de análisis de paquetes (Packet Sniffing) y validación de arquitectura de red. El objetivo fue identificar patrones de comunicación TCP/IP y verificar la eficacia de la segmentación de red y el enmascaramiento de identidad (VPN).

## 1. Segmentación y Control de Acceso (CIDR)
Se analizó la estructura de subredes para diseñar controles contra el **Movimiento Lateral**.

| CIDR | Máscara | IPs Disponibles | Evaluación de Seguridad |
| :--- | :--- | :--- | :--- |
| **/24** | 255.255.255.0 | ~254 Hosts | **Recomendado:** Crea micro-segmentos que facilitan la contención de intrusiones. |
| **/16** | 255.255.0.0 | ~65,534 Hosts | **Riesgo Alto:** Una red plana permite a un atacante saltar de "Ventas" a "Servidores" sin pasar por un Firewall. |

> **Mitigación:** Implementar VLANs y reglas de Firewall entre subredes para bloquear tráfico no autorizado.

## 2. Inspección de Protocolo TCP (Wireshark)
Utilizando Wireshark, se capturó el "Three-Way Handshake" para validar el estado de los puertos.

### Análisis de Banderas (Flags):
* **SYN:** Solicitud de inicio. Un alto volumen sin respuesta indica posible escaneo (SYN Flood).
* **SYN/ACK:** Respuesta del servidor. Confirma que el servicio está **Activo** y escuchando.
* **ACK:** Conexión establecida exitosamente.

## 3. Análisis de Privacidad y Enrutamiento (VPN)
Se realizó una prueba de trazabilidad (`tracert google.com`) con y sin túnel VPN (ProtonVPN).

* **Escenario A (Sin VPN):** El primer salto revela la IP del Router local (`192.168.x.x`) y expone la ubicación al ISP.
* **Escenario B (Con VPN):** El tráfico es "secuestrado" inmediatamente. El primer salto visible es la IP del Túnel (`10.x.x.x`).
* **Conclusión:** La VPN encapsula efectivamente el tráfico en Capa 3, ocultando la topología de la red origen.

---

### 📝 Notas Conceptuales (Analogía Didáctica)
*Para fines de explicación a usuarios no técnicos:*
> **"La Red es un Barrio"**
> * **Subred:** Es el barrio cerrado.
> * **IP:** Es la dirección de cada casa (`192.168.1.10`).
> * **Puerto:** Es la habitación específica (Cocina = Puerto 80, Sala = Puerto 443).
> * **Gateway:** Es la caseta de vigilancia (`192.168.1.1`) por donde todos deben pasar para salir a la ciudad (Internet).
