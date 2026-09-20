-- =========================================================
-- Mini GL Project: load all data via INSERT statements
-- Safe to run more than once (ON CONFLICT DO NOTHING)
-- =========================================================

-- 1) Chart of accounts
INSERT INTO chart_of_accounts (account_id, account_name, account_type) VALUES
('1000', 'Cash', 'Asset'),
('1010', 'Bank Account', 'Asset'),
('1020', 'Accounts Receivable', 'Asset'),
('1030', 'Inventory', 'Asset'),
('1040', 'Prepaid Expenses', 'Asset'),
('1050', 'Office Equipment', 'Asset'),
('2000', 'Accounts Payable', 'Liability'),
('2010', 'TDS Payable', 'Liability'),
('2020', 'GST Payable', 'Liability'),
('2030', 'Salaries Payable', 'Liability'),
('3000', 'Capital', 'Equity'),
('3010', 'Retained Earnings', 'Equity'),
('4000', 'Sales Revenue', 'Revenue'),
('4010', 'Service Revenue', 'Revenue'),
('5000', 'Rent Expense', 'Expense'),
('5010', 'Salaries Expense', 'Expense'),
('5020', 'Utilities Expense', 'Expense'),
('5030', 'Office Supplies Expense', 'Expense'),
('5040', 'Travel Expense', 'Expense'),
('5050', 'Professional Fees Expense', 'Expense'),
('5060', 'Freight Expense', 'Expense')
ON CONFLICT (account_id) DO NOTHING;

-- 2) Vendor master
INSERT INTO vendor_master (vendor_id, vendor_name, city) VALUES
('V001', 'Sharma Traders', 'Bangalore'),
('V002', 'Kumar Electronics', 'Mumbai'),
('V003', 'Reddy Logistics', 'Hyderabad'),
('V004', 'Patel Office Supplies', 'Ahmedabad'),
('V005', 'Iyer Consulting', 'Chennai'),
('V006', 'Singh Furniture', 'Delhi'),
('V007', 'Mehta Stationery', 'Pune'),
('V008', 'Nair Travels', 'Kochi'),
('V009', 'Gupta IT Services', 'Bangalore'),
('V010', 'Das Print Solutions', 'Kolkata')
ON CONFLICT (vendor_id) DO NOTHING;

-- 3) Journal entries
INSERT INTO journal_entries (entry_id, document_no, entry_date, account_id, vendor_id, debit_amount, credit_amount, description) VALUES
(1, 1, '2026-01-05', '1010', NULL, 500000, 0, 'Capital introduced by owner'),
(2, 1, '2026-01-05', '3000', NULL, 0, 500000, 'Capital introduced by owner'),
(3, 2, '2026-01-10', '1050', 'V002', 80000, 0, 'Office equipment purchased on credit'),
(4, 2, '2026-01-10', '2000', 'V002', 0, 80000, 'Office equipment purchased on credit'),
(5, 3, '2026-01-15', '5000', NULL, 25000, 0, 'Rent paid for January'),
(6, 3, '2026-01-15', '1010', NULL, 0, 25000, 'Rent paid for January'),
(7, 4, '2026-01-20', '1010', NULL, 60000, 0, 'Service revenue received'),
(8, 4, '2026-01-20', '4010', NULL, 0, 60000, 'Service revenue received'),
(9, 5, '2026-01-25', '5030', 'V007', 5000, 0, 'Office supplies purchased on credit'),
(10, 5, '2026-01-25', '2000', 'V007', 0, 5000, 'Office supplies purchased on credit'),
(11, 6, '2026-01-28', '2000', 'V002', 80000, 0, 'Payment made to vendor for equipment'),
(12, 6, '2026-01-28', '1010', 'V002', 0, 80000, 'Payment made to vendor for equipment'),
(13, 7, '2026-02-03', '5010', NULL, 150000, 0, 'Salaries paid for January'),
(14, 7, '2026-02-03', '1010', NULL, 0, 150000, 'Salaries paid for January'),
(15, 8, '2026-02-08', '1030', 'V001', 120000, 0, 'Inventory purchased on credit'),
(16, 8, '2026-02-08', '2000', 'V001', 0, 120000, 'Inventory purchased on credit'),
(17, 9, '2026-02-12', '1000', NULL, 45000, 0, 'Cash sale of goods'),
(18, 9, '2026-02-12', '4000', NULL, 0, 45000, 'Cash sale of goods'),
(19, 10, '2026-02-15', '5020', NULL, 8000, 0, 'Electricity bill paid'),
(20, 10, '2026-02-15', '1010', NULL, 0, 8000, 'Electricity bill paid'),
(21, 11, '2026-02-18', '5040', 'V008', 12000, 0, 'Travel expense booked'),
(22, 11, '2026-02-18', '2000', 'V008', 0, 12000, 'Travel expense booked'),
(23, 12, '2026-02-22', '2000', 'V001', 60000, 0, 'Partial payment to vendor'),
(24, 12, '2026-02-22', '1010', 'V001', 0, 60000, 'Partial payment to vendor'),
(25, 13, '2026-02-25', '5050', 'V005', 30000, 0, 'Consulting fees booked'),
(26, 13, '2026-02-25', '2000', 'V005', 0, 30000, 'Consulting fees booked'),
(27, 14, '2026-03-02', '2010', NULL, 3000, 0, 'TDS remitted to government'),
(28, 14, '2026-03-02', '1010', NULL, 0, 3000, 'TDS remitted to government'),
(29, 15, '2026-03-05', '1020', NULL, 90000, 0, 'Credit sale to customer'),
(30, 15, '2026-03-05', '4000', NULL, 0, 90000, 'Credit sale to customer'),
(31, 16, '2026-03-10', '1010', NULL, 90000, 0, 'Collection from customer'),
(32, 16, '2026-03-10', '1020', NULL, 0, 90000, 'Collection from customer'),
(33, 17, '2026-03-14', '1050', 'V006', 45000, 0, 'Furniture purchased on credit'),
(34, 17, '2026-03-14', '2000', 'V006', 0, 45000, 'Furniture purchased on credit'),
(35, 18, '2026-03-18', '2000', 'V008', 12000, 0, 'Payment made to vendor for travel'),
(36, 18, '2026-03-18', '1010', 'V008', 0, 12000, 'Payment made to vendor for travel'),
(37, 19, '2026-03-22', '2020', NULL, 15000, 0, 'GST liability paid'),
(38, 19, '2026-03-22', '1010', NULL, 0, 15000, 'GST liability paid'),
(39, 20, '2026-03-26', '5000', NULL, 25000, 0, 'Rent paid for March'),
(40, 20, '2026-03-26', '1010', NULL, 0, 25000, 'Rent paid for March'),
(41, 21, '2026-04-02', '1040', NULL, 20000, 0, 'Insurance premium prepaid'),
(42, 21, '2026-04-02', '1010', NULL, 0, 20000, 'Insurance premium prepaid'),
(43, 22, '2026-04-06', '5050', 'V009', 18000, 0, 'IT consulting fees booked'),
(44, 22, '2026-04-06', '2000', 'V009', 0, 18000, 'IT consulting fees booked'),
(45, 23, '2026-04-10', '5010', NULL, 150000, 0, 'Salaries paid for March'),
(46, 23, '2026-04-10', '1010', NULL, 0, 150000, 'Salaries paid for March'),
(47, 24, '2026-04-14', '1010', NULL, 75000, 0, 'Service revenue received'),
(48, 24, '2026-04-14', '4010', NULL, 0, 75000, 'Service revenue received'),
(49, 25, '2026-04-18', '2000', 'V009', 18000, 0, 'Payment made to vendor for IT services'),
(50, 25, '2026-04-18', '1010', 'V009', 0, 18000, 'Payment made to vendor for IT services'),
(51, 26, '2026-04-22', '5030', 'V010', 6000, 0, 'Printing materials purchased on credit'),
(52, 26, '2026-04-22', '2000', 'V010', 0, 6000, 'Printing materials purchased on credit'),
(53, 27, '2026-04-26', '5030', 'V004', 4000, 0, 'Stationery purchased on credit'),
(54, 27, '2026-04-26', '2000', 'V004', 0, 4000, 'Stationery purchased on credit'),
(55, 28, '2026-04-28', '2000', 'V010', 6000, 0, 'Payment made to vendor for printing'),
(56, 28, '2026-04-28', '1010', 'V010', 0, 6000, 'Payment made to vendor for printing'),
(57, 29, '2026-05-02', '5000', NULL, 25000, 0, 'Rent paid for April'),
(58, 29, '2026-05-02', '1010', NULL, 0, 25000, 'Rent paid for April'),
(59, 30, '2026-05-06', '1000', NULL, 32000, 0, 'Cash sale of goods'),
(60, 30, '2026-05-06', '4000', NULL, 0, 32000, 'Cash sale of goods'),
(61, 31, '2026-05-10', '5060', 'V003', 9000, 0, 'Freight charges booked'),
(62, 31, '2026-05-10', '2000', 'V003', 0, 9000, 'Freight charges booked'),
(63, 32, '2026-05-14', '2000', 'V003', 9000, 0, 'Payment made to vendor for freight'),
(64, 32, '2026-05-14', '1010', 'V003', 0, 9000, 'Payment made to vendor for freight'),
(65, 33, '2026-05-18', '5010', NULL, 150000, 0, 'Salaries paid for April'),
(66, 33, '2026-05-18', '1010', NULL, 0, 150000, 'Salaries paid for April'),
(67, 34, '2026-05-22', '1020', NULL, 55000, 0, 'Credit sale to customer'),
(68, 34, '2026-05-22', '4000', NULL, 0, 55000, 'Credit sale to customer'),
(69, 35, '2026-05-26', '1010', NULL, 55000, 0, 'Collection from customer'),
(70, 35, '2026-05-26', '1020', NULL, 0, 55000, 'Collection from customer'),
(71, 36, '2026-06-02', '5000', NULL, 25000, 0, 'Rent paid for May'),
(72, 36, '2026-06-02', '1010', NULL, 0, 25000, 'Rent paid for May'),
(73, 37, '2026-06-06', '1030', 'V001', 95000, 0, 'Inventory purchased on credit'),
(74, 37, '2026-06-06', '2000', 'V001', 0, 95000, 'Inventory purchased on credit'),
(75, 38, '2026-06-10', '2000', 'V001', 50000, 0, 'Partial payment to vendor'),
(76, 38, '2026-06-10', '1010', 'V001', 0, 50000, 'Partial payment to vendor'),
(77, 39, '2026-06-14', '5020', NULL, 8500, 0, 'Electricity bill paid'),
(78, 39, '2026-06-14', '1010', NULL, 0, 8500, 'Electricity bill paid'),
(79, 40, '2026-06-18', '1010', NULL, 68000, 0, 'Service revenue received'),
(80, 40, '2026-06-18', '4010', NULL, 0, 68000, 'Service revenue received')
ON CONFLICT (entry_id) DO NOTHING;

-- 4) Sync the auto-number sequence so future inserts don't clash
SELECT setval('journal_entries_entry_id_seq', (SELECT MAX(entry_id) FROM journal_entries));

-- 5) Quick check: expect 21 / 10 / 80
SELECT 'chart_of_accounts' AS table_name, COUNT(*) FROM chart_of_accounts
UNION ALL SELECT 'vendor_master', COUNT(*) FROM vendor_master
UNION ALL SELECT 'journal_entries', COUNT(*) FROM journal_entries;