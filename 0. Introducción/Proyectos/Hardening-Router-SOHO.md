# 🛡️ Proyecto: Hardening (Endurecimiento) de Infraestructura de Red SOHO

## 📋 Resumen Ejecutivo
**Rol:** Especialista de Soporte IT / Seguridad
**Escenario:** Cliente residencial/pequeña empresa con infraestructura de red expuesta debido a configuraciones de fábrica (Default Settings).
**Objetivo:** Mitigar la superficie de ataque y asegurar la integridad de la red aplicando el marco de "Defensa en Profundidad".

---

## 🚨 Evaluación de Riesgos (Estado Inicial)
Durante la auditoría inicial del dispositivo de borde (Router/Gateway), se identificaron las siguientes vulnerabilidades críticas:

| Vulnerabilidad | Nivel de Riesgo | Impacto Potencial |
| :--- | :--- | :--- |
| **Credenciales por Defecto** | 🔴 Crítico | Acceso administrativo total (`admin`/`admin`) permite a un atacante tomar control de la red. |
| **Firmware Desactualizado** | 🟠 Alto | Exposición a CVEs conocidos y exploits públicos. |
| **WPS Habilitado** | 🟠 Alto | Susceptible a ataques de fuerza bruta (Pixie Dust) para obtener acceso Wi-Fi. |
| **Gestión Remota Activa** | 🟡 Medio | El puerto 80/443 expuesto a la WAN permite intentos de login desde internet. |

---

## 🛠️ Procedimiento de Remediación (Hardening)

Se aplicaron los siguientes controles de seguridad basándose en las mejores prácticas (OWASP / NIST):

### 1. Gestión de Identidad y Acceso (IAM)
* **Acción:** Cambio de credenciales administrativas.
* **Política:** Se implementó una contraseña robusta (>12 caracteres, alfanumérica) y se eliminó la cuenta de "invitado".

### 2. Actualización y Parcheo
* **Acción:** Actualización de Firmware a la última versión estable del fabricante.
* **Resultado:** Cierre de brechas de seguridad conocidas y mejora en la estabilidad del stack TCP/IP.

### 3. Reducción de Superficie de Ataque
* **Deshabilitar WPS:** Se apagó el *Wi-Fi Protected Setup* para bloquear vectores de ataque automatizados.
* **Deshabilitar UPnP:** Se cerró el protocolo *Universal Plug and Play* para evitar que malware interno abra puertos sin autorización.
* **Gestión Remota:** Se bloqueó el acceso al panel de administración desde la WAN (Internet); solo accesible vía LAN (Local).

### 4. Segmentación de Red (Aislamiento)
* **Implementación:** Configuración de **SSID de Invitados** (Guest Network) con aislamiento de AP.
* **Beneficio:** Los visitantes tienen acceso a Internet, pero **NO** pueden ver ni acceder a los equipos internos (Servidores, Impresoras, PCs), previniendo movimiento lateral en caso de que el dispositivo de un invitado esté infectado.

---

## ✅ Conclusión y Validación
Tras la implementación, se realizaron pruebas de conectividad y escaneo básico (Nmap) desde el exterior, confirmando que los puertos de gestión están cerrados (Filtered/Closed) y la red interna está segregada del tráfico de invitados.

> **Nota Técnica:** Este procedimiento demuestra la aplicación práctica del **Dominio 4 del CISSP (Seguridad de Redes)** en un entorno real.
