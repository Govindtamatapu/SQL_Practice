SELECT
    table_schema,
    table_name,
    table_type,
    engine,
    table_rows,
    avg_row_length,
    data_length,
    max_data_length,
    index_length,
    data_free,
    auto_increment,
    create_time,
    update_time,
    table_comment
FROM
    information_schema.tables
WHERE
    table_type NOT LIKE '%VIEW%'
ORDER BY
    table_schema,
    table_name;