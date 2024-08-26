CREATE OR REPLACE FUNCTION log_product_insert()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO tb_history (product_id, operation_id, created_at)
    VALUES (NEW.id, 1, NOW());
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_insert_tb_products
AFTER INSERT ON tb_products
FOR EACH ROW
EXECUTE FUNCTION log_product_insert();
