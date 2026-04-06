# Create the initial directory
mkdir -p raw_logs

echo "2026-02-28 admin 192.168.1.50 LOGIN_SUCCESS" > raw_logs/access_01.log
chmod 755 raw_logs/access_01.log

echo "2026-02-28 hacker 10.0.0.99 UNAUTHORIZED" > raw_logs/access_02.log
chmod 755 raw_logs/access_02.log

echo "2026-02-28 suspect_user 172.16.0.5 UnAuThOrIzEd_AcCeSs" > raw_logs/access_03.log
chmod 755 raw_logs/access_03.log

cat <<EOF > raw_logs/access_04.log
2026-02-28 guest 192.168.1.102 LOGIN_SUCCESS
2026-02-28 root_intruder 10.0.5.22 UNAUTHORIZED_SUDO_ATTEMPT
2026-02-28 guest 192.168.1.102 LOGOUT

chmod 755 raw_logs/access_04.log
EOF #end of file