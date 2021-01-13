SELECT
    table_name,
    table_rows,
    CONCAT(ROUND(data_length/(1024*1024),2), 'M') DATA,
    CONCAT(ROUND(index_length/(1024*1024),2), 'M') idx,
    CONCAT(ROUND((data_length + index_length)/1024,2), 'M') total_size
    FROM information_schema.TABLES
    ORDER BY (data_length+index_length) DESC;
    
