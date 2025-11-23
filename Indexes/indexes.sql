use Practice

SELECT * FROM INcustomers

CREATE CLUSTERED INDEX idx_INcustomers_ID ON INcustomers(c_id)

--How to drop it
DROP INDEX idx_INcustomers_ID ON INcustomers

SELECT * FROM INcustomers
WHERE LastName = 'Kapoor'


CREATE NONCLUSTERED INDEX idx_INcustomers_LName ON INcustomers (LastName)

CREATE NONCLUSTERED INDEX idx_INcustomers_FName ON INcustomers (FirstName)

CREATE UNIQUE CLUSTERED INDEX idx_uniqu ON orders(order_id)