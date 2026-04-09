---
theme: default
title: "IoT Soil Moisture Detection — Digital Agriculture"
info: |
  Soil Moisture Detection with ESP32
  VGU IoT Project Presentation
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

<div class="text-[#4ade80] text-sm font-mono tracking-widest uppercase mb-4">IoT at VGU · Digital Agriculture</div>

# <span class="text-white font-bold leading-tight">Soil Moisture</span><br><span class="text-[#4ade80]">Detection System</span>

<div class="mt-4 text-gray-300 text-lg max-w-lg">
From raw sensor readings to calibrated soil data — sensors, protocols & machine learning on ESP32.
</div>

<div class="mt-8 flex gap-3 text-sm text-gray-400">
  <span class="bg-[#1a4d2a] px-3 py-1 rounded-full border border-[#2d7a40]">🌱 Soil Science</span>
  <span class="bg-[#1a4d2a] px-3 py-1 rounded-full border border-[#2d7a40]">🔌 Sensors & Protocols</span>
  <span class="bg-[#1a4d2a] px-3 py-1 rounded-full border border-[#2d7a40]">📊 Calibration</span>
</div>

</div>

<img src="./images/lesson-6.jpg" class="absolute right-0 top-0 h-full w-[45%] object-cover opacity-20" />

<!--
Welcome. Today we bridge the gap between raw sensor data and real-world meaning.
We'll look at sensors, protocols, calibration, and how to build a soil moisture pipeline on ESP32.
-->

---
layout: center
class: text-center
---

<div class="absolute inset-0 bg-[#071810]" />

<div class="relative z-10">

## Part 1

# <span class="text-[#4ade80]">Soil Moisture Project</span>

<div class="text-gray-400 mt-3">What is it and why does it matter?</div>

</div>

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">Project Introduction</h2>
<h1 class="text-white text-3xl font-bold mb-6">What is Soil Moisture Detection?</h1>

<div class="grid grid-cols-2 gap-8 items-center">

<div class="space-y-4">
  <p class="text-gray-300 text-base leading-relaxed" v-click>
    Plants need water to survive — but <span class="text-[#4ade80] font-semibold">too little</span> starves roots, and <span class="text-[#4ade80] font-semibold">too much</span> suffocates them. Manual watering is unreliable and wasteful.
  </p>
  <p class="text-gray-300 text-base leading-relaxed" v-click>
    Our project deploys <span class="text-[#4ade80] font-semibold">ESP32-based soil moisture sensors</span> across VGU campus to measure, calibrate, and infer real soil water content — enabling intelligent, data-driven watering decisions.
  </p>
  <div class="flex gap-3 mt-4 flex-wrap" v-click>
    <span class="bg-[#14532d] text-[#4ade80] px-3 py-1 rounded-full text-sm border border-[#2d7a40]">🌱 Resistive Sensor</span>
    <span class="bg-[#14532d] text-[#4ade80] px-3 py-1 rounded-full text-sm border border-[#2d7a40]">🔌 ESP32</span>
    <span class="bg-[#14532d] text-[#4ade80] px-3 py-1 rounded-full text-sm border border-[#2d7a40]">📊 Linear Regression</span>
  </div>
</div>

<div v-click class="rounded-2xl overflow-hidden border-2 border-[#2d7a40] bg-[#0d2b17] flex flex-col items-center justify-center aspect-square">
  <div class="text-6xl mb-4 animate-pulse">🌿</div>
  <img src="images/watering-vgu.jpg" alt="VGU Campus Watering System" class="max-w-full h-auto" />
  <div class="text-xs mt-2 text-gray-400">VGU Campus Watering System</div>
</div>

</div>

</div>

<!--
This is the "why" slide. IoT devices remove guesswork from irrigation — precision agriculture at campus scale.
-->

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">Motivation</h2>
<h1 class="text-white text-3xl font-bold mb-6">Why Is This Important?</h1>

<div class="grid grid-cols-2 gap-8 items-center">

<div class="space-y-4">
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
    <div class="text-white font-bold mb-1">🌊 Photosynthesis</div>
    <div class="text-gray-400 text-sm">Plants create carbohydrates and oxygen through a chemical reaction with water, CO₂ and light.</div>
  </div>
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
    <div class="text-white font-bold mb-1">💨 Transpiration</div>
    <div class="text-gray-400 text-sm">Water carries nutrients around the plant and cools it — similar to how humans sweat.</div>
  </div>
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
    <div class="text-white font-bold mb-1">🌿 Structure</div>
    <div class="text-gray-400 text-sm">Plants are 90% water. Without enough, they wilt and die.</div>
  </div>
  <div v-click class="mt-2 p-3 border-l-4 border-[#4ade80] bg-[#14532d]/30 text-sm text-gray-300">
    IoT sensors help farmers water <b class="text-white">only when needed</b> — not too wet, not too dry.
  </div>
</div>

<div v-click class="w-full flex justify-center">
  <img 
    src="./images/soil-moisture-intro.png" 
    class="w-full max-w-[1800px] h-auto rounded-xl border-2 border-[#1a4d2a] shadow-2xl" 
    alt="Soil moisture introduction" 
  />
</div>

</div>

</div>

---
layout: center
class: text-center
---

<div class="absolute inset-0 bg-[#071810]" />

<div class="relative z-10">

## Part 2

# <span class="text-[#4ade80]">Sensors & Communication</span>

<div class="text-gray-400 mt-3">How do we measure the environment?</div>

</div>

<!--
How do we measure the environment? Sensor. Sensors are hardware devices that sense the physical world.
-->

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">Sensing the Physical World</h2>
<h1 class="text-white text-3xl font-bold mb-6">What Is a Sensor?</h1>

<div class="grid grid-cols-2 gap-8 items-center">

<div class="space-y-4">
  <p class="text-gray-300 text-sm leading-relaxed" v-click>
    As we learned in Lesson 3 <i>"Sensors and Actuators"</i>, sensors are <span class="text-[#4ade80] font-semibold">hardware devices that sense the physical world</span> — they measure one or more properties around them and send the information to an IoT device.
  </p>
  <p class="text-gray-300 text-sm leading-relaxed" v-click>
    Sensors cover a huge range of devices — from natural properties such as <span class="text-white">air temperature</span> to physical interactions such as <span class="text-white">movement</span>.
  </p>
  <div v-click class="mt-4 p-4 border-l-4 border-[#4ade80] bg-[#14532d]/30">
    <div class="text-white font-semibold">A moisture sensor is just one type of sensor!</div>
    <div class="text-sm text-gray-400 mt-1">But how does it talk to our microcontroller?</div>
  </div>
