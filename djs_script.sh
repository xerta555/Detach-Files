instant_run=$MAGMOD/instant_run.sh
instant_run_two=$MAGMOD/instant_run_two.sh
test -e "$instant_run" || touch "$instant_run"
chmod 0777 "$instant_run"
PS_DATA_PATH=/data/data/com.android.vending/databases/library.db

# Multiple Play Store accounts compatibility
ps_accounts=$("$MAGMOD/sqlite" $PS_DATA_PATH "SELECT account FROM ownership" | sort -u | wc -l)
ps_accounts_final=$((ps_accounts+1))

cat /dev/null > "$instant_run"

echo -e "PLAY_DB_DIR=/data/data/com.android.vending/databases\nSQLITE=${MAGIMG}/Detach\n\n\nam force-stop com.android.vending\n\ncd \$SQLITE\n\n" >> "$instant_run"
sed -n -e '31,$p' "$SERVICESH" | grep sqlite  >> "$instant_run"

echo -e "\n" >> "$instant_run"

test -e "$MAGMOD/first_detach_result.txt" || touch "$MAGMOD/first_detach_result.txt"
chmod 0777 "$MAGMOD/first_detach_result.txt"
sh "$instant_run" > "$MAGMOD/first_detach_result.txt" 2>&1

if [ "$ps_accounts" -gt "1" ]; then
	test -e "$instant_run_two" || touch "$instant_run_two"
	chmod 0777 "$instant_run_two"
	echo -e "PLAY_DB_DIR=/data/data/com.android.vending/databases\nSQLITE=${MAGIMG}/Detach\n\n\nam force-stop com.android.vending\n\ncd \$SQLITE\n\n" > "$instant_run_two"
	am force-stop com.android.vending
	for i in {1..${ps_accounts_final}}; do grep sqlite "$instant_run" > "$instant_run_two"; done
	sed -i -e 's/.\t\/sqlite/.\/sqlite/' "$instant_run_two"
	sed -i -e 's/..\/sqlite/.\/sqlite/' "$instant_run_two"
	sed -i -e "s/SQLITE=\$MODD.\/sqlite//" "$instant_run_two"
	echo -e '\n' >> "$instant_run_two"
	
	sh "$instant_run_two" > "$MAGMOD/second_detach_result.txt" 2>&1
fi

	
wrong_result=$(echo "Error: UNIQUE constraint failed: ownership.account,")
if grep -q "$wrong_result" "$MAGMOD/first_detach_result.txt"; then
	ACTAPPS=$MAGMOD/actapps.txt
	ACTAPPSBCK=$MAGMOD/actapps.bak
	FINAL=$MAGMOD/final.sh
	
	for o in "$ACTAPPS" "$ACTAPPSBCK" "$FINAL"; do touch "$o" && cat /dev/null > "$o" && chmod 0644 "$o"; done
	
	PLAY_DB_DIR=/data/data/com.android.vending/databases
	
	grep sqlite "$SERVICESH" > "$ACTAPPS"
	sed -i -e "s/.\/sqlite \$PLAY_DB_DIR\/library.db \"UPDATE ownership SET library_id = 'u-wl' where doc_id = '//" -i -e "s/'\";//" "$ACTAPPS"
	sed -i -e '1d' "$ACTAPPS"
	sed -i -e 's/[[:blank:]]*//' "$ACTAPPS"
	
	
	cp -f "$ACTAPPS" "$ACTAPPSBCK"
	
	var_ACTAPPS=$(awk '{ print }' "$ACTAPPSBCK")
	
	am force-stop com.android.vending
	
	FIRST_PCK_NAME=$(head -n 1 "$ACTAPPS")
	PRESENT_DIR=$(pwd)
	SQL_ENTRY_TEST=$(cd $MAGMOD && ./sqlite $PS_DATA_PATH "SELECT * FROM ownership WHERE doc_id = '${FIRST_PCK_NAME}' AND library_id='3'" | wc -l)
	cd "$PRESENT_DIR"
	ZERO=0
	
	chmod +x "$FINAL"
	
	if [ "$SQL_ENTRY_TEST" -eq 1 ]; then
		echo -e "\ncd $MAGMOD\n\n" >> "$FINAL"
		printf '%s\n' "$var_ACTAPPS" | while IFS= read -r line
			do echo -e "./sqlite $PLAY_DB_DIR/library.db \"DELETE FROM ownership WHERE doc_id = '$line' AND library_id = '3'\";\n" >> "$FINAL"
		done
		chmod +x "$FINAL"
		sh "$FINAL"
	else
		echo -e "\ncd $MAGMOD\n\n" >> "$FINAL"
		while [ "$ZERO" -le "$SQL_ENTRY_TEST" ]; do
			printf '%s\n' "$var_ACTAPPS" | while IFS= read -r line
				do echo -e "./sqlite $PLAY_DB_DIR/library.db \"DELETE FROM ownership WHERE doc_id = '$line' AND library_id = '3'\";\n" >> "$FINAL"
			done
			SQL_ENTRY_TEST=$(($SQL_ENTRY_TEST - 1))
		done
		sh "$FINAL"
	fi
	
	for f in "$ACTAPPS" "$ACTAPPSBCK" "$MAGMOD/first_detach_result.txt"; do rm -f "$f"; done
fi
