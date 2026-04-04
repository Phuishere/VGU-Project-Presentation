---
theme: default
title: IoT Soil Moisture
info: |
  Digital Agriculture - Advanced Soil Moisture Detection Pipeline
class: text-center
drawings:
  persist: false
transition: slide-up
mdc: true
---

<div class="absolute top-0 left-0 w-full h-full bg-gradient-to-br from-green-900 via-teal-900 to-black opacity-90 z-[-1]"></div>

<div class="flex flex-col items-center justify-center h-full text-white">
  <div class="i-carbon-iot text-6xl mb-4 text-green-400"></div>
  <h1 class="text-6xl font-extrabold tracking-tight bg-clip-text text-transparent bg-gradient-to-r from-green-300 to-emerald-500">
    Digital Agriculture
  </h1>
  <h2 class="text-3xl font-light mt-2 text-gray-300">
    Soil Moisture Inference Pipeline
  </h2>
  
  <div class="mt-12 text-sm text-gray-400 tracking-widest uppercase">
    Vietnamese German University (VGU) • IoT Project
  </div>
</div>

---
layout: center
class: text-left
---

# 📡 Architectural Review: MQTT & IoT

<div class="grid grid-cols-5 gap-4 mt-8 items-center">

<div class="col-span-2 bg-gray-50 dark:bg-gray-800 p-6 rounded-xl border border-gray-200 dark:border-gray-700 shadow-lg">
  <h3 class="text-xl font-bold text-blue-500 mb-2">Constrained Environments</h3>
  <ul class="space-y-2 text-sm">
    <v-clicks>
      <li>Requires low-bandwidth, low-power protocols.</li>
      <li><strong>MQTT</strong> relies on a lightweight Publish/Subscribe architecture.</li>
      <li>Decouples the ESP32 (Publisher) from the Data Analytics Server (Subscriber).</li>
    </v-clicks>
  </ul>
</div>

<div class="col-span-3">
  <div class="relative w-full h-64 bg-gray-100 dark:bg-gray-900 rounded-xl border border-dashed border-gray-400 flex items-center justify-center overflow-hidden">
    <v-switch>
      <template #1>
        <div class="text-center transition-all duration-500">
          <div class="i-carbon-microcontroller text-4xl text-gray-500 mx-auto"></div>
          <p class="mt-2 font-mono text-sm text-gray-500">ESP32 Node</p>
        </div>
      </template>
      <template #2>
        <div class="flex items-center gap-8 transition-all duration-500">
          <div class="text-center">
            <div class="i-carbon-microcontroller text-4xl text-blue-500 mx-auto"></div>
            <p class="mt-2 font-mono text-sm">Publish: temp/moisture</p>
          </div>
          <div class="i-carbon-arrow-right text-2xl animate-pulse"></div>
          <div class="text-center">
            <div class="i-carbon-ibm-mq text-5xl text-purple-500 mx-auto"></div>
            <p class="mt-2 font-mono text-sm">MQTT Broker</p>
          </div>
        </div>
      </template>
      <template #3>
        <div class="flex items-center gap-4 transition-all duration-500 scale-90">
          <div class="text-center"><div class="i-carbon-microcontroller text-3xl text-blue-500 mx-auto"></div></div>
          <div class="i-carbon-arrow-right"></div>
          <div class="text-center"><div class="i-carbon-ibm-mq text-4xl text-purple-500 mx-auto"></div></div>
          <div class="i-carbon-arrow-right"></div>
          <div class="text-center">
            <div class="i-carbon-chart-line text-3xl text-green-500 mx-auto"></div>
            <p class="mt-2 font-mono text-xs">Sub: Backend / DB</p>
          </div>
        </div>
      </template>
    </v-switch>
  </div>
</div>

</div>

---
layout: two-cols
class: text-left
---

# 💧 The Soil Moisture Context

<div class="pr-8 pt-4 space-y-4">
  <p class="text-lg text-gray-700 dark:text-gray-300">
    Water drives three critical biological processes:
  </p>
  
  <ul class="space-y-3">
    <v-clicks>
      <li class="flex items-start gap-2">
        <div class="i-carbon-sun text-yellow-500 mt-1"></div>
        <div><strong>Photosynthesis:</strong> Chemical reaction producing carbohydrates and oxygen.</div>
      </li>
      <li class="flex items-start gap-2">
        <div class="i-carbon-chart-bubble text-blue-500 mt-1"></div>
        <div><strong>Transpiration:</strong> Cooling the plant and diffusing CO2.</div>
      </li>
      <li class="flex items-start gap-2">
        <div class="i-carbon-chart-network text-green-500 mt-1"></div>
        <div><strong>Structure:</strong> Plants are 90% water; cell rigidity prevents wilting.</div>
      </li>
    </v-clicks>
  </ul>
</div>

::right::

