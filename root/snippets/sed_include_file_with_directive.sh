sed -i '/##INSERT HERE/r file_to_insert.txt' file_inserted_to.txt
# now remove directive
sed -i 's/##INSERT HERE//g' file_inserted_to.txt