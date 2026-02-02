# Insurance Claims ELT & Analytics Pipeline

## Project Description
This project demonstrates an end-to-end ELT (Extract, Load, Transform) pipeline for insurance claims and customer data. The pipeline generates synthetic customer and claims data, loads it into MongoDB, extracts and replicates it into Snowflake, transforms it using DBT, and finally visualizes insights in Power BI. The pipeline provides actionable analytics for claim types, fraud detection, customer distribution, and total claim amounts.

<img width="1235" height="716" alt="image" src="https://github.com/user-attachments/assets/1368fafd-e061-43be-b58d-3869e3797cb5" />

Key features include:
- Synthetic data generation for customers and claims
- Integration of MongoDB with Snowflake using Airbyte
- Staging and transformation using DBT
- Creation of analytical views for business reporting
- Interactive Power BI dashboards for data visualization

---

## Architecture
<img width="783" height="280" alt="image" src="https://github.com/user-attachments/assets/de06595e-af25-4d6a-b5bb-2140fbbad036" />

### Data Generation
- data_generator.py generates synthetic customer and claims data.
- Fields include CUSTOMER_ID, CLAIM_ID, CLAIM_TYPE, AMOUNT, STATE, IS_FRAUD, etc.

### Data Loading
- Load generated data into MongoDB collections: claims and customers.
- Data Extraction & Replication
- Airbyte extracts data from MongoDB and loads it into Snowflake raw layer.
- Data is replicated to staging tables (stg_claims, stg_customers) for transformations.

### Transformation
- DBT cleans and transforms staging tables into analytical views.
- Includes type conversions, boolean handling, and aggregations.

### Analytics & Visualization
- Power BI consumes DBT-created views:
- claims_summary — Monthly claim counts, fraud counts, total amounts by claim type.
- customer_state_summary — Customer distribution across states.

---

## Schema

### Raw Layer
raw_claims
| Column      | Type    | Description             |
| ----------- | ------- | ----------------------- |
| AMOUNT      | Float   | Claim amount            |
| CLAIM_ID    | Varchar | Unique claim identifier |
| CLAIM_TYPE  | Varchar | Type of claim           |
| CUSTOMER_ID | Varchar | Customer identifier     |
| DATE        | Varchar | Claim date              |
| IS_FRAUD    | Varchar | Fraud flag              |
| ...         | ...     | Metadata and CDC fields |

raw_customers
| Column      | Type    | Description                |
| ----------- | ------- | -------------------------- |
| CUSTOMER_ID | Varchar | Unique customer identifier |
| NAME        | Varchar | Customer name              |
| POLICY_TYPE | Varchar | Policy type                |
| STATE       | Varchar | Customer state             |
| ...         | ...     | Metadata and CDC fields    |

### Stage Layer

stg_claims
| Column      | Type    | Description             |
| ----------- | ------- | ----------------------- |
| CLAIM_ID    | Varchar | Unique claim identifier |
| CUSTOMER_ID | Varchar | Customer identifier     |
| AMOUNT      | Float   | Claim amount            |
| CLAIM_DATE  | Date    | Claim date              |
| CLAIM_TYPE  | Varchar | Type of claim           |
| IS_FRAUD    | Boolean | Fraud flag              |

stg_customers
| Column      | Type    | Description                |
| ----------- | ------- | -------------------------- |
| CUSTOMER_ID | Varchar | Unique customer identifier |
| POLICY_TYPE | Varchar | Policy type                |
| STATE       | Varchar | Customer state             |

### Views

claims_summary
| Column       | Type    | Description        |
| ------------ | ------- | ------------------ |
| MONTH        | Date    | Month of claim     |
| CLAIM_TYPE   | Varchar | Type of claim      |
| CLAIMS_COUNT | Number  | Total claims count |
| FRAUD_COUNT  | Number  | Total fraud claims |
| TOTAL_AMOUNT | Float   | Total claim amount |

customer_state_summary
| Column         | Type    | Description        |
| -------------- | ------- | ------------------ |
| STATE          | Varchar | Customer state     |
| CUSTOMER_COUNT | Number  | Count of customers |

---

## Dependencies
- Python 3.x
- MongoDB
- Snowflake
- Airbyte
- DBT (v1.11.2)
- Power BI Desktop

---

## Usage
- Run data_generator.py to create synthetic data.
- Load data into MongoDB.
- Configure Airbyte to extract MongoDB data to Snowflake.
- Run DBT to transform raw/stage tables into analytical views.
- Connect Power BI to Snowflake and build dashboards using DBT views.

---

## Key Highlights
- End-to-end ELT pipeline for insurance data, integrating MongoDB, Snowflake, DBT, Airbyte, and Power BI.
- Full data flow from synthetic data generation → raw ingestion → staging → transformation → analytical views → interactive dashboards.
- Built **interactive Power BI dashboards** providing insights into:
  - Insurance claim types
  - Monthly fraud trends
  - Customer distribution across states
  - Total and fraudulent claim amounts
- **Scalable schema design** with raw → stage → gold layers to support future data growth.
- **Data volume handled**: 5,259 customer records processed and analyzed.
- Implements **CDC and metadata tracking** for data reliability and auditability.
- Supports decision-making and monitoring of fraud patterns in insurance claims.



