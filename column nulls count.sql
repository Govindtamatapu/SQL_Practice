SELECT
    nspname,
    relname,
    attname,
    typname,
    (stanullfrac*100)::int AS null_percent
FROM
    pg_class c
JOIN
    pg_namespace ns
ON
    (ns.oid=relnamespace)
JOIN
    pg_attribute
ON
    (c.oid=attrelid)
JOIN
    pg_type t
ON
    (t.oid=atttypid)
JOIN
    pg_statistic
ON
    (c.oid=starelid AND staattnum=attnum)
WHERE
    (stanullfrac*100)::int = 100
        AND
    nspname NOT LIKE E'pg\\_%'
        AND
    nspname != 'information_schema'
        AND
    relkind = 'r'
        AND
    NOT attisdropped
        AND
    attstattarget != 0
    --    AND
    --reltuples >= 100
ORDER BY
    nspname,
    relname,
    attname;