---
title: "tugas_besar_ads"
output:
  bookdown::pdf_document2:

    tufte::tufte_handout:
    latex_engine: xelatex
  html_document: default
---

```{r}
# Import data
data <- read.csv("Data Cleaned.CSV")
str(data)
summary(data)


data$IPK <- as.numeric(data$IPK)
data$UangSaku <- as.numeric(data$UangSaku)

```

```{r}

data$IPK <- as.numeric(data$IPK)

ipk_min   <- min(data$IPK, na.rm = TRUE)
ipk_max   <- max(data$IPK, na.rm = TRUE)
ipk_mean  <- mean(data$IPK, na.rm = TRUE)
ipk_median<- median(data$IPK, na.rm = TRUE)
ipk_sd    <- sd(data$IPK, na.rm = TRUE)

cat("STATISTIK IPK \n")
cat("Min IPK        =", ipk_min, "\n")
cat("Maks IPK       =", ipk_max, "\n")
cat("Rata-rata IPK  =", ipk_mean, "\n")
cat("Median IPK     =", ipk_median, "\n")
cat("Standar deviasi=", ipk_sd, "\n\n")


data$UangSaku_f <- factor(
  data$UangSaku,
  levels = c(1, 2, 3, 4),
  labels = c("500k-1jt", "1-1.5jt", "1.5-2jt", ">2jt")
)

cat("FREKUENSI KATEGORI UANG SAKU\n")
print(table(data$UangSaku_f))

cat("\nPROPORSI KATEGORI UANG SAKU\n")
print(prop.table(table(data$UangSaku_f)))


```

```{r}
# Scatter plot 
plot(data$UangSaku, data$IPK,
     pch = 19,                         
     col = "dodgerblue3",              
     cex = 1.5,                        
     xlab = "Uang Saku (kategori 1–4)",
     ylab = "IPK",
     main = "Hubungan Uang Saku dan IPK Mahasiswa",
     cex.lab = 1.4,                   
     cex.main = 1.6,                   
     col.lab = "black",
     col.main = "black")

abline(lm(IPK ~ UangSaku, data = data),
       col = "red3", 
       lwd = 3)

```

```{r}
# model regresi
model <- lm(IPK ~ UangSaku, data = data)

summary(model)
confint(model)

# Residual
res <- residuals(model)


b0 <- coef(model)[1] 
b1 <- coef(model)[2]   

cat("\n=== PERSAMAAN REGRESI LINEAR ===\n")
cat("IPK = ", round(b0, 5), " + ", round(b1, 5), " * UangSaku\n", sep = "")

```

```{r}
b0 <- 3.35028
b1 <- 0.02183


cat("=== PERSAMAAN REGRESI LINEAR ===\n")
cat("IPK = ", b0, " + ", b1, " * UangSaku\n\n", sep="")

# Interpretasi regresi
cat("=== INTERPRETASI REGRESI ===\n")

cat(
  "1. Intercept (", b0, "):",
  "Nilai ini menunjukkan perkiraan IPK ketika uang saku berada pada kategori 0.",
  "Secara matematis nilai ini diperlukan untuk membentuk persamaan regresi,",
  "namun tidak memiliki makna praktis karena kategori 0 tidak ada dalam data.\n\n",
  sep=" "
)

cat(
  "2. Koefisien UangSaku (", b1, "):",
  "Setiap kenaikan satu kategori uang saku akan meningkatkan IPK rata-rata sebesar",
  b1, "poin.",
  "Artinya semakin tinggi kategori uang saku (misal 1 → 2 atau 2 → 3),",
  "maka IPK mahasiswa diprediksi meningkat.\n\n",
  sep=" "
)

cat(
  "Kesimpulan: Terdapat pengaruh positif antara uang saku dan IPK,",
  "meskipun besar pengaruhnya kecil sehingga uang saku bukan satu-satunya faktor",
  "yang menentukan IPK mahasiswa.\n",
  sep=" "
)

```

