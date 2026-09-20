CREATE TABLE chart_of_accounts (
  account_id   VARCHAR(10) PRIMARY KEY,
  account_name VARCHAR(100),
  account_type VARCHAR(20)
);

CREATE TABLE vendor_master (
  vendor_id   VARCHAR(10) PRIMARY KEY,
  vendor_name VARCHAR(100),
  city        VARCHAR(50)
);

CREATE TABLE journal_entries (
  entry_id      SERIAL PRIMARY KEY,
  document_no   INTEGER,
  entry_date    DATE,
  account_id    VARCHAR(10) REFERENCES chart_of_accounts(account_id),
  vendor_id     VARCHAR(10) REFERENCES vendor_master(vendor_id),
  debit_amount  NUMERIC(12,2),
  credit_amount NUMERIC(12,2),
  description   VARCHAR(200)
);