# 📊 Customer Revenue and Retention Analysis

This SQL-based project analyzes customer and order behavior for a fictional e-commerce company. The goal is to uncover business insights around revenue generation, repeat purchasing, and customer retention patterns.

By writing SQL queries from scratch, I answered a series of real-world business questions and performed exploratory analysis across customer and order data.

---

## 🛠 Tools & Skills Used

- SQL (MySQL)
- Joins, Aggregation, Grouping
- Date functions (DATEDIFF, DATE_FORMAT)
- Subqueries, `CASE WHEN`, and filtering
- Analytical thinking applied to customer behavior

---

## 🔍 Business Questions & Insights

### 1. Which customers signed up in 2024?
**✅ Answer:** Bilal, Fatima, Amina, Zara, Tariq  
**📝 Insight:** All current customers signed up in 2024 — recent acquisition focus.

---

### 2. Which customers placed orders above $200?
**✅ Answer:** Fatima, Amina, Bilal, Zara  
**📝 Insight:** These customers placed higher-value orders, indicating strong purchasing behavior.

---

### 3. Who placed at least one order?
**✅ Answer:** All customers  
**📝 Insight:** No dormant users — every customer completed at least one purchase.

---

### 4. Total number of orders?
**✅ Answer:** 9

---

### 5. Total revenue generated?
**✅ Answer:** $2,080.00

---

### 6. What is the average order value per customer?
- Fatima: $226.67  
- Bilal: $200.00  
- Amina: $400.00  
- Zara: $225.00  
- Tariq: $150.00  
**📝 Insight:** Amina had the highest average per order; Fatima had the most consistent and frequent spending.

---

### 7. Total number of orders per customer:
- Fatima: 3  
- Bilal: 2  
- Amina: 1  
- Zara: 2  
- Tariq: 1  

---

### 8. Total spending per customer:
- Fatima: $680.00  
- Bilal: $400.00  
- Amina: $400.00  
- Zara: $450.00  
- Tariq: $150.00  

---

### 9. Highest single order total?
**✅ Answer:** Fatima

---

### 10. Days between signup and first order:
- Fatima: 106 days  
- Bilal: 66 days  
- Amina: 60 days  
- Zara: 43 days  
- Tariq: 50 days  
**📝 Insight:** There’s a delay between sign-up and first purchase — could be improved with onboarding campaigns.

---

### 11. Who ordered within 7 days of signup?
**✅ Answer:** 0 customers  
**📝 Insight:** No immediate conversions — suggests opportunity to improve early engagement.

---

### 12. Top 3 customers by total spending:
- Fatima ($680.00)  
- Bilal ($400.00)  
- Amina ($400.00)  

---

### 13. Customers ordered by signup date:
1. Fatima  
2. Bilal  
3. Amina  
4. Zara  
5. Tariq

---

### 14. 5 most recent orders:
1. Fatima  
2. Tariq  
3. Bilal  
4. Zara  
5. Amina  

---

### 15. Which customers placed more than one order?
**✅ Answer:** Fatima, Bilal, Tariq  
**📝 Insight:** These are retained customers — valuable segment for loyalty efforts.

---

### 16. % of repeat buyers (2+ orders)?
**✅ Answer:** 60%  
**📝 Insight:** Retention rate is promising — 3 out of 5 customers returned to buy again.

---

## 📁 Files in This Repository
- `customer_revenue_retention.sql`: All SQL queries used to generate these insights.
- `README.md`: Project description, answers, and insights (this file).

---

### 🚀 Created by Imad Qureshi