</div>

<div v-click>
  <img src="./images/what-is-a-sensor.png" class="rounded-xl border border-[#1a4d2a] w-full object-contain" alt="What is a sensor" />
</div>

</div>

</div>

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">Communication Protocols</h2>
<h1 class="text-white text-3xl font-bold mb-6">How Do Sensors Talk to IoT Devices?</h1>

<div class="grid grid-cols-2 gap-8 items-center">

<div class="space-y-4">
  <p class="text-gray-300 text-sm leading-relaxed" v-click>
    Microcontrollers communicate with peripherals (sensors, screens, motors) through these fundamental methods:
  </p>
  <div class="grid grid-cols-2 gap-3 mt-2">
    <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-lg p-3 text-center">
      <div class="text-[#4ade80] font-mono font-bold">GPIO</div>
      <div class="text-gray-400 text-xs">Direct pin control</div>
    </div>
    <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-lg p-3 text-center">
      <div class="text-[#4ade80] font-mono font-bold">I²C</div>
      <div class="text-gray-400 text-xs">Addressed bus</div>
    </div>
    <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-lg p-3 text-center">
      <div class="text-[#4ade80] font-mono font-bold">UART</div>
      <div class="text-gray-400 text-xs">Point-to-point</div>
    </div>
    <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-lg p-3 text-center">
      <div class="text-[#4ade80] font-mono font-bold">SPI</div>
      <div class="text-gray-400 text-xs">High-speed bus</div>
    </div>
  </div>
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-lg p-3 text-center">
    <div class="text-[#4ade80] font-mono font-bold">Wireless</div>
    <div class="text-gray-400 text-xs">BLE, WiFi, LoRa, Zigbee</div>
  </div>
</div>

<div v-click>
  <img src="./images/communication-methods.jpg" class="rounded-xl border border-[#1a4d2a] w-full object-contain" alt="Communication methods" />
</div>

</div>

</div>

<!--
Through these fundamental methods: GPIO, I2C, UART, SPI, Wireless. Next, we look into each.
-->

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">2.1 — GPIO</h2>
<h1 class="text-white text-3xl font-bold mb-4">Digital GPIO</h1>

<div class="grid grid-cols-2 gap-8 items-center">

<div class="space-y-4">
  <div class="space-y-3">
    <p class="text-gray-300 text-sm" v-click>
      <b class="text-[#4ade80]">GPIO:</b> General Purpose Input/Output. Programmable pins used as digital or analog building blocks.
    </p>
    <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-3 text-sm">
      <div class="text-white font-bold mb-1">Digital GPIO (Binary)</div>
      <ul class="text-gray-400 list-disc list-inside">
        <li><b class="text-white">Input:</b> Read state (e.g., button press)</li>
        <li><b class="text-white">Output:</b> Set state (e.g., LED control)</li>
      </ul>
    </div>
  </div>
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
    <div class="text-white font-bold mb-2">Digital GPIO — Binary States</div>
    <div class="text-gray-400 text-sm space-y-2">
      <div>Pins operate in binary: <span class="text-[#4ade80] font-mono">1</span> (HIGH) or <span class="text-[#4ade80] font-mono">0</span> (LOW).</div>
      <div><b class="text-white">Input:</b> Read voltage at pin (e.g. is a button pressed?)</div>
      <div><b class="text-white">Output:</b> Set voltage on pin (e.g. turn an LED on/off)</div>
    </div>
  </div>
</div>

<div v-click>
  <img src="./images/digital-signal-graph.png" class="rounded-xl border border-[#1a4d2a] w-full object-contain" alt="Digital signal" />
</div>

</div>

</div>

<!--
Digital pins work in binary: HIGH or LOW. Think of a button press (input) or turning an LED on (output).
-->

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">2.1 — GPIO</h2>
<h1 class="text-white text-3xl font-bold mb-4">Analog GPIO</h1>

<div class="grid grid-cols-2 gap-8 items-start">

<div class="space-y-4">
  <div v-click class="bg-gradient-to-b from-[#14532d] to-[#0d2b17] border border-[#4ade80] rounded-xl p-4">
    <div class="text-white font-bold mb-2 flex items-center justify-between">
      <span>Analog GPIO — Continuous Range</span>
      <span class="text-xs bg-[#4ade80] text-black px-2 py-0.5 rounded-full">Our Focus</span>
    </div>
    <div class="text-gray-300 text-sm space-y-2">
      <div>Unlike digital, analog pins deal with <span class="text-[#4ade80]">continuous voltage ranges</span> (0 to 3.3V or 5V).</div>
      <div><b class="text-white">Input (ADC):</b> Translates incoming voltage into a N-bit number that the computer can read - such as 10-bit (0–1023), 12-bit (0–4095), etc.</div>
      <div><b class="text-white">Output (DAC):</b> Converts a digital number back into a physical voltage output.</div>
    </div>
  </div>
  <div v-click>
    <img src="./images/analog-signal-graph.png" class="rounded-xl border border-[#1a4d2a] w-full object-contain" alt="Analog signal" />
  </div>
</div>

<div v-click>
  <img src="./images/signal-to-pin.png" class="rounded-xl border border-[#1a4d2a] w-full object-contain" alt="Signal to pin mapping" />
  <div class="text-xs text-gray-500 mt-2 text-center">Digital square wave vs. Analog continuous wave</div>
</div>

</div>

</div>

<!--
Analog pins handle continuous voltages. An ADC converts voltage to a number. Our soil sensor uses this!
-->

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">2.2 — I²C</h2>
<h1 class="text-white text-3xl font-bold mb-6">Inter-Integrated Circuit</h1>

<div class="grid grid-cols-2 gap-8 items-center">

