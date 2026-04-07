---
theme: default
title: "IoT Soil Moisture Detection — Digital Agriculture"
info: |
  Soil Moisture Detection with ESP32
  Based on Microsoft IoT for Beginners — Lesson 6
class: text-left
drawings:
  persist: false
transition: fade
mdc: true
highlighter: shiki
colorSchema: dark
fonts:
  sans: 'Inter'
  mono: 'Fira Code'
---

<div class="absolute inset-0 bg-gradient-to-br from-[#0a2e1a] via-[#0d3d1f] to-[#071a10]" />

<div class="relative z-10 flex flex-col h-full justify-center pl-16">

<div class="text-[#4ade80] text-sm font-mono tracking-widest uppercase mb-4" v-motion="{ initial: { opacity: 0, x: -50 }, enter: { opacity: 1, x: 0, transition: { duration: 800 } } }">
  IoT at VGU · Advanced Embedded
</div>

<h1 v-motion="{ initial: { opacity: 0, y: 50 }, enter: { opacity: 1, y: 0, transition: { duration: 1000, delay: 200 } } }">
  <span class="text-white font-bold leading-tight">Soil Moisture</span><br><span class="text-[#4ade80]">Detection System</span>
</h1>

<div class="mt-4 text-gray-300 text-lg max-w-lg" v-motion="{ initial: { opacity: 0 }, enter: { opacity: 1, transition: { duration: 1000, delay: 600 } } }">
  Bridging the gap between raw physical environments and digital intelligence using ESP32, sensors, and machine learning.
</div>

<div class="mt-8 flex gap-3 text-sm text-gray-400" v-motion="{ initial: { opacity: 0, y: 20 }, enter: { opacity: 1, y: 0, transition: { duration: 800, delay: 1000 } } }">
  <span class="bg-[#1a4d2a] px-3 py-1 rounded-full border border-[#2d7a40]">📡 MQTT Protocol</span>
  <span class="bg-[#1a4d2a] px-3 py-1 rounded-full border border-[#2d7a40]">🌱 Deep Dive Sensors</span>
  <span class="bg-[#1a4d2a] px-3 py-1 rounded-full border border-[#2d7a40]">🔌 ESP32 Processing</span>
</div>

</div>

<img src="./images/lesson-6.jpg" class="absolute right-0 top-0 h-full w-[45%] object-cover opacity-20" v-motion="{ initial: { opacity: 0 }, enter: { opacity: 0.2, transition: { duration: 1500 } } }" />

---
layout: center
class: text-center
transition: slide-up
---

<div class="absolute inset-0 bg-[#071810]" />

<div class="relative z-10" v-motion="{ initial: { scale: 0.8, opacity: 0 }, enter: { scale: 1, opacity: 1, transition: { duration: 600 } } }">

## Part I

# <span class="text-[#4ade80]">MQTT & IoT Protocols</span>

<div class="text-gray-400 mt-3">Refresher: How IoT devices talk to each other — and to the cloud</div>

</div>

---
transition: fade
---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">Protocol Refresher</h2>
<h1 class="text-white text-3xl font-bold mb-8">The Landscape of IoT Communication</h1>