<div class="pl-4 h-full flex flex-col items-center justify-center">
  <div class="relative group">
    <div class="absolute -inset-1 bg-gradient-to-r from-blue-600 to-green-600 rounded-2xl blur opacity-25 group-hover:opacity-75 transition duration-1000 group-hover:duration-200"></div>
    <img src="images\\watering-vgu.png" class="relative rounded-xl shadow-2xl w-full object-cover h-80" alt="Watering Process" />
  </div>
  <div class="mt-4 bg-gray-100 dark:bg-gray-800 rounded-lg p-3 w-full border-l-4 border-blue-500">
    <p class="text-sm font-semibold">The Engineering Goal:</p>
    <p class="text-xs mt-1 text-gray-500">Prevent root death from overwatering (oxygen deprivation) while maintaining optimal structural hydration.</p>
  </div>
</div>

---
layout: center
class: text-left
---

# 🔌 Sensor Hardware & Topologies

<div class="grid grid-cols-3 gap-6 mt-6">

<v-clicks>

<div class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 p-5 hover:shadow-lg transition-shadow">
  <div class="i-carbon-chip text-3xl text-indigo-500 mb-3"></div>
  <h3 class="font-bold text-lg">Resistive & Capacitive</h3>
  <p class="text-xs text-gray-500 mt-2">
    <strong>Resistive:</strong> Measures current drop between probes. Wetter soil = lower resistance.<br/><br/>
    <strong>Capacitive:</strong> Measures stored charge across plates. Wetter soil = lower voltage output.
  </p>
</div>

<div class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 p-5 hover:shadow-lg transition-shadow">
  <div class="i-carbon-connection-signal text-3xl text-emerald-500 mb-3"></div>
  <h3 class="font-bold text-lg">Wired Protocols</h3>
  <p class="text-xs text-gray-500 mt-2">
    <strong>Analog Pins:</strong> Uses 10-bit ADC to map voltages (e.g., 3.3V to 1023).<br/><br/>
    <strong>I²C / SPI / UART:</strong> Digital buses handling packet-addressed data (SDA/SCL) or full-duplex synchronous streams.
  </p>
</div>

<div class="bg-white dark:bg-gray-800 rounded-xl shadow-sm border border-gray-200 p-5 hover:shadow-lg transition-shadow">
  <div class="i-carbon-wifi text-3xl text-blue-500 mb-3"></div>
  <h3 class="font-bold text-lg">Wireless Topologies</h3>
  <p class="text-xs text-gray-500 mt-2">
    <strong>LoRaWAN:</strong> Long-range, low power for large agricultural setups.<br/><br/>
    <strong>Zigbee:</strong> Forms resilient mesh networks, forwarding data node-to-node until reaching the coordinator.
  </p>
</div>

</v-clicks>

</div>

---
layout: two-cols
class: text-left
---

# 🧪 Gravimetric Calibration
## Ground Truth Data

<div class="pr-6 mt-4">
  <p class="text-sm mb-4">Raw ADC values (0-1023) are arbitrary without calibration. We establish ground truth by calculating Gravimetric Soil Moisture.</p>

  <div class="bg-gray-50 dark:bg-gray-800 p-4 rounded-lg border border-gray-200 text-center">
    $$GSM = \frac{W_{wet} - W_{dry}}{W_{dry}} \times 100$$
  </div>

  <ol class="mt-6 space-y-3 text-sm list-decimal list-inside">
    <v-clicks>
      <li>Record ADC reading of sample.</li>
      <li>Measure wet weight ($W_{wet}$).</li>
      <li>Bake sample at 110°C (230°F) until powdery.</li>
      <li>Measure dry weight ($W_{dry}$).</li>
      <li>Repeat for varying moisture levels.</li>
    </v-clicks>
  </ol>
</div>

::right::

<div class="flex flex-col gap-4 pl-4 justify-center h-full">
  <div class="relative group">
    <div class="absolute -inset-0.5 bg-gradient-to-r from-yellow-600 to-orange-600 rounded-lg blur opacity-30 group-hover:opacity-100 transition duration-1000 group-hover:duration-200"></div>
    <img src="images\\sampling-ground.png" class="relative rounded-lg shadow-md border w-full h-40 object-cover" alt="Soil Sampling" />
  </div>
  <img src="images\\raw-moisture-measure-sample.png" class="rounded-lg shadow-md border w-full h-40 object-cover" alt="Raw ADC Measurements" />
</div>

---
layout: center
class: text-left
---

# 📈 Regression Modeling

<div class="grid grid-cols-2 gap-8 items-center mt-8">

<div>
  <img src="images\\regression.png" class="rounded-xl shadow-lg border border-gray-300 w-full" alt="Linear Regression Model" />
</div>

<div class="space-y-6">
  <div>
    <h3 class="text-xl font-bold flex items-center gap-2">
      <div class="i-carbon-chart-scatter text-blue-500"></div>
      Fitting the Curve
    </h3>
    <p class="text-sm text-gray-500 mt-2">
      By plotting the calculated Gravimetric Soil Moisture (%) against the raw analog voltages, we extract a linear equation.
    </p>
  </div>

  <div class="bg-gray-100 dark:bg-gray-800 p-4 rounded-lg font-mono text-sm shadow-inner">
    y = mx + c <br/>
    <span class="text-gray-400 text-xs">// y: Predicted Moisture %</span><br/>
    <span class="text-gray-400 text-xs">// x: Real-time ADC reading</span>
  </div>

  <p class="text-sm">
    This equation is flashed onto the ESP32, allowing the edge device to calculate actual moisture percentage locally before publishing.
  </p>
