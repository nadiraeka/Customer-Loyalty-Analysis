## Customer Loyalty Analysis Using Multiple Linear Regression

### 📄 Description
<div align="justify">

This project analyzes the factors that influence customer loyalty in retail using a multiple linear regression approach. The dataset consists of 1712 observations with six variables: Price, Quality, Trust, Customer Satisfaction, Negative Publicity, and Loyalty (as the response). After preprocessing and exploratory data analysis  (including outlier detection, pairplots, and correlation heatmaps) stepwise regression was applied to determine the most impactful predictors. Further diagnostics involved checking multicollinearity using VIF, testing model assumptions (normality, linearity, independence, homoskedasticity), and evaluating the benefit of adding an interaction term between Price and Trust. Performance of models was assessed using metrics such as R², RMSE, MAE, AIC, and SBIC. The final model, which includes the interaction term, achieved the best performance, indicating that Price, Quality, Trust, Customer Satisfaction, Negative Publicity, and their interaction significantly affect customer loyalty.

</div>

### 🛠 Tools & Libraries
- R Studio 
- `readxl` for reading Excel files  
- `tidyverse` for data manipulation  
- `caret` for data splitting and model evaluation  
- `olsrr` for best subset and stepwise regression  
- `car`, `lmtest` for diagnostic tests and assumptions checking

<div align='center'>

  <img src="https://github.com/user-attachments/assets/b6a95700-b7d4-4f5e-8b86-874c6c703764" width="400" />
  <img src="https://github.com/user-attachments/assets/3ffcd459-f514-43bb-a93d-5a601832e7ed" width="400" />
  <img src="https://github.com/user-attachments/assets/f7343059-e50e-46aa-bc58-90f056ba18ba" width="400" />
  <img src="https://github.com/user-attachments/assets/29a85957-0269-42ed-936c-e4daa5f0f4c0" width="400" />
  <img src="https://github.com/user-attachments/assets/b468c58a-1d89-4bef-95ef-dfacf6fae36d" width="400" />

</div>
