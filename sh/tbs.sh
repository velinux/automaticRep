. $(pwd)/vars/oracle.env

echo "set lines 200
SELECT tablespace_name,
ROUND( SUM (total_mb)) MBTOTAL,
ROUND( SUM (total_mb)- SUM (free_mb)) MB_USADO,
ROUND(( SUM (total_mb)- SUM (free_mb))/ SUM (total_mb)*100) PCT_USADO_MB,
ROUND( SUM (max_mb) - ( SUM (total_mb)- SUM (free_mb))) FREE_SPACE_MBMAX,
ROUND( SUM (max_mb)) MAXTOTAL,
ROUND(( SUM (total_mb)- SUM (free_mb))/ SUM (max_mb)*100) PORC_USADO_MAX
FROM (
  SELECT tablespace_name, SUM (bytes)/1024/1024 FREE_MB,
  0 TOTAL_MB, 0 MAX_MB
  FROM dba_free_space
  GROUP BY tablespace_name
  UNION ALL
  SELECT tablespace_name, 0 CURRENT_MB,
  SUM (bytes)/1024/1024 TOTAL_MB,
  SUM ( DECODE (maxbytes,0,bytes, maxbytes))/1024/1024 MAX_MB
  FROM dba_data_files GROUP BY tablespace_name)
GROUP BY tablespace_name ;" | sqlplus -s $USER/$PW>@$DB > /tmp/tbs.log