<div class="space-y-4">
  <p class="text-gray-300 text-sm leading-relaxed" v-click>
    I²C is a <span class="text-[#4ade80] font-semibold">multi-controller, multi-peripheral</span> protocol. Any device on the bus can act as either a peripheral or a controller. Data is sent as <span class="text-white">addressed packets</span>.
  </p>
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
    <div class="text-white font-bold mb-3">4-Wire System</div>
    <div class="grid grid-cols-2 gap-2 text-sm">
      <div class="bg-[#14532d]/50 rounded-lg p-2 text-center"><span class="text-[#4ade80] font-mono">SDA</span><br><span class="text-gray-400 text-xs">Serial Data</span></div>
      <div class="bg-[#14532d]/50 rounded-lg p-2 text-center"><span class="text-[#4ade80] font-mono">SCL</span><br><span class="text-gray-400 text-xs">Serial Clock</span></div>
      <div class="bg-[#14532d]/50 rounded-lg p-2 text-center"><span class="text-[#4ade80] font-mono">VCC</span><br><span class="text-gray-400 text-xs">Power Supply</span></div>
      <div class="bg-[#14532d]/50 rounded-lg p-2 text-center"><span class="text-[#4ade80] font-mono">GND</span><br><span class="text-gray-400 text-xs">Ground</span></div>
    </div>
  </div>
  <p class="text-gray-400 text-xs" v-click>Speed: Standard 100Kbps · Fast 400Kbps · High-speed 3.4Mbps</p>
</div>

<div v-click class="bg-[#0d2b17] border border-[#2d7a40] rounded-xl p-6">

```text
         VCC ────────────────────
         SCL ──┬──────┬──────┬──
         SDA ──┼──────┼──────┼──
         GND ──┼──────┼──────┼──
               │      │      │
          [Device A] [Device B] [Device C]
           addr:0x48  addr:0x50  addr:0x68
```

  <div class="text-xs text-gray-500 mt-2 text-center">Multiple devices share the same 4 wires</div>
</div>

</div>

</div>

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">2.3 & 2.4</h2>
<h1 class="text-white text-3xl font-bold mb-6">UART & SPI</h1>

<div class="grid grid-cols-2 gap-8">

<div class="space-y-4">
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
    <div class="text-[#4ade80] font-mono font-bold text-lg mb-2">UART</div>
    <div class="text-gray-300 text-sm space-y-2">
      <div>A <span class="text-white">direct connection between exactly 2 devices</span>.</div>
      <div>Uses 2 wires with a <b class="text-white">crossed pattern</b>:</div>
      <div class="font-mono text-xs text-[#4ade80] bg-[#071810] rounded p-2 mt-1">
        Device 1 Tx → Device 2 Rx<br>
        Device 1 Rx ← Device 2 Tx
      </div>
      <div class="text-gray-500 text-xs">Async · Start/Stop bits · Common baud: 9600 bps</div>
    </div>
  </div>
</div>

<div class="space-y-4">
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
    <div class="text-[#4ade80] font-mono font-bold text-lg mb-2">SPI</div>
    <div class="text-gray-300 text-sm space-y-2">
      <div><span class="text-white">Single controller, multiple peripherals</span>. Full-duplex — sends and receives simultaneously.</div>
      <div>Controller uses <b class="text-white">3 shared wires</b> + 1 chip select per peripheral:</div>
      <div class="font-mono text-xs text-[#4ade80] bg-[#071810] rounded p-2 mt-1">
        COPI · CIPO · SCLK (shared)<br>
        CS1 · CS2 (per device)
      </div>
      <div class="text-gray-500 text-xs">No speed limit · Multi-MB/s · Great for flash storage</div>
    </div>
  </div>
</div>

</div>

</div>

<!--
UART: direct 2-device link with crossed Tx/Rx wires. SPI: high-speed full-duplex with chip select lines.
-->

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">2.5 — Wireless</h2>
<h1 class="text-white text-3xl font-bold mb-6">Untethered Communication</h1>

<div class="grid grid-cols-4 gap-4">
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4 text-center">
    <div class="text-2xl mb-2">🔵</div>
    <div class="text-[#4ade80] font-mono font-bold">BLE</div>
    <div class="text-gray-400 text-xs mt-1">Short range · Low power · Wearables & nearby sensors</div>
  </div>
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4 text-center">
    <div class="text-2xl mb-2">📶</div>
    <div class="text-[#4ade80] font-mono font-bold">WiFi</div>
    <div class="text-gray-400 text-xs mt-1">Medium range · High bandwidth · Home/office IoT</div>
  </div>
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4 text-center">
    <div class="text-2xl mb-2">📡</div>
    <div class="text-[#4ade80] font-mono font-bold">LoRa</div>
    <div class="text-gray-400 text-xs mt-1">Kilometres range · μW power · Farm-scale sensing</div>
  </div>
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4 text-center">
    <div class="text-2xl mb-2">🕸️</div>
    <div class="text-[#4ade80] font-mono font-bold">Zigbee</div>
    <div class="text-gray-400 text-xs mt-1">Mesh network · Each node relays data · Building-scale</div>
  </div>
</div>

<div v-click class="mt-6 text-gray-300 text-sm leading-relaxed">
  IoT devices aren't limited to physical wires. <span class="text-[#4ade80]">Commercial soil moisture sensors</span> often send data over LoRaWAN to a hub device, which processes and forwards it over the Internet — reducing power consumption and the need for long cables.
</div>

</div>

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">2.6 — Summary</h2>
<h1 class="text-white text-3xl font-bold mb-6">Protocol Comparison</h1>

<table class="w-full text-sm border-collapse">
  <thead>
    <tr class="text-[#4ade80] border-b border-[#2d7a40]">
      <th class="py-2 text-left">Protocol</th>
      <th class="py-2 text-left">Topology</th>
      <th class="py-2 text-left">Wires</th>
      <th class="py-2 text-left">Speed</th>
      <th class="py-2 text-left">Best For</th>
    </tr>
  </thead>
  <tbody class="text-gray-300">
    <tr v-click class="border-b border-[#1a4d2a]">
      <td class="py-2 font-mono text-white">GPIO</td>
      <td>1:1 per pin</td>
      <td>1 per signal</td>
      <td>Instant</td>
      <td>On/off, ADC reads</td>
    </tr>
    <tr v-click class="border-b border-[#1a4d2a]">
      <td class="py-2 font-mono text-white">I²C</td>
      <td>Multi-device bus</td>
      <td>4 (SDA,SCL,VCC,GND)</td>
      <td>≤ 3.4 Mbps</td>
      <td>Multiple sensors</td>
    </tr>
    <tr v-click class="border-b border-[#1a4d2a]">
      <td class="py-2 font-mono text-white">UART</td>
      <td>Point-to-point</td>
      <td>2 (Tx, Rx)</td>
      <td>≤ 6.5 Mbps</td>
      <td>GPS, Serial debug</td>
    </tr>
    <tr v-click class="border-b border-[#1a4d2a]">
      <td class="py-2 font-mono text-white">SPI</td>
      <td>1 controller, N periph</td>
      <td>3 + 1/device</td>
      <td>Multi-MB/s</td>
      <td>Fast memory, screens</td>
    </tr>
    <tr v-click>
      <td class="py-2 font-mono text-white">Wireless</td>
      <td>Various</td>
      <td>0 (radio)</td>
      <td>Varies</td>
      <td>Remote, field sensors</td>
    </tr>
  </tbody>