```{r}
alpha <- 0.05

p_beta1 <- summary(model)$coefficients["UangSaku", "Pr(>|t|)"]

cat("UJI HIPOTESIS KOEFISIEN BETA 1 (PENGARUH UANG SAKU TERHADAP IPK)\n\n")

cat("p-value =", round(p_beta1, 5), "\n")
cat("alpha   =", alpha, "\n\n")


if (p_beta1 < alpha) {
  cat("Karena p-value <", alpha, ", maka keputusan: Tolak H0.\n")
  cat("Kesimpulan: Uang saku berpengaruh signifikan terhadap IPK mahasiswa.\n")
} else {
  cat("Karena p-value >=", alpha, ", maka keputusan: Gagal menolak H0.\n")
  cat("Kesimpulan: Uang saku tidak berpengaruh signifikan terhadap IPK mahasiswa.\n")
}

```

```{r}
# Uji korelasi Pearson
uji_korelasi <- cor.test(data$UangSaku, data$IPK, method = "pearson")

r_value <- uji_korelasi$estimate
p_value <- uji_korelasi$p.value
alpha <- 0.05

cat("UJI KORELASI PEARSON: Uang Saku vs IPK \n\n")

cat("Nilai korelasi (r) =", round(r_value, 5), "\n")
cat("p-value            =", round(p_value, 5), "\n")
cat("alpha              =", alpha, "\n\n")


nilai_kekuatan <- function(r) {
  r_abs <- abs(r)
  if (r_abs < 0.2) return("sangat lemah")
  else if (r_abs < 0.4) return("lemah")
  else if (r_abs < 0.6) return("cukup")
  else if (r_abs < 0.8) return("kuat")
  else return("sangat kuat")
}

kekuatan <- nilai_kekuatan(r_value)
arah <- ifelse(r_value > 0, "positif", "negatif")

cat("Kekuatan korelasi :", kekuatan, "\n")
cat("Arah korelasi     :", arah, "\n\n")


if (p_value < alpha) {
  cat("Karena p-value <", alpha, ", maka keputusan: Tolak H0.\n")
  cat("Kesimpulan: Terdapat hubungan (korelasi) yang signifikan antara uang saku dan IPK.\n")
} else {
  cat("Karena p-value >=", alpha, ", maka keputusan: Gagal menolak H0.\n")
  cat("Kesimpulan: Tidak terdapat hubungan signifikan antara uang saku dan IPK.\n")
}

```

**UJI ASUMSI KLASIK REGRESI LINIER**

```{r}

# 1. Uji linearitas hubungan
plot(data$UangSaku, data$IPK,
     pch = 19,
     xlab="Uang Saku",
     ylab="IPK",
     main="Uji Linearitas Hubungan")

abline(model, col="blue", lwd=2)

```

```{r}
# 2. Ekspetasi nilai error = 0
mean_residual <- mean(res)
mean_residual

plot(fitted(model), res,
xlab = "Nilai Prediksi (Fitted Values)",
ylab = "Residual",
main = "Pemeriksaan Asumsi E(ε) = 0",
pch = 19, col = "blue")
abline(h = 0, col = "red", lwd = 2)
```

```{r}
# 3. Homoskedastisitas

plot(model$fitted.values, res,
     pch = 19,
     xlab="Fitted Values",
     ylab="Residual",
     main="Plot Residual vs Fitted")

abline(h=0, col="red", lwd=2)

library(lmtest)
bptest(model)
```

```{r}
# 4. Distribusi Normal Residual

## a. histogram residual
hist(res,
     breaks = 10,
     main="Histogram Residual",
     xlab="Residual",
     col="lightblue")

## b. QQ Plot residual
qqnorm(res,
       main="QQ Plot Residual")
qqline(res, col="red", lwd=2)

```

```{r}
# 5. Uji Normalitas Shapiro–Wilk

shapiro.test(res)

```