</div>

</div>

---
layout: center
class: text-left
---

# 💻 ESP32 Edge Logic: Filtering & Publishing

<div class="mt-4 text-left">
  <p class="text-sm text-gray-500 mb-2">Implementing the Moving Average algorithm and MQTT client on the microcontroller.</p>
</div>

```cpp {1-3|5-15|17-23|all}
// Constants derived from our Linear Regression calibration
const float M_SLOPE = -0.075; 
const float C_INTERCEPT = 85.0; 

// Moving Average implementation for noisy ADC readings
const int numReadings = 10;
int readings[numReadings];      
int readIndex = 0, total = 0, average = 0;

void updateMoistureAverage() {
  total = total - readings[readIndex];       
  readings[readIndex] = analogRead(MOISTURE_PIN); 
  total = total + readings[readIndex];       
  readIndex = (readIndex + 1) % numReadings; 
  average = total / numReadings;                
}

void loop() {
  updateMoistureAverage();
  
  // Apply regression formula
  float moisturePercent = (M_SLOPE * average) + C_INTERCEPT;
  
  mqttClient.publish("vgu/agri/soil_moisture", String(moisturePercent).c_str());
  delay(5000); 
}
````

---
layout: center
class: text-left
---

# ⚙️ The Inference Pipeline

<div class="relative mt-8">
    <div class="absolute inset-0 flex items-center justify-center opacity-10">
    <div class="i-carbon-machine-learning text-[20rem]"></div>
</div>
<div class="grid grid-cols-2 gap-12 relative z-10">
<div class="flex flex-col justify-center space-y-6">
  <div class="p-5 bg-white/80 dark:bg-gray-800/80 backdrop-blur rounded-xl shadow-lg border border-gray-200">
    <h3 class="font-bold text-lg mb-2">1. Noise Reduction</h3>
    <p class="text-sm text-gray-600 dark:text-gray-300">
      Raw soil readings spike drastically due to electrical interference or minor soil shifts. The <strong>Moving Average</strong> acts as a low-pass filter.
    </p>
  </div>

  <div class="p-5 bg-white/80 dark:bg-gray-800/80 backdrop-blur rounded-xl shadow-lg border border-gray-200">
    <h3 class="font-bold text-lg mb-2">2. Edge Inference</h3>
    <p class="text-sm text-gray-600 dark:text-gray-300">
      The linear regression model evaluates the smoothed signal locally, saving bandwidth by only transmitting processed percentages.
    </p>
  </div>
</div>

<div class="flex items-center">
  <img src="images\\pipeline.png" class="rounded-xl shadow-2xl border-4 border-gray-800 object-cover w-full hover:scale-105 transition-transform duration-300" alt="Inference Pipeline" />
</div>
```

</div>
</div>

---
layout: center
class: text-center
---

# 🌿 Future Scope: Beyond Moisture

<div class="mt-8 max-w-3xl mx-auto space-y-6">

<p class="text-xl text-gray-700 dark:text-gray-300">
Merging IoT Telemetry with <span class="text-blue-500 font-bold">Computer Vision</span>
</p>

<div class="grid grid-cols-2 gap-4 text-left">
<div class="p-6 bg-gray-50 dark:bg-gray-800 rounded-xl border border-blue-200 dark:border-blue-900">
<div class="i-carbon-tree text-3xl text-green-600 mb-2"></div>
<h4 class="font-bold mb-1">Local Agriculture Focus</h4>
<p class="text-sm text-gray-600 dark:text-gray-400">
Adapting this moisture baseline dataset to monitor optimal hydration conditions for specialized industrial crops prevalent in Binh Duong, such as rubber trees and pepper plants.
</p>
</div>
<div class="p-6 bg-gray-50 dark:bg-gray-800 rounded-xl border border-purple-200 dark:border-purple-900">
<div class="i-carbon-camera text-3xl text-purple-600 mb-2"></div>
<h4 class="font-bold mb-1">Multimodal AI Models</h4>
<p class="text-sm text-gray-600 dark:text-gray-400">
Feeding live moisture telemetry into Deep Learning / YOLO architectures to correlate visual plant stress (wilting, leaf discoloration) directly with subterranean soil conditions.
</p>
</div>
</div>

</div>

---
layout: center
class: text-center
---

<div class="i-carbon-checkmark-outline text-6xl text-green-500 mx-auto mb-6"></div>

# System Deployed

## Thank You

<div class="mt-8">
<code class="px-4 py-2 bg-gray-100 dark:bg-gray-800 rounded-lg text-sm font-mono border">mqtt.disconnect()</code>
</div>