</table>

</div>

<!--
GPIO for direct pin reads, I2C for many sensors on a bus, UART for serial links, SPI for speed, Wireless for remote.
-->

---
layout: center
class: text-center
---

<div class="absolute inset-0 bg-[#071810]" />

<div class="relative z-10">

## Part 3

# <span class="text-[#4ade80]">Sensor Calibration</span>

<div class="text-gray-400 mt-3">What do the sensor values actually mean?</div>

</div>

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12 py-10">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">3.1 — The Problem</h2>
<h1 class="text-white text-3xl font-bold mb-8">Why We Need Calibration</h1>

<div class="grid grid-cols-2 gap-8 items-stretch">
    <div class="space-y-4 flex flex-col">
      <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4 flex-1">
        <div class="text-white font-bold mb-2 text-base">⚡ Sensors speak in electricity</div>
        <div class="text-gray-400 text-sm leading-relaxed">They detect raw electrical signals — resistance, voltage, capacitance — not human-readable units.</div>
      </div>
      <div v-click class="bg-red-900/10 border border-red-800/40 rounded-xl p-4">
        <div class="text-red-400 font-bold mb-2 text-base">❌ The Problem</div>
        <div class="text-gray-300 text-sm">Imagine a temperature sensor giving you <span class="font-mono text-red-400">22.5 KΩ</span> instead of <span class="font-mono text-[#4ade80]">25°C</span>!</div>
      </div>   
      <div v-click class="bg-[#14532d]/20 border border-[#4ade80]/50 rounded-xl p-4">
        <div class="text-[#4ade80] font-bold mb-2 text-base">✓ The Solution</div>
        <div class="text-gray-300 text-sm">Calibration maps raw electrical readings to correct, understandable units through measurement and math.</div>
      </div>
    </div>
    <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-6 flex flex-col h-full">
      <div class="text-white font-bold mb-6 text-lg border-b border-[#1a4d2a] pb-2">Two Approaches:</div>     
      <div class="space-y-8 flex-grow flex flex-col justify-center">
        <div class="flex gap-4 items-start">
          <span class="text-[#4ade80] font-mono font-bold text-xl">01</span>
          <div>
            <b class="text-white text-base">"Good Enough" — Relative Threshold</b>
            <p class="text-gray-400 text-sm mt-1 leading-relaxed">Find the raw value (e.g. 600/4095) meaning "dry" for your plant and use it as trigger. No lab needed.</p>
          </div>
        </div>
        <div class="flex gap-4 items-start">
          <span class="text-[#4ade80] font-mono font-bold text-xl">02</span>
          <div>
            <b class="text-white text-base">Scientific — Absolute Calibration</b>
            <p class="text-gray-400 text-sm mt-1 leading-relaxed">Map voltage to Gravimetric/Volumetric moisture via lab samples. Required for precise data logging.</p>
          </div>
        </div>
      </div>
      <div class="mt-auto pt-4 text-[10px] text-gray-600 uppercase tracking-tighter">
        Standard Microcontroller Procedure
      </div>
    </div>
  </div>
</div>

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">3.2 & 3.3 — The Lab Process</h2>
<h1 class="text-white text-3xl font-bold mb-6">Scientific Calibration of Soil Moisture</h1>

<div class="grid grid-cols-2 gap-8 items-center">

<div class="space-y-4">
  <p class="text-gray-300 text-sm" v-click>
    Official soil moisture is measured as <span class="text-[#4ade80] font-semibold">Gravimetric</span> (weight of water per weight of soil) or <span class="text-[#4ade80] font-semibold">Volumetric</span> (volume of water per volume of soil).
  </p>
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
    <div class="text-white font-bold mb-2">Lab Process:</div>
    <div class="space-y-2 text-sm text-gray-300">
      <div class="flex gap-2"><span class="text-[#4ade80]">1.</span> Record sensor voltage for a soil sample</div>
      <div class="flex gap-2"><span class="text-[#4ade80]">2.</span> Dry the soil sample through sunlight and hair-dryer</div>
      <div class="flex gap-2"><span class="text-[#4ade80]">3.</span> Compute actual moisture %</div>
      <div class="flex gap-2"><span class="text-[#4ade80]">4.</span> Repeat at multiple wetness levels</div>
      <div class="flex gap-2"><span class="text-[#4ade80]">5.</span> Plot voltage vs. moisture → draw <b class="text-white">fitted curve</b></div>
    </div>
  </div>
  <p class="text-gray-400 text-xs" v-click>
    ⚠️ Calibration varies by soil type — clay, sand, loam all have different electrical characteristics.
  </p>
</div>

<div v-click class="space-y-4">
  <div class="bg-[#0d2b17] border border-[#2d7a40] rounded-xl p-6 text-center">
    <div class="text-gray-400 text-sm mb-2">Voltage → Moisture Mapping</div>
    <div class="font-mono text-lg text-white">moisture<span class="text-[#4ade80]">%</span> = m × voltage + b</div>
    <div class="text-gray-500 text-xs mt-2">The fitted curve lets code convert any new reading instantly</div>
  </div>
</div>

</div>

</div>

---
layout: center
class: text-center
---

<div class="absolute inset-0 bg-[#071810]" />

<div class="relative z-10">

## Part 4

# <span class="text-[#4ade80]">Our Equipment</span>

<div class="text-gray-400 mt-3">ESP32, and Soil Moisture detection sensors</div>

