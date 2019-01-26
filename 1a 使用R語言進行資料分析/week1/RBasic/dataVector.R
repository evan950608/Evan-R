year1 <- 87:91
power1 <- c(60000000, 61234562, 694817401, 
            71840244, 72840024)
power2 <- c(50984502, 691048501, 6183951.12414,
            9385029324, 121231412)

# 找出年度 year1 中，用電量超過 7000000 的年份
ans1 <- year1[power1 > 7000000]

# 計算 year1 這段時間的 power1 平均用電量
ans2 <- mean(power1)

# 計算 year1 這段時間的 power1 用電量標準差
ans3 <- sd(power1)

# 計算一筆數據的「標準分數」
# 將數據減去平均數後除以標準差
# 計算 year1 這段時間的 power1 用電標準分數
ans4 <- (power1 - mean(power1)) / sd(power1)

# 計算 year1 這段時間的 power2 平均用電量
# 計算 year1 這段時間的 power2 用電量標準差
# 計算 year1 這段時間的 power2 用電標準分數
ans5 <- mean(power2)
ans6 <- sd(power2)
ans7 <- (power2 - mean(power2)) / sd(power2)

# 找出 year1 這段時間
# power1 超過 10% 的 power2 的年份
ans8 <- year1[power1 > 0.1 * power2]
