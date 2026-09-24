import pandas as pd

df = pd.read_csv("ecommerce_sales_analysis_recovered.csv")
df["Order_Date"] = pd.to_datetime(df["Order_Date"])
print(df.dtypes)
print(df.head())
print(df.info())
print("Duplicate Rows:", df.duplicated().sum())
print(df.describe())
print("\nSales by Category:")
print(df.groupby("Category")["Sales"].sum().sort_values(ascending=False))
print("\nSales by Region:")
print(df.groupby("Region")["Sales"].sum().sort_values(ascending=False))
print("\nTop 10 Products by Sales:")
print(
    df.groupby("Product")["Sales"]
    .sum()
    .sort_values(ascending=False)
    .head(10)
)
df["Month"] = df["Order_Date"].dt.month_name()

monthly_sales = df.groupby("Month")["Sales"].sum()

print("\nMonthly Sales:")
print(monthly_sales)
print("\nProfit by Category:")
print(
    df.groupby("Category")["Profit"]
    .sum()
    .sort_values(ascending=False)
)
print("\n===== KPI SUMMARY =====")

print("Total Sales:", round(df["Sales"].sum(), 2))
print("Total Profit:", round(df["Profit"].sum(), 2))
print("Total Orders:", df["Order_ID"].nunique())
print("Total Quantity:", df["Quantity"].sum())
print("Average Order Value:", round(df["Sales"].mean(), 2))