</div>

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">4.1 — Microcontroller</h2>
<h1 class="text-white text-3xl font-bold mb-6">ESP32</h1>

<div class="grid grid-cols-2 gap-8 items-center">

<div class="space-y-4">
  <p class="text-gray-300 text-sm leading-relaxed" v-click>
    The ESP32 is a <span class="text-[#4ade80] font-semibold">low-cost, high-performance microcontroller</span> by Espressif Systems. It has built-in <span class="text-white">Wi-Fi and Bluetooth</span>, making it ideal for IoT without extra modules.
  </p>
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
    <div class="text-white font-bold mb-2">Key Features</div>
    <div class="text-gray-400 text-sm space-y-1">
      <div>• Dual-core processor @ 240 MHz</div>
      <div>• Multiple GPIO pins (I2C, SPI, UART)</div>
      <div>• Built-in <span class="text-[#4ade80]">ADC</span> — reads analog sensors directly</div>
      <div>• Built-in Wi-Fi + Bluetooth</div>
      <div>• Programmed via Arduino IDE</div>
    </div>
  </div>
  <div v-click class="p-3 border-l-4 border-[#4ade80] bg-[#14532d]/30 text-sm text-gray-300">
    We chose ESP32 because its built-in ADC lets us read soil moisture sensors.
  </div>
</div>

<div v-click>
  <img src="./images/esp32-node-mcu-32s.png" class="rounded-xl border border-[#1a4d2a] w-full object-contain bg-white/5 p-4" alt="ESP32 NodeMCU-32S" />
</div>

</div>

</div>

<!--
The ESP32 plays a central role: collecting sensor data, processing it, and enabling wireless communication.
-->

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">4.2 — Soil Moisture Sensors</h2>
<h1 class="text-white text-3xl font-bold mb-6">Resistive</h1>

<div class="grid grid-cols-2 gap-8 items-center">

  <div class="space-y-4">
    <div v-click class="bg-[#0d2b17] border border-[#4ade80] rounded-xl p-4 ring-1 ring-[#4ade80]/30">
      <div class="text-[#4ade80] font-bold text-lg mb-2">⚡ Resistive Sensor <span class="text-xs bg-[#14532d] px-2 py-0.5 rounded-full ml-1 text-[#4ade80]">Our Choice</span></div>
      <div class="text-gray-300 text-sm leading-relaxed">
        Two metal probes in soil. Measures how much current passes between them. 
        Water conducts electricity — <span class="text-white font-medium">wetter soil = lower resistance</span>.
      </div>
      <div class="mt-2 text-xs text-red-400">
        ⚠ Corrodes over time due to electrolysis
      </div>
    </div>
  </div>

  <div v-click class="space-y-4">
    <img src="./images/fc28-moisture-detection.jpg" class="rounded-xl border border-[#1a4d2a] w-full h-52 object-cover" alt="FC-28 sensor" />
    <div class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-3 text-sm text-gray-300 text-center">
      <span class="text-white font-semibold">FC-28 Sensor</span> — Analog voltage output, read via ESP32 ADC pin
    </div>
  </div>
</div>

</div>

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">4.3 — Soil Moisture Sensors</h2>
<h1 class="text-white text-3xl font-bold mb-6">Capacitive</h1>

<div class="grid grid-cols-2 gap-8 items-center">

  <div class="space-y-4">
    <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
      <div class="text-white font-bold text-lg mb-2">🌊 Capacitive Sensor</div>
      <div class="text-gray-300 text-sm leading-relaxed">
        Measures the soil's ability to store electrical charge. Acts as a capacitor where the soil is the dielectric—<span class="text-white font-medium">wetter soil = higher capacitance</span>.
      </div>
      <div class="mt-2 text-xs text-[#4ade80]">
        ✓ No exposed metal · Corrosion-free · Extended lifespan
      </div>
    </div>
  </div>

  <div v-click class="space-y-4 flex flex-col items-center">
    <img src="./images/capacitive-moisture-sensor.jpg" class="rounded-xl border border-[#1a4d2a] w-full max-h-52 object-contain" alt="Capacitive sensor" />
    <div class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-3 text-sm text-gray-300 text-center w-full">
      <span class="text-white font-semibold">Corrosion-Resistant</span> — Integrated circuit converts capacitance to voltage
    </div>
  </div>
</div>

</div>

---
layout: center
class: text-center
---

<div class="absolute inset-0 bg-[#071810]" />

<div class="relative z-10">

## Part 5

# <span class="text-[#4ade80]">Demo & Experiment</span>

<div class="text-gray-400 mt-3">Calibrating our sensor with real soil samples</div>

</div>

<!--
Let's put this into practice. We calibrate the ESP32 and sensor by creating our own fitted curve from real soil samples.
-->

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">5.1 — Wiring</h2>
<h1 class="text-white text-3xl font-bold mb-6">Overall Architecture</h1>

<div class="flex justify-center">
  <img src="./images/circuit-board-graph.jpg" class="rounded-xl border border-[#1a4d2a] max-h-80 object-contain" alt="Circuit diagram" />
</div>

</div>

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">5.1 — Field Measurement</h2>
<h1 class="text-white text-3xl font-bold mb-4">Data Collection Flow</h1>

<div class="text-gray-400 text-sm mb-8" v-click>Repeat for multiple moisture levels (Sample 2: 1878.9 ADC)</div>

<div class="flex items-center justify-between gap-2">
  <div v-click class="flex-1 bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4 text-center relative">
    <div class="w-8 h-8 rounded-full bg-[#4ade80] text-black text-sm font-bold flex items-center justify-center mx-auto mb-3">1</div>
    <div class="text-white font-bold text-xs mb-1">Measure</div>
    <div class="text-[10px] text-gray-500">Record ADC</div>
  </div>
  <div v-click class="text-[#1a4d2a] text-xl">→</div>
  <div v-click class="flex-1 bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4 text-center relative">
    <div class="w-8 h-8 rounded-full bg-[#4ade80] text-black text-sm font-bold flex items-center justify-center mx-auto mb-3">2</div>
    <div class="text-white font-bold text-xs mb-1">Weigh Wet</div>
    <div class="text-[10px] text-gray-500">Mass W<sub>wet</sub></div>
  </div>
  <div v-click class="text-[#1a4d2a] text-xl">→</div>
  <div v-click class="flex-1 bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4 text-center relative">
    <div class="w-8 h-8 rounded-full bg-[#4ade80] text-black text-sm font-bold flex items-center justify-center mx-auto mb-3">3</div>
    <div class="text-white font-bold text-xs mb-1">Dry</div>
    <div class="text-[10px] text-gray-500">Oven / Heat</div>
  </div>
  <div v-click class="text-[#1a4d2a] text-xl">→</div>
  <div v-click class="flex-1 bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4 text-center relative">
    <div class="w-8 h-8 rounded-full bg-[#4ade80] text-black text-sm font-bold flex items-center justify-center mx-auto mb-3">4</div>
    <div class="text-white font-bold text-xs mb-1">Weigh Dry</div>
    <div class="text-[10px] text-gray-500">Mass W<sub>dry</sub></div>
  </div>