<div class="grid grid-cols-3 gap-4">
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-5 hover:border-[#4ade80] transition-colors">
    <div class="text-[#4ade80] text-2xl mb-2">📡</div>
    <div class="text-white font-bold text-lg">MQTT</div>
    <div class="text-gray-400 text-sm mt-2">Low bandwidth, pub/sub over TCP. The standard for constrained devices & telemetry.</div>
  </div>

  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-5">
    <div class="text-[#4ade80] text-2xl mb-2">🌐</div>
    <div class="text-white font-bold text-lg">HTTP / REST</div>
    <div class="text-gray-400 text-sm mt-2">Request/response. High overhead, better suited for dashboard configurations.</div>
  </div>

  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-5">
    <div class="text-[#4ade80] text-2xl mb-2">📶</div>
    <div class="text-white font-bold text-lg">LoRaWAN</div>
    <div class="text-gray-400 text-sm mt-2">Long-range, ultra-low power. Great for farm sensors spanning several kilometers.</div>
  </div>
</div>

<div class="mt-6 grid grid-cols-2 gap-4">
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4 flex gap-4 items-center">
    <div class="text-2xl">🔵</div>
    <div>
      <div class="text-white font-bold">Bluetooth LE</div>
      <div class="text-gray-400 text-sm">Short range, ideal for nearby sensors and wearables.</div>
    </div>
  </div>

  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4 flex gap-4 items-center">
    <div class="text-2xl">🕸️</div>
    <div>
      <div class="text-white font-bold">Zigbee</div>
      <div class="text-gray-400 text-sm">Mesh networking. Nodes relay data, good for building scales.</div>
    </div>
  </div>
</div>

</div>

---
transition: slide-left
---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">MQTT Deep Dive</h2>
<h1 class="text-white text-3xl font-bold mb-8">Why MQTT is our backbone</h1>

<div class="grid grid-cols-2 gap-10">

<div class="space-y-6">
  <div v-click class="flex gap-4 items-start">
    <div class="w-10 h-10 rounded-full bg-[#14532d] flex items-center justify-center text-[#4ade80] font-bold flex-shrink-0">P</div>
    <div>
      <div class="text-white font-bold text-lg">Publish / Subscribe Pattern</div>
      <div class="text-gray-400 text-sm mt-1">Devices publish to topics; subscribers listen. No direct IP coupling between devices.</div>
    </div>
  </div>

  <div v-click class="flex gap-4 items-start">
    <div class="w-10 h-10 rounded-full bg-[#14532d] flex items-center justify-center text-[#4ade80] font-bold flex-shrink-0">B</div>
    <div>
      <div class="text-white font-bold text-lg">Central Message Broker</div>
      <div class="text-gray-400 text-sm mt-1">A broker routes all messages securely. It holds messages if disconnected.</div>
    </div>
  </div>

  <div v-click class="flex gap-4 items-start">
    <div class="w-10 h-10 rounded-full bg-[#14532d] flex items-center justify-center text-[#4ade80] font-bold flex-shrink-0">Q</div>
    <div>
      <div class="text-white font-bold text-lg">Quality of Service (QoS)</div>
      <div class="text-gray-400 text-sm mt-1">Dictates delivery guarantees — QoS 0 (fire &amp; forget), QoS 1 (at least once), QoS 2 (exactly once).</div>
    </div>
  </div>
</div>

<div class="h-full flex items-center justify-center" v-click>
  <div class="bg-gradient-to-br from-[#0d2b17] to-[#071810] rounded-2xl p-6 border border-[#2d7a40] shadow-2xl w-full">
    <div class="text-center font-mono text-[#4ade80] text-sm mb-4 bg-[#14532d]/40 rounded-lg py-2">Typical Architecture</div>
    
```text
[ Sensor Node ] -> Publish
       │
      MQTT
       ▼
 [ Broker ]  -> Topic: vgu/soil/moisture
       │
      MQTT
       ▼
[ Dashboard ] -> Subscribe
```
  </div>
</div>

</div>

</div>

---
layout: center
class: text-center
transition: slide-up
---

<div class="absolute inset-0 bg-[#071810]" />

<div class="relative z-10" v-motion="{ initial: { scale: 0.8, opacity: 0 }, enter: { scale: 1, opacity: 1, transition: { duration: 600 } } }">

## Part II

# <span class="text-[#4ade80]">Our Project</span>

<div class="text-gray-400 mt-3">Smart soil moisture tracking at VGU</div>

</div>

---
transition: fade
---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-10">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">Introduction</h2>
<h1 class="text-white text-3xl font-bold mb-6">Automated Soil Moisture Monitoring at VGU</h1>

<div class="grid grid-cols-2 gap-8 items-center">

<div class="space-y-4">
  <p class="text-gray-300 text-base leading-relaxed" v-click>
    Plants need precise water amounts to survive. <span class="text-[#4ade80] font-semibold">Too little</span> starves roots, while <span class="text-[#4ade80] font-semibold">too much</span> suffocates them. Manual watering relies purely on guesswork.
  </p>
  <p class="text-gray-300 text-base leading-relaxed" v-click>
    Our system deploys an intelligent ESP32-based network across VGU to constantly measure & calibrate actual soil status, empowering a smart watering pipeline.
  </p>
  
  <div class="mt-4 p-4 border-l-4 border-[#4ade80] bg-[#14532d]/30" v-click>
    <div class="text-white font-semibold">Moisture sensors are just one type of sensor!</div>
    <div class="text-sm text-gray-400 mt-1">To understand how we get this data over the internet, we must first understand how to read varying signals locally.</div>
  </div>
</div>

<div class="flex items-center justify-center h-full" v-click>
  <div class="relative rounded-2xl overflow-hidden border-2 border-[#2d7a40] bg-[#0d2b17] shadow-[0_0_30px_rgba(74,222,128,0.15)] flex flex-col items-center justify-center w-full aspect-video">
    <div class="text-center flex flex-col items-center justify-center w-full h-full p-4">
      <div class="text-6xl mb-4 animate-pulse">🌿</div>
      <div class="text-sm font-mono text-[#4ade80]">watering-vgu.png</div>
      <div class="text-xs mt-2 text-gray-400">VGU Campus Watering Overview</div>
    </div>
  </div>
</div>

</div>

</div>

---
layout: center
class: text-center
transition: slide-up
---

<div class="absolute inset-0 bg-[#071810]" />

<div class="relative z-10" v-motion="{ initial: { scale: 0.8, opacity: 0 }, enter: { scale: 1, opacity: 1, transition: { duration: 600 } } }">

## Part III

# <span class="text-[#4ade80]">Understanding Sensors</span>

<div class="text-gray-400 mt-3">Protocols & Architectures: GPIO, Analog, I²C, SPI, Wireless</div>

</div>

---
transition: fade
---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">Hardware Protocols</h2>
<h1 class="text-white text-3xl font-bold mb-6">How Sensors Communicate Locally</h1>

<div class="grid grid-cols-3 gap-4">
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
    <div class="text-[#4ade80] font-mono font-bold text-base mb-2">GPIO</div>
    <div class="text-gray-300 text-sm">General Purpose Pins. Digital signals only — strictly HIGH / LOW. Used for simple buttons, LEDs or relay switches.</div>
  </div>

  <div v-click class="bg-gradient-to-b from-[#14532d] to-[#0d2b17] border border-[#4ade80] rounded-xl p-4 shadow-[0_0_20px_rgba(74,222,128,0.1)]">
    <div class="text-white font-mono font-bold text-base mb-2 flex items-center justify-between">
      <span>Analog Pin (ADC)</span>
      <span class="text-xs bg-[#4ade80] text-black px-2 py-0.5 rounded-full">Our Focus</span>
    </div>
    <div class="text-gray-300 text-sm">Converts voltage to a 12-bit digital number (0–4095). Essential for measuring variable physical conditions.</div>
  </div>

  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
    <div class="text-[#4ade80] font-mono font-bold text-base mb-2">I²C</div>
    <div class="text-gray-300 text-sm">Multi-device bus using just 2 wires (SDA/SCL). Every device has a unique address. Found in smart sensors.</div>
  </div>

  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
    <div class="text-[#4ade80] font-mono font-bold text-base mb-2">SPI</div>
    <div class="text-gray-300 text-sm">Full-duplex, high speed. Controller selects peripherals via Chip Select wires. Used for fast memory/screens.</div>
  </div>

  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
    <div class="text-[#4ade80] font-mono font-bold text-base mb-2">Wireless</div>
    <div class="text-gray-300 text-sm">Bluetooth LE, WiFi, LoRa. Decouples the sensor probe from the main MCU gateway entirely.</div>
  </div>
</div>

</div>

---
layout: center
class: text-center
transition: slide-up
---

<div class="absolute inset-0 bg-[#071810]" />

<div class="relative z-10" v-motion="{ initial: { scale: 0.8, opacity: 0 }, enter: { scale: 1, opacity: 1, transition: { duration: 600 } } }">

## Part IV

# <span class="text-[#4ade80]">The Soil Moisture Pipeline</span>

<div class="text-gray-400 mt-3">Devices → Data Sampling → Model Construction → Live Inference</div>

</div>

---
transition: fade
---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">Step 1: Hardware</h2>
<h1 class="text-white text-3xl font-bold mb-6">Our Core Devices</h1>

<div class="grid grid-cols-2 gap-8 items-center">

<div class="space-y-4">
  <div v-click class="flex gap-4 items-center bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4 hover:border-[#4ade80] transition-colors">
    <img src="./images/esp32-node-mcu-32s.png" class="w-16 h-16 object-contain rounded-lg" alt="ESP32" />
    <div>
      <div class="text-white font-bold">ESP32 NodeMCU-32S</div>
      <div class="text-gray-400 text-sm">Powerful dual-core MCU handling Wi-Fi/MQTT bridging while reading ADC inputs concurrently.</div>
    </div>
  </div>

  <div v-click class="flex gap-4 items-center bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4 hover:border-[#4ade80] transition-colors">
    <img src="./images/fc28-moisture-detection.jpg" class="w-16 h-16 object-contain rounded-lg" alt="Sensor" />
    <div>
      <div class="text-white font-bold">Capacitive Moisture Sensor</div>
      <div class="text-gray-400 text-sm">Translates soil capacitance into analog voltage without the degrading electrolysis of resistive probes.</div>
    </div>
  </div>
</div>

<div class="h-full relative rounded-2xl overflow-hidden border-2 border-[#2d7a40] bg-[#0d2b17]" v-click>
  <div class="text-center text-gray-500 w-full h-full flex flex-col items-center justify-center p-4">
    <div class="text-5xl mb-3">🛠️</div>
    <div class="text-sm font-mono text-[#4ade80]">devices.png</div>
    <div class="text-xs mt-2 text-gray-400">Device configuration overview</div>
  </div>
</div>

</div>

</div>

---
transition: fade
---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">Step 2: Data Ground Truth</h2>
<h1 class="text-white text-3xl font-bold mb-6">Sampling & Calibration Process</h1>

<div class="grid grid-cols-2 gap-8">

<div class="space-y-4">
  <div class="text-gray-300 text-sm leading-relaxed" v-click>
    An analog pin gives an arbitrary voltage (e.g. 0-4095). We map this to true moisture via <span class="text-[#4ade80] font-semibold">Gravimetric Sampling</span>:
  </div>

  <div class="space-y-3">
    <div v-click class="flex gap-4 items-center">
      <div class="w-6 h-6 rounded-full bg-[#4ade80] text-black text-xs font-bold flex items-center justify-center flex-shrink-0">1</div>
      <div class="text-white text-sm bg-[#0d2b17] py-2 px-4 rounded-xl border border-[#1a4d2a] w-full">Record analog voltage on ESP32</div>
    </div>
    <div v-click class="flex gap-4 items-center">
      <div class="w-6 h-6 rounded-full bg-[#4ade80] text-black text-xs font-bold flex items-center justify-center flex-shrink-0">2</div>
      <div class="text-white text-sm bg-[#0d2b17] py-2 px-4 rounded-xl border border-[#1a4d2a] w-full">Weigh wet soil sample in lab (W<sub>wet</sub>)</div>
    </div>
    <div v-click class="flex gap-4 items-center">
      <div class="w-6 h-6 rounded-full bg-[#4ade80] text-black text-xs font-bold flex items-center justify-center flex-shrink-0">3</div>
      <div class="text-white text-sm bg-[#0d2b17] py-2 px-4 rounded-xl border border-[#1a4d2a] w-full">Oven dry at 110°C, weigh again (W<sub>dry</sub>)</div>
    </div>
    <div v-click class="flex gap-4 items-center">
      <div class="w-6 h-6 rounded-full bg-[#4ade80] text-black text-xs font-bold flex items-center justify-center flex-shrink-0">4</div>
      <div class="text-white text-sm bg-[#0d2b17] py-2 px-4 rounded-xl border border-[#1a4d2a] w-full">Calculate: ((W<sub>wet</sub> - W<sub>dry</sub>) / W<sub>dry</sub>) × 100%</div>
    </div>
  </div>
</div>

<div class="grid grid-cols-1 gap-4" v-click>
  <div class="bg-[#0d2b17] border border-[#2d7a40] rounded-xl flex flex-col items-center justify-center h-36">
    <div class="text-2xl mb-1">📸</div>
    <span class="font-mono text-[#4ade80] text-xs">raw-moisture-measure-sample.png</span>
  </div>
  <div class="bg-[#0d2b17] border border-[#2d7a40] rounded-xl flex flex-col items-center justify-center h-36">
    <div class="text-2xl mb-1">🗺️</div>
    <span class="font-mono text-[#4ade80] text-xs">sampling-ground.png</span>
  </div>
</div>

</div>

</div>

---
transition: fade
---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">Step 2: Linear Regression Model</h2>
<h1 class="text-white text-3xl font-bold mb-6">Building The Calibration Equation</h1>

<div class="grid grid-cols-2 gap-8 items-center">

<div class="space-y-5">
  <div class="text-gray-300 text-sm leading-relaxed" v-click>
    With arrays of [Voltage → True %] mappings gathered, we train a simple 1D Linear Regression model.
  </div>

  <div class="bg-gradient-to-r from-[#14532d] to-[#0d2b17] border border-[#4ade80] rounded-xl p-4 shadow-xl" v-click>
    <div class="font-mono text-center text-lg text-white">
      moisture_% = <span class="text-[#4ade80]">m</span> × voltage + <span class="text-[#4ade80]">b</span>
    </div>
    <div class="text-center text-gray-400 text-xs mt-2">Slope (m) and Intercept (b) derived from least-squares fit.</div>
  </div>

  <div class="space-y-3 text-sm text-gray-300 bg-[#0d2b17] p-4 rounded-xl border border-[#1a4d2a]" v-click>
    <div class="font-bold text-white mb-2">Crucial Behavior:</div>
    <ul class="list-disc pl-5 space-y-1">
      <li><strong>Capacitive Sensors</strong>: Voltage <span class="text-red-400">Drops</span> when moisture <span class="text-[#4ade80]">Rises</span>. Negative correlation (m < 0).</li>
      <li>Model is flashed directly to ESP32 avoiding cloud latency.</li>
    </ul>
  </div>
</div>

<div class="h-full rounded-2xl border border-[#2d7a40] bg-[#0d2b17] flex flex-col items-center justify-center shadow-xl" v-click>
  <div class="text-5xl mb-4">📈</div>
  <div class="text-sm font-mono text-[#4ade80]">regression.png</div>
  <div class="text-xs mt-2 text-gray-400">Best-fit calibration line (Voltage vs. Moisture %)</div>
</div>

</div>

</div>

---
transition: fade
---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">Step 3: ESP32 IoT Code</h2>
<h1 class="text-white text-3xl font-bold mb-5">Acquiring & Encoding Values</h1>

<div class="grid grid-cols-2 gap-8">

<div class="bg-[#071810]/80 rounded-xl border hover:border-[#4ade80] transition-colors overflow-hidden group shadow-2xl relative" v-click>
<div class="absolute inset-0 pointer-events-none border border-transparent shadow-[0_0_20px_rgba(74,222,128,0)] group-hover:shadow-[0_0_20px_rgba(74,222,128,0.2)] transition-shadow"></div>

```cpp {all|6,7|10-14|15|19-20|all}
// ESP32 Microcontroller Core
#include <Arduino.h>

const int SENSOR_PIN = 34;

// Trained Calibration coefficients
const float m = -0.062f; 
const float b = 73.4f;

float acquireMoisture() {
  long sum = 0;
  for (int i=0; i<10; i++) {
    sum += analogRead(SENSOR_PIN); delay(5);
  }
  float voltage = (sum / 10.0) * (3.3 / 4095.0);
  return (m * voltage) + b;
}

// Push to broker via MQTT PubSubClient
mqtt.publish("vgu/soil/sensor1", String(acquireMoisture()).c_str());
```
</div>

<div class="space-y-6 flex flex-col justify-center">
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-5 border-l-4 border-l-[#4ade80]">
    <div class="text-white font-bold mb-1">Local Smoothing</div>
    <div class="text-gray-400 text-sm">We take 10 rapid samples locally, averaging out electrical interference from the ESP32 ADC itself.</div>
  </div>

  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-5 border-l-4 border-l-[#4ade80]">
    <div class="text-white font-bold mb-1">Direct Voltage Conversion</div>
    <div class="text-gray-400 text-sm">Convert the 12-bit ADC value (0-4095) down to the 3.3v reference bracket before utilizing the linear model.</div>
  </div>
</div>

</div>

</div>

---
transition: fade
---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">Step 4: Live Inference</h2>
<h1 class="text-white text-3xl font-bold mb-6">Moving Average & Application Insight</h1>

<div class="grid grid-cols-2 gap-8 items-center">

<div class="space-y-6">
  <div class="text-gray-300 text-base leading-relaxed" v-click>
    To trigger an actual water pump actuator, we need unshakeable reliability. A single sensor read glitch could waste water.
  </div>

  <div class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-5" v-click>
    <div class="text-[#4ade80] font-bold text-lg mb-3">Implementation Strategy:</div>
    <div class="space-y-3">
      <div class="flex items-center gap-3">
        <div class="bg-[#1a4d2a] w-8 h-8 rounded shrink-0 flex items-center justify-center">⏱️</div>
        <div class="text-sm text-gray-300">Measure consistently over distinct periods (e.g. 5 min intervals).</div>
      </div>
      <div class="flex items-center gap-3">
        <div class="bg-[#1a4d2a] w-8 h-8 rounded shrink-0 flex items-center justify-center">🧮</div>
        <div class="text-sm text-gray-300">Calculate a <b class="text-white">Sliding/Moving Average</b> of the last 'n' readings spanning multiple intervals.</div>
      </div>
      <div class="flex items-center gap-3">
        <div class="bg-[#1a4d2a] w-8 h-8 rounded shrink-0 flex items-center justify-center">🔌</div>
        <div class="text-sm text-gray-300">Use MQTT to subscribe a Relay device; if Avg < Threshold, execute water cycle.</div>
      </div>
    </div>
  </div>
</div>

<div class="h-full rounded-2xl border border-[#2d7a40] bg-[#0d2b17] flex flex-col items-center justify-center shadow-xl" v-click>
  <div class="text-5xl mb-4">🔄</div>
  <div class="text-sm font-mono text-[#4ade80]">pipeline.png</div>
  <div class="text-xs mt-2 text-gray-400">End-to-End Inference Logic Diagram</div>
</div>

</div>

</div>

---
transition: fade
---

<div class="absolute inset-0 bg-gradient-to-br from-[#0a2e1a] via-[#0d3d1f] to-[#071a10]" />

<div class="relative z-10 h-full flex flex-col justify-center items-center text-center px-12">

<div class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-4" v-motion="{ initial: { opacity: 0, y: -20 }, enter: { opacity: 1, y: 0, transition: { duration: 800 } } }">
  Summary
</div>

<h1 class="text-white text-5xl font-bold mb-10" v-motion="{ initial: { opacity: 0, scale: 0.9 }, enter: { opacity: 1, scale: 1, transition: { duration: 1000, delay: 200 } } }">
  What We Constructed
</h1>

<div class="grid grid-cols-4 gap-6 w-full max-w-5xl">
  <div v-click class="bg-[#0d2b17]/80 backdrop-blur border border-[#1a4d2a] rounded-2xl p-6 hover:-translate-y-2 transition-transform duration-300 shadow-xl">
    <div class="text-4xl mb-4">📡</div>
    <div class="text-[#4ade80] font-bold text-lg mb-2">MQTT Topology</div>
    <div class="text-gray-400 text-sm">Robust pub/sub logic guaranteeing telemetry reaches the broker efficiently.</div>
  </div>

  <div v-click class="bg-[#0d2b17]/80 backdrop-blur border border-[#1a4d2a] rounded-2xl p-6 hover:-translate-y-2 transition-transform duration-300 shadow-xl">
    <div class="text-4xl mb-4">🔌</div>
    <div class="text-[#4ade80] font-bold text-lg mb-2">Hardware</div>
    <div class="text-gray-400 text-sm">ESP32 interacting with an analog capacitive soil moisture sensor locally.</div>
  </div>

  <div v-click class="bg-[#0d2b17]/80 backdrop-blur border border-[#1a4d2a] rounded-2xl p-6 hover:-translate-y-2 transition-transform duration-300 shadow-xl">
    <div class="text-4xl mb-4">📊</div>
    <div class="text-[#4ade80] font-bold text-lg mb-2">Calibration Base</div>
    <div class="text-gray-400 text-sm">Linear regression generated from ground-truth gravimetric lab measurements.</div>
  </div>

  <div v-click class="bg-[#0d2b17]/80 backdrop-blur border border-[#1a4d2a] rounded-2xl p-6 hover:-translate-y-2 transition-transform duration-300 shadow-xl">
    <div class="text-4xl mb-4">🧠</div>
    <div class="text-[#4ade80] font-bold text-lg mb-2">Smoothing Logic</div>
    <div class="text-gray-400 text-sm">Moving averages to reject noise and reliably trigger physical watering events.</div>
  </div>
</div>

<div class="mt-12 text-gray-500 text-sm tracking-wide font-mono" v-motion="{ initial: { opacity: 0 }, enter: { opacity: 1, transition: { duration: 1000, delay: 1000 } } }">
  // Microsoft IoT for Beginners · VGU Custom Application
</div>

</div>