# Context:

Bạn là nhà viết slide chuyên nghiệp sử dụng Markdown + công cụ Slidev. Mình nhờ bạn làm slide cho project IoT (assignment.md, SOIL_README.md)

Mục tiêu của bạn: Làm slide thật đẹp, bắt mắt với các hiệu ứng sử dụng công cụ nêu trên. Đồng thời (a) sáng tạo dựa trên dàn bài được giao và (b) làm rõ bất kỳ thắc mắc nào để bạn có thể hoàn thành tác vụ một cách ổn thỏa nhất. Không thêm những thứ không tồn tại vào.

# Nội dung bài thuyết trình (Tiếng Anh):

- Ôn tập: MQTT và các giao thức cho IoT (https://github.com/microsoft/IoT-For-Beginners/blob/main/1-getting-started/lessons/4-connect-internet/README.md)

- Giới thiệu về project nhận diện độ ẩm: Ảnh "watering-vgu.png" (SOIL_README.md). => Moisture sensor là một loại sensor!

- Giới thiệu về Sensor: GPIO, Analog Pin, I^2C, SPI, wireless (SOIL_README.md)

- Về bài toán Soil Moisture: (1) các thiết bị (Ảnh "devices.png"), (2) cách thu thập data và tạo model linear regression (Ảnh "regression.png", "sampling-ground.png", "raw-moisture-measure-sample.png"), (3) code IoT để thực hiện đo dựa trên ESP32 và các sensor đo độ ẩm (bổ sung sau), (4) cách inference (Ảnh "pipeline.png") bao gồm việc sử dụng moving average để thực hiện đo vào các thời gian khác nhau.

Bổ sung thêm nội dung / ảnh cần thiết nếu bạn thấy ổn.

Ví dụ về Slide md của Slidev:

```markdown

---

theme: default

title: Kiwi

info: |

  Kiwi — an agentic memory layer for personalized AI educational help

class: text-left

drawings:

  persist: false

transition: slide-left

mdc: true

---

# Kiwi 🥝

## An agentic memory layer so that AI tutors actually remember how _you_ learn

<!--

Opening:

AI tutors are smart, but weirdly forgetful.

Kiwi fixes that.

It turns every learner interaction into useful memory so tutoring feels continuous, personal, and actually educational.

-->

---

layout: center

class: text-center

---

## AI tutors are good at answering

## But are bad at _**teaching**_ the student

<div class="mt-8 text-lg">

<v-clicks>

Today's AI tutors usually forget or do not take into account:

</v-clicks>

<div class="text-left">

<v-clicks>

- where students are at in their coursework

- how they prefer explanations and solutions

- their memory state on specific topics

- their short/long term goals

</v-clicks>

</div>

</div>

<!--

This is the pain.

Not "AI is bad."

It is that AI gives generic help to a non-generic learner.

-->

---

<img src="/ai-tutor-big-o-screenshot.png" class="rounded-xl w-full object-contain object-left" alt="AI tutor scaffolding Big-O: asks what feels familiar before explaining" />

<!--

Use the Big-O example here.

The issue is not correctness alone.

The issue is missing learner state.

-->

---

## Personalization is a memory problem

```

# Image repository

Include these images:
- [x] `lesson-6.jpg`: introduction image of the work.
- [ ] `watering-vgu.png`: about watering system in VGU.
- [x] `circuit-board.jpg`: image of the board (all devices included).
- [x] `circuit-board-graph.jpg`: graph of the board.
- [x] `esp32-node-mcu-32s.png`: image of our ESP32.
- [x] `fc28-moisture-detection.jpg`: image of the sensor used in the project.
- [ ] `sampling-ground.png`: about the sampling grounds of ours; could be a map of VGU with points of sampling grounds on it.
- [ ] `raw-moisture-measure-sample.png`: a picture of we measuring it.
- [x] `calculation-soil-moisture-1.png`: calculation of soil moisture.
- [x] `calculation-soil-moisture-2.png`: calculation of soil moisture (with example number ).
- [ ] `regression.png`: linear regression of the `moisture in %` and `measurement in Voltage`.
- [ ] `pipeline.png`: the pipeline of inferencing the work.