import pandas as pd
import os

# Load raw e-commerce tables
orders = pd.read_csv('orders.csv')
sessions = pd.read_csv('website_sessions.csv')
refunds = pd.read_csv('order_item_refunds.csv')

# 1. Standardize timestamps
orders['created_at'] = pd.to_datetime(orders['created_at'])
sessions['created_at'] = pd.to_datetime(sessions['created_at'])

# 2. Handle missing UTM marketing parameters
sessions['utm_source'] = sessions['utm_source'].fillna('direct_or_organic')
sessions['utm_campaign'] = sessions['utm_campaign'].fillna('none')
sessions['utm_content'] = sessions['utm_content'].fillna('none')

# 3. Remove any duplicate session or order IDs
orders.drop_duplicates(subset=['order_id'], inplace=True)
sessions.drop_duplicates(subset=['website_session_id'], inplace=True)

# 4. Export cleaned files ready for PostgreSQL bulk load
os.makedirs('cleaned_data', exist_ok=True)
orders.to_csv('cleaned_data/orders_clean.csv', index=False)
sessions.to_csv('cleaned_data/sessions_clean.csv', index=False)
refunds.to_csv('cleaned_data/refunds_clean.csv', index=False)

print("Data cleaning completed successfully!")