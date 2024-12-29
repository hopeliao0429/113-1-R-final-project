# 安裝並載入必要套件
install.packages("tidyverse")
library(tidyverse)

# 準備資料
data_with_ratio <- tribble(
  ~field1, ~占比,
  "稅課收入-房屋稅", 20.5,
  "稅課收入-契稅", 10.3,
  "稅課收入-娛樂稅", 5.2,
  "稅課收入-土地稅", 30.8,
  "稅課收入-統籌分配稅", 33.2
)

# 繪製長條圖
ggplot(data_with_ratio, aes(x = reorder(field1, -占比), y = 占比, fill = 占比)) +
  geom_bar(stat = "identity") +  # 繪製長條圖
  geom_text(aes(label = round(占比, 1)), hjust = -0.2, color = "black") +  # 添加數值標籤
  coord_flip() +  # 旋轉圖表
  scale_fill_gradient(low = "lightblue", high = "darkblue") +  # 設置顏色梯度
  labs(
    title = "102 年新北市收入占比",
    x = "收入項目",
    y = "占比 (%)"
  ) +
  theme_minimal() +  # 設置簡約主題
  theme(
    legend.position = "none",  # 隱藏圖例
    plot.title = element_text(hjust = 0.5, size = 16, face = "bold"),  # 美化標題
    axis.text = element_text(size = 12),  # 調整軸文字大小
    axis.title = element_text(size = 14)  # 調整軸標題大小
  )