</div>

</div>

---

<div class="absolute inset-0 bg-[#08200f]" />
<div class="relative z-10 h-full flex flex-col justify-center px-12">
<h2 class="text-[#4ade80] text-sm font-mono mb-2">STEP 1</h2>
<h1 class="text-white text-3xl font-bold mb-6">Record Raw Sensor Reading</h1>
<div class="grid grid-cols-2 gap-8 items-center">
  <div class="space-y-4">
    <p class="text-gray-300">Insert the sensor into the sample soil. Record the mean ADC value from the ESP32.</p>
    <div class="bg-[#0d2b17] border border-[#4ade80] p-4 rounded-xl font-mono text-[#4ade80]">
      Mean ADC: 1878.93 (Sample 2)
    </div>
  </div>
  <img src="images/exp-1-sensor-measure.jpg" class="rounded-xl border border-[#1a4d2a] h-64 w-full object-cover" />
</div>
</div>

---

<div class="absolute inset-0 bg-[#08200f]" />
<div class="relative z-10 h-full flex flex-col justify-center px-12">
<h2 class="text-[#4ade80] text-sm font-mono mb-2">STEP 2</h2>
<h1 class="text-white text-3xl font-bold mb-6">Initial Wet Weight</h1>
<div class="grid grid-cols-2 gap-8 items-center">
  <img src="images/exp-2-wet-weight.jpg" class="rounded-xl border border-[#1a4d2a] h-64 w-full object-cover" />
  <div class="space-y-4">
    <p class="text-gray-300">Weigh the soil sample immediately after measurement to capture total water content.</p>
    <div class="bg-[#0d2b17] border border-[#1a4d2a] p-4 rounded-xl font-mono text-white text-xl">
      W<sub>wet</sub> = 242.2 g
    </div>
  </div>
</div>
</div>

---

<div class="absolute inset-0 bg-[#08200f]" />
<div class="relative z-10 h-full flex flex-col justify-center px-12">
<h2 class="text-[#4ade80] text-sm font-mono mb-2">STEP 3 & 4</h2>
<h1 class="text-white text-3xl font-bold mb-6">Drying and Final Weight</h1>
<div class="grid grid-cols-2 gap-8 items-center">
  <div class="space-y-4">
    <p class="text-gray-300">Dry at 110°C until mass is constant. The remaining mass is the solid soil part.</p>
    <div class="bg-[#0d2b17] border border-[#1a4d2a] p-4 rounded-xl font-mono text-white text-xl">
      W<sub>dry</sub> = 187.1 g
    </div>
  </div>
  <div class="grid grid-rows-2 gap-2">
    <img src="images/exp-3-hair-dryer.jpg" class="rounded-lg border border-[#1a4d2a] h-32 w-full object-cover" />
    <img src="images/exp-4-dry-weight.jpg" class="rounded-lg border border-[#1a4d2a] h-32 w-full object-cover" />
  </div>
</div>
</div>

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">5.2 — Analysis</h2>
<h1 class="text-white text-3xl font-bold mb-6">Gravimetric Soil Moisture (GSM)</h1>

<div class="grid grid-cols-2 gap-8 items-center">
<div class="space-y-4">
  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4 text-center">
    <div class="text-[#4ade80] font-mono text-sm mb-1">Moisture Content Formula:</div>
    <div class="text-white font-bold">((W<sub>wet</sub> - W<sub>dry</sub>) / W<sub>dry</sub>) &times; 100</div>
  </div>

  <div v-click class="bg-[#0d2b17] border border-[#1a4d2a] rounded-xl p-4">
    <div class="text-[#4ade80] font-semibold mb-2 text-sm">Worked Example (Sample 2):</div>
    <div class="space-y-1 text-sm text-gray-300">
      <div class="flex justify-between"><span>W<sub>wet</sub></span><span class="font-mono text-white">242.2 g</span></div>
      <div class="flex justify-between"><span>W<sub>dry</sub></span><span class="font-mono text-white">187.1 g</span></div>
      <div class="border-t border-[#1a4d2a] my-1"></div>
      <div class="flex justify-between"><span>Water Mass (Difference)</span><span class="font-mono text-white">55.1 g</span></div>
      <div class="flex justify-between text-[#4ade80] font-bold"><span>GSM Percentage</span><span>29.45 %</span></div>
    </div>
  </div>
</div>

<div v-click>
  <img src="images/calculation-soil-moisture-2.png" class="rounded-xl border border-[#1a4d2a] w-full max-h-64 object-contain" />
