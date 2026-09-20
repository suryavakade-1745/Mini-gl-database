# Mini General Ledger Database

A relational General Ledger database built on PostgreSQL, 
modelled on SAP FI document structure. Designed to practice 
SQL for finance — covering trial balance, vendor analysis, 
and period-wise reporting.

## SAP Table Mapping
| This Project       | SAP Equivalent                  |
|--------------------|---------------------------------|
| chart_of_accounts  | SKA1 / SKB1 (GL master)         |
| vendor_master      | LFA1 (vendor master)            |
| journal_entries    | BKPF + BSEG / ACDOCA (S/4HANA) |
| document_no        | BELNR (document number)         |

## What's Inside
- `schema.sql` — table structure (3 tables)
- `load_data.sql` — all data as INSERT statements (40 documents, 80 lines)
- `Queries.sql` — 14 queries covering Week 1–3 topics
- `chart_of_accounts.csv`, `vendor_master.csv`, `journal_entries.csv` — raw data

## Queries Covered
- Expense account listing
- High value debit entries
- Period-wise (March 2026) entries
- Trial balance (raw and with account names)
- Document-level balance integrity check
- Monthly expense totals
- Vendor spend ranking
- Vendors with no transactions (LEFT JOIN)

## Tools Used
- PostgreSQL 18
- pgAdmin 4

## How to Run
1. Run `schema.sql` in pgAdmin to create tables
2. Run `load_data.sql` to load all data
3. Run any query from `Queries.sql`
