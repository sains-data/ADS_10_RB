# 📊 Analisis Pengaruh Uang Saku Mahasiswa Terhadap IPK Mahasiswa Menggunakan Metode Regresi Linear & Korelasi  
# Tugas Besar Analisis Data Statistika_Kelompok 10_RB

## 📌 Deskripsi Proyek
Repositori ini berisi analisis data menggunakan metode regresi linear sederhana dan korelasi antara variabel **Uang Saku Mahasiswa** dan **IPK Mahasiswa**. Seluruh analisis dilakukan menggunakan bahasa pemrograman **R**.

## 🎯 Tujuan
- Mengetahui apakah uang saku memiliki hubungan dengan IPK mahasiswa.
- Menganalisis kekuatan hubungan menggunakan korelasi Pearson.
- Membentuk model regresi linear sederhana.
- Menguji asumsi klasik regresi dan menilai validitas model.

## 📂 Struktur Folder

### 📁 Data
- `dataset.csv`
- `Dataset.CSV.xls`

### 📁 Output
- `scatterplot_resolusi_tinggi.png`
- `DataHasilOlahan_10_RB.pdf`

### 📁 Poster
- `Poster_10_RB.pdf`
- `Poster_10_RB.png`

### 📄 File Utama
- `README.md`
- `codeR_10_RB.R`
- `dataset.csv`



## 📈 Hasil Utama
- Persamaan regresi:  
  **IPK = 3.35028 + 0.02183 × UangSaku**
  Penjelasan Tiap Komponen:
  1. Interpretasi Intersep (β₀ = 3.35028)
     Nilai intersep menunjukkan nilai IPK ketika variabel Uang Saku = 0.
     Secara praktis, kondisi ini memang tidak mungkin terjadi pada data, karena kategori uang saku dimulai dari 1 sampai 4. Namun dalam konteks model regresi, konstanta tetap perlu disertakan karena berfungsi sebagai titik awal garis regresi.
  2. Interpretasi Koefisien β₁ (0.02183)
     Koefisien β₁ mewakili besarnya perubahan IPK untuk setiap kenaikan satu kategori uang saku dengan asumsi variabel lain konstan.
     Karena nilai β₁ = 0.02183, interpretasinya adalah:
     Untuk setiap kenaikan 1 kategori uang saku, IPK mahasiswa diprediksi meningkat sebesar 0.02183 poin. Artinya, jika mahasiswa naik kategori uang saku dari kategori 1 → 2, atau 2 → 3, maka model memprediksi IPK naik sangat kecil, yaitu sekitar 0.02 poin saja. Dengan kata lain, pengaruh uang saku terhadap IPK adalah sangat kecil dan tidak signifikan secara statistik.
- Korelasi Pearson
  R² = 0.00198, artinya:
  Hanya 0.198% variasi IPK mahasiswa dapat dijelaskan oleh variasi uang saku. Atau dapat dikatakan bahwa 99.8% variasi IPK dipengaruhi faktor lain yang tidak termasuk dalam model.
- Uji t regresi
  Nilai p untuk β₁ sebesar 0.428, jauh lebih besar dari batas signifikansi α = 0.05.
  Ini berarti:
  Tidak ada bukti statistik yang cukup untuk menyatakan bahwa uang saku berpengaruh terhadap IPK.

## 🛠️ Tools yang Digunakan
- R & RStudio
- ggplot2
- dplyr
- tidyverse
- GitHub

## 👨‍💻 Cara Menjalankan Script
1. Clone repository:
   ```bash
   git clone https://github.com/USERNAME/NAMA-REPO.git
2. Buka
   ```
   CodeR_10_RB.R
3. Jalankan script di RStudio

## ✨ Kontributor
1. Bernardinus Enggar Rosiano (124450045)
2. Dimas Arya Ramadhan (124450118)
3. Aisyah Khairun Nisa (124450091)
4. Dafa Elpriza (124450131)