</div>
</div>
</div>

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12 py-6">

  <h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-1">5.2 — Data Collection</h2>
  <h1 class="text-white text-4xl font-bold mb-8">Experimental Dataset</h1>

  <div class="grid grid-cols-12 gap-8 items-start relative h-full">
    <div class="col-span-5 space-y-6">
      <div v-click class="space-y-4">
        <div class="bg-[#0d2b17] border-2 border-[#1a4d2a] rounded-xl p-5 shadow-lg">
          <div class="text-white text-2xl font-bold mb-4 flex items-center gap-3">
            <span class="text-[#4ade80] text-3xl">📊</span> Dataset Depth
          </div>
          <ul class="text-gray-300 text-base space-y-3 list-disc list-inside leading-relaxed">
            <li><b>7 Samples:</b> Exceeding minimum requirement.</li>
            <li><b>Wide Range:</b> Moisture spans <b>14.0%</b> to <b>75.1%</b>.</li>
          </ul>
        </div>
        <div class="bg-[#0d2b17] border-2 border-[#4ade80]/30 rounded-xl p-5 shadow-lg">
          <div class="text-white text-lg font-bold mb-2 flex items-center gap-2">
            <span class="text-[#4ade80]">🧪</span> Scientific Rigor
          </div>
          <p class="text-gray-400 text-xs leading-relaxed">
            Moisture sensors are sensitive to <b>air gaps</b> and <b>density</b>. Multi-point averaging filters out environmental noise, ensuring the curve represents <b>actual moisture</b>, not placement luck.
          </p>
        </div>
      </div>
      <div v-click class="bg-[#0d2b17] border-2 border-[#1a4d2a] rounded-xl p-5 shadow-lg">
        <div class="text-white text-2xl font-bold mb-4 flex items-center gap-3">
          <span class="text-[#4ade80] text-3xl">⏱️</span> Measurement Protocol
        </div>
        <p class="text-gray-300 text-base leading-relaxed">
          Recorded <b>6 positions</b> per sample. Each measurement waits for <b>>5 stable input values</b> before logging mean.
        </p>
      </div>
    </div>
    <div class="col-span-7 relative h-full">
      <div v-click="1" class="bg-[#0d2b17] border-2 border-[#1a4d2a] rounded-xl overflow-hidden shadow-xl">
        <table class="w-full text-[13px] text-left text-gray-200">
          <thead class="bg-[#1a4d2a] text-[#4ade80] uppercase tracking-wider">
            <tr>
              <th class="p-2.5">Sample</th>
              <th class="p-2.5 text-center">Mean ADC</th>
              <th class="p-2.5 text-center">Std Dev</th>
              <th class="p-2.5 text-center">GSM %</th>
            </tr>
          </thead>
          <tbody class="divide-y-2 divide-[#1a4d2a]">
            <tr><td class="p-2.5 font-bold text-white">1st</td><td class="p-2.5 text-center">1781.2</td><td class="p-2.5 text-center text-gray-400">362.7</td><td class="p-2.5 text-center font-bold text-[#4ade80]">41.1%</td></tr>
            <tr class="bg-[#0d2b17]"><td class="p-2.5 font-bold text-white">2nd</td><td class="p-2.5 text-center">1878.9</td><td class="p-2.5 text-center text-gray-400">354.7</td><td class="p-2.5 text-center font-bold text-[#4ade80]">29.4%</td></tr>
            <tr><td class="p-2.5 font-bold text-white">3rd</td><td class="p-2.5 text-center">2092.2</td><td class="p-2.5 text-center text-gray-400">564.7</td><td class="p-2.5 text-center font-bold text-[#4ade80]">14.0%</td></tr>
            <tr class="bg-[#0d2b17]"><td class="p-2.5 font-bold text-white">4th</td><td class="p-2.5 text-center">1176.6</td><td class="p-2.5 text-center text-gray-400">319.5</td><td class="p-2.5 text-center font-bold text-[#4ade80]">50.1%</td></tr>
            <tr><td class="p-2.5 font-bold text-white">5th</td><td class="p-2.5 text-center">1855.0</td><td class="p-2.5 text-center text-gray-400">378.0</td><td class="p-2.5 text-center font-bold text-[#4ade80]">18.2%</td></tr>
            <tr class="bg-[#0d2b17]"><td class="p-2.5 font-bold text-white">6th</td><td class="p-2.5 text-center">998.0</td><td class="p-2.5 text-center text-gray-400">147.8</td><td class="p-2.5 text-center font-bold text-[#4ade80]">75.1%</td></tr>
            <tr><td class="p-2.5 font-bold text-white">7th</td><td class="p-2.5 text-center">829.0</td><td class="p-2.5 text-center text-gray-400">115.2</td><td class="p-2.5 text-center font-bold text-[#4ade80]">62.4%</td></tr>
          </tbody>
        </table>
      </div>
    </div>

  </div>
</div>

<div v-click="2" class="fixed inset-0 z-50 bg-[#08200f]/98 flex flex-col items-center justify-center p-12">
  <div class="bg-white rounded-3xl p-8 border-4 border-[#4ade80] shadow-2xl flex flex-col items-center max-w-5xl">
    <img src="images/data-plot.png" class="max-h-[70vh] w-auto object-contain" />
    <div class="mt-6 text-center text-lg text-gray-700 font-bold px-6 py-3 bg-gray-100 rounded-xl border border-gray-300">
      Point size = W<sub>wet</sub> | Error bars = &plusmn; Standard Deviation
    </div>
  </div>
</div>

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col justify-center px-12">

<h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-2">5.3 — The Calibration Curve</h2>
<h1 class="text-white text-3xl font-bold mb-6">Plotting the Fitted Line</h1>

<div class="grid grid-cols-2 gap-8 items-center">
<div class="space-y-4">
  <p class="text-gray-300 text-sm leading-relaxed" v-click>
    Mapping the raw ADC mean (1878.9) to the calculated GSM (29.45%). Repeating this for all 7 samples creates our curve.
  </p>
  <div v-click class="bg-gradient-to-r from-[#14532d] to-[#0d2b17] border border-[#4ade80] rounded-xl p-4">
    <div class="font-mono text-center text-lg text-white">
      Moisture % = <b>m</b>(ADC) + <b>b</b>
    </div>
  </div>
</div>

<div v-click>
  <img src="images/regression.gif" class="rounded-xl border border-[#1a4d2a] w-full object-contain bg-white p-2" />
  <div class="text-xs text-gray-500 mt-2 text-center">Linear regression of our 7 samples</div>
