-- All expense accounts
SELECT * FROM chart_of_accounts WHERE account_type = 'Expense';

-- Entries above 50,000, largest first
SELECT * FROM journal_entries
WHERE debit_amount > 50000
ORDER BY debit_amount DESC;

-- Everything posted in March 2026
SELECT * FROM journal_entries
WHERE entry_date BETWEEN '2026-03-01' AND '2026-03-31';

-- Trial balance: total debits and credits per account
SELECT account_id,
       SUM(debit_amount)  AS total_debit,
       SUM(credit_amount) AS total_credit
FROM journal_entries
GROUP BY account_id
ORDER BY account_id;

-- Does every document balance? (should return ZERO rows)
SELECT document_no,
       SUM(debit_amount)  AS dr,
       SUM(credit_amount) AS cr
FROM journal_entries
GROUP BY document_no
HAVING SUM(debit_amount) <> SUM(credit_amount);

-- Monthly expense totals
SELECT DATE_TRUNC('month', entry_date) AS month,
       SUM(debit_amount) AS expenses
FROM journal_entries
WHERE account_id LIKE '5%'
GROUP BY month
ORDER BY month;

-- Trial balance with account names and types
SELECT c.account_id, c.account_name, c.account_type,
       SUM(j.debit_amount)  AS total_debit,
       SUM(j.credit_amount) AS total_credit
FROM journal_entries j
JOIN chart_of_accounts c ON j.account_id = c.account_id
GROUP BY c.account_id, c.account_name, c.account_type
ORDER BY c.account_id;

-- Total purchases per vendor
SELECT v.vendor_name, v.city,
       SUM(j.credit_amount) AS total_billed
FROM journal_entries j
JOIN vendor_master v ON j.vendor_id = v.vendor_id
WHERE j.account_id = '2000'
GROUP BY v.vendor_name, v.city
ORDER BY total_billed DESC;

-- LEFT JOIN: vendors with NO transactions at all
SELECT v.vendor_id, v.vendor_name
FROM vendor_master v
LEFT JOIN journal_entries j ON v.vendor_id = j.vendor_id
WHERE j.entry_id IS NULL;

-- Outstanding balance per vendor (billed minus paid)
WITH vendor_activity AS (
  SELECT vendor_id,
         SUM(credit_amount) AS billed,
         SUM(debit_amount)  AS paid
  FROM journal_entries
  WHERE account_id = '2000'
  GROUP BY vendor_id
)
SELECT v.vendor_name,
       a.billed, a.paid,
       a.billed - a.paid AS outstanding
FROM vendor_activity a
JOIN vendor_master v ON a.vendor_id = v.vendor_id
ORDER BY outstanding DESC;

-- Classify each account's net balance as Debit or Credit balance
SELECT account_id,
       SUM(debit_amount) - SUM(credit_amount) AS net,
       CASE
         WHEN SUM(debit_amount) - SUM(credit_amount) > 0 THEN 'Debit balance'
         WHEN SUM(debit_amount) - SUM(credit_amount) < 0 THEN 'Credit balance'
         ELSE 'Nil'
       END AS balance_type
FROM journal_entries
GROUP BY account_id;

-- Running bank balance over time (account 1010)
SELECT entry_date, description,
       debit_amount, credit_amount,
       SUM(debit_amount - credit_amount)
         OVER (ORDER BY entry_date, entry_id) AS running_balance
FROM journal_entries
WHERE account_id = '1010'
ORDER BY entry_date, entry_id;

-- Rank vendors by total billed
SELECT v.vendor_name,
       SUM(j.credit_amount) AS total_billed,
       RANK() OVER (ORDER BY SUM(j.credit_amount) DESC) AS vendor_rank
FROM journal_entries j
JOIN vendor_master v ON j.vendor_id = v.vendor_id
WHERE j.account_id = '2000'
GROUP BY v.vendor_name;

-- Month-over-month change in service revenue
WITH monthly AS (
  SELECT DATE_TRUNC('month', entry_date) AS month,
         SUM(credit_amount) AS revenue
  FROM journal_entries
  WHERE account_id = '4010'
  GROUP BY month
)
SELECT month, revenue,
       revenue - LAG(revenue) OVER (ORDER BY month) AS change_vs_prev_month
FROM monthly
ORDER BY month;