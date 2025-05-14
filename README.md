# FPGA-Based ADC0809 Interface using Verilog

This project demonstrates the interfacing of the **ADC0809** analog-to-digital converter (ADC) with an **FPGA DE2 board** using **Verilog HDL**. The implementation captures analog input, triggers conversion, and retrieves 8-bit digital output data.

---

## 📑 Project Overview

- **Title**: Analog-to-Digital Conversion using ADC0809 and FPGA
- **Platform**: Altera DE2 FPGA Board
- **Language**: Verilog HDL
- **Submitted by**: Neha Golani (22BEC042)
- **Institution**: Nirma University
- **Guide**: Prof. Purvi Patel

---

## 🔧 Functionality

The Verilog module `ADC` is responsible for:
- Selecting the ADC channel using address lines `a`, `b`, and `c`
- Handling control signals: `ALE`, `SC`, `EOC`, and `OE`
- Generating a divided clock signal from the 50 MHz onboard clock
- Reading 8-bit digital output from the ADC0809
- Outputting the digital data for use in downstream FPGA logic

---

## 🔌 Pin Description

| Signal     | Direction | Description                                 |
|------------|-----------|---------------------------------------------|
| `clk_in`   | Input     | 50 MHz clock input from DE2 board           |
| `clk_out`  | Output    | Divided clock output (0.5 kHz)              |
| `ale_in`   | Input     | Address Latch Enable control signal         |
| `ale_out`  | Output    | Latch signal to ADC                         |
| `sc_in`    | Input     | Start Conversion trigger                    |
| `sc_out`   | Output    | Start signal to ADC                         |
| `eoc`      | Input     | End Of Conversion signal from ADC          |
| `in_data`  | Input     | 8-bit digital data from ADC0809            |
| `out_data` | Output    | Captured 8-bit digital output from FPGA     |
| `a,b,c`    | Output    | ADC channel selector lines                  |
| `oe`       | Output    | Output Enable control to ADC                |
| `led`      | Output    | Status indication LED                       |

---

## 🧠 System Flow

1. Power on system
2. Select desired ADC input channel via selector lines
3. Trigger start conversion (`sc`)
4. Monitor `eoc` (End Of Conversion)
5. Trigger output enable
6. Read and store converted digital output

📄 **Refer to the [Flow Chart](Flow%20chart/Flow%20chart.pdf)** for step-by-step logic  
🗂️ **See the [Block Diagram](Block%20Diagram%20.pdf)** for hardware connections


---

## 📦 Files in this Repository

- `ADC.v` - Verilog module to interface with ADC0809
- `README.md` - Project documentation (you are here)
- `Report FPGA.pdf` - Detailed project report including theory, methodology, results
- `Flow chart.pdf` - System flowchart
- `Block Diagram.pdf` - Hardware-level block diagram

---

## ✅ Output & Results

- Successful interfacing with ADC0809 IC
- Real-time analog signal acquisition and digital display via LED or logic analyzer
- Verified timing behavior through RTL simulation and waveform analysis

---

## 📚 References

1. Roth Jr., C. H., & John, L. K. (2011). *Digital Systems Design Using Verilog.*
2. Palnitkar, S. (2003). *Verilog HDL: A Guide to Digital Design and Synthesis.*
3. Smith, K. W. (1997). *Analog-to-Digital Conversion.*
4. Mazidi, M. A., & McKinlay, R. D. (2013). *The 8051 Microcontroller and Embedded Systems.*

---

## 🚀 Future Scope

- Extend to multi-channel ADC sampling
- Incorporate real-time signal filtering in FPGA
- Add graphical interface for digital output display

---

## 🛠️ Tools Used

- **Quartus Prime** (Intel FPGA development)
- **ModelSim** (Simulation and waveform debugging)
- **DE2 FPGA Board** with GPIO interfacing

---

## 📌 License

This project is developed for academic purposes. You may reuse the code with proper attribution.

