# 🏗️ Arquitectura de Laboratorio SOC (Home Lab)

## Resumen Ejecutivo
Despliegue de un entorno virtualizado controlado (Sandbox) para la simulación de ataques (Red Team) y monitoreo de seguridad (Blue Team). El entorno replica una red corporativa segmentada utilizando VMware Workstation en modo Bridged para interactuar con dispositivos reales.

## 🔧 Especificaciones Técnicas

| Rol | SO / Activo | Dirección IP (Estática) | Función |
| :--- | :--- | :--- | :--- |
| **Atacante** | Kali Linux 2024.x | `192.168.1.107` | Ejecución de escaneos (Nmap) y explotación. |
| **Víctima** | Windows 11 Enterprise | `192.168.1.103` | Endpoint monitoreado para logs de eventos. |
| **Gateway** | Router Físico | `192.168.1.1` | Salida a internet y gestión de tráfico. |

## 🛠️ Resolución de Problemas (Troubleshooting)
Durante la implementación se resolvieron los siguientes conflictos de red:
* **Aislamiento de Red:** Se migró de NAT a **Bridged Mode** para permitir visibilidad directa entre el host atacante y la víctima.
* **Gestión de Interfaces:** Corrección manual del adaptador `VMnet0` apuntando al controlador Realtek PCIe para evitar conflictos de drivers.
* **Reglas de Firewall:** Se ajustaron las reglas de entrada ICMP en Windows Defender para permitir la detección de host (Ping) durante las pruebas de conectividad.