</div>
</div>
</div>

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col items-start px-12 pt-8 pb-4">

  <header class="w-full">
    <h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-0">5.4 — Final Model</h2>
    <h1 class="text-white text-3xl font-bold mb-2">Optimized Calibration Model</h1>
  </header>

  <div class="grid grid-cols-12 gap-8 items-start w-full h-auto">
    <div v-click class="col-span-8 bg-white rounded-2xl p-3 border-4 border-[#4ade80] shadow-[0_0_30px_rgba(74,222,128,0.15)]">
      <img src="images/regression.gif" class="w-full max-h-[72vh] object-contain rounded-lg" alt="Linear Regression Animation" />
    </div>
    <div class="col-span-4 space-y-4 pt-2">
      <div v-click class="bg-[#0d2b17] border-l-4 border-[#4ade80] p-4 rounded-r-xl">
        <h3 class="text-white font-bold text-lg mb-1">Fitted Equation</h3>
        <p class="text-[#4ade80] font-mono text-[13px] leading-tight">
          y = -0.0418x + 104.85
        </p>
        <p class="text-gray-400 text-[11px] mt-2 italic leading-relaxed">
          The negative slope confirms that higher ADC values (dryer soil) correctly correlate to lower moisture percentages.
        </p>
      </div>
      <div v-click class="bg-[#0d2b17]/50 border border-[#1a4d2a] p-4 rounded-xl">
        <h4 class="text-[#4ade80] text-[10px] font-mono uppercase mb-1">Firmware Constants</h4>
        <div class="space-y-2 text-[10px] font-mono text-gray-300">
          <div class="flex justify-between">
            <span>Slope (m):</span>
            <span class="text-white">-0.041796...</span>
          </div>
          <div class="flex justify-between">
            <span>Intercept (b):</span>
            <span class="text-white">104.8499...</span>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

---

<div class="absolute inset-0 bg-[#08200f]" />

<div class="relative z-10 h-full flex flex-col px-12 py-10">

  <h2 class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-1">5.5 — Scientific Insight</h2>
  <h1 class="text-white text-3xl font-bold mb-6">Physical Meaning of Parameters</h1>

  <div class="grid grid-cols-2 gap-10 items-start">
    <div v-click class="space-y-4">
      <div class="bg-[#14532d]/20 border-l-4 border-[#4ade80] p-6 rounded-r-xl shadow-lg">
        <h3 class="text-white font-bold text-xl mb-3">Is 105% Moisture Possible?</h3>
        <p class="text-gray-300 text-sm leading-relaxed">
          <b>Yes.</b> Gravimetric moisture compares water mass to <span class="text-white font-semibold">dry soil mass</span>. 
        </p>
        <div class="mt-4 p-3 bg-[#0d2b17] rounded-lg border border-[#1a4d2a] font-mono text-xs text-[#4ade80]">
          GSM % = (Mass<sub>water</sub> / Mass<sub>dry soil</sub>) × 100
        </div>
      </div>
    </div>
    <div v-click class="space-y-4">
      <div class="bg-[#0d2b17] border-2 border-[#1a4d2a] p-5 rounded-xl">
        <div class="flex items-center gap-3 mb-2">
          <div class="bg-[#4ade80] text-black font-mono font-bold px-2 py-0.5 rounded">m</div>
          <span class="text-white font-bold">Slope: -0.0418</span>
        </div>
        <p class="text-gray-400 text-xs leading-relaxed">
          For every <b>100 units</b> the ADC value increases (dryer soil), the Moisture drops by <b>4.18%</b>. The negative value proves a <b>inverse</b> correlation between voltage and wetness.
        </p>
      </div>
      <div class="bg-[#0d2b17] border-2 border-[#1a4d2a] p-5 rounded-xl">
        <div class="flex items-center gap-3 mb-2">
          <div class="bg-[#4ade80] text-black font-mono font-bold px-2 py-0.5 rounded">b</div>
          <span class="text-white font-bold">Intercept: 104.85</span>
        </div>
        <p class="text-gray-400 text-xs leading-relaxed">
          This is the <b>saturation anchor</b>. It predicts that at a theoretical ADC of 0, the soil reaches its maximum measurable capacity of ~105% GWC.
        </p>
      </div>
    </div>

  </div>

  <div v-click class="mt-auto bg-[#0d2b17]/50 border border-[#1a4d2a] p-4 rounded-xl text-center">
    <p class="text-gray-400 text-sm italic">
      "Our parameters aren't just numbers—they are the <b>fingerprint</b> of VGU soil's electrical and physical properties."
    </p>
  </div>

</div>

---

<div class="absolute inset-0 bg-gradient-to-br from-[#0a2e1a] via-[#0d3d1f] to-[#071a10]" />

<div class="relative z-10 h-full flex flex-col justify-center items-center text-center px-12">

<div class="text-[#4ade80] text-sm font-mono uppercase tracking-widest mb-4">Summary</div>

<h1 class="text-white text-4xl font-bold mb-10">What We Covered</h1>

<div class="grid grid-cols-5 gap-4 w-full max-w-5xl">
  <div v-click class="bg-[#0d2b17]/80 border border-[#1a4d2a] rounded-2xl p-4">
    <div class="text-3xl mb-3">🌱</div>
    <div class="text-[#4ade80] font-bold text-sm mb-1">Project</div>
    <div class="text-gray-400 text-xs">Smart soil moisture monitoring at VGU</div>
  </div>
  <div v-click class="bg-[#0d2b17]/80 border border-[#1a4d2a] rounded-2xl p-4">
    <div class="text-3xl mb-3">🔌</div>
    <div class="text-[#4ade80] font-bold text-sm mb-1">Sensors</div>
    <div class="text-gray-400 text-xs">GPIO, I²C, UART, SPI, Wireless</div>
  </div>
  <div v-click class="bg-[#0d2b17]/80 border border-[#1a4d2a] rounded-2xl p-4">
    <div class="text-3xl mb-3">📊</div>
    <div class="text-[#4ade80] font-bold text-sm mb-1">Calibration</div>
    <div class="text-gray-400 text-xs">Gravimetric sampling → fitted curve</div>
  </div>
  <div v-click class="bg-[#0d2b17]/80 border border-[#1a4d2a] rounded-2xl p-4">
    <div class="text-3xl mb-3">⚙️</div>
    <div class="text-[#4ade80] font-bold text-sm mb-1">Hardware</div>
    <div class="text-gray-400 text-xs">ESP32 + Resistive sensor</div>
  </div>
  <div v-click class="bg-[#0d2b17]/80 border border-[#1a4d2a] rounded-2xl p-4">
    <div class="text-3xl mb-3">🧪</div>
    <div class="text-[#4ade80] font-bold text-sm mb-1">Demo</div>
    <div class="text-gray-400 text-xs">From raw voltage to moisture %</div>
  </div>
</div>

<div class="mt-10 text-gray-500 text-sm font-mono">
  Microsoft IoT for Beginners · VGU Digital Agriculture Project
</div>

</div>