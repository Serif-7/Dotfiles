#!/run/current-system/sw/bin/fish

set DEBUG true
# builtin -q age == 1
# if $status == 1
#   echo "age not installed! Exiting."
#   exit
# end

set DATE (date '+%A %b %d %H:%M')
set ENTRY (mktemp)
set CIPHERED_JOURNAL $HOME/Notes/remote-default/journal/jrnl.encrypted
set JOURNAL $HOME/Notes/remote-default/journal/test_journal.md
# decrypt jrnl with passphrase
age --decrypt --output $JOURNAL $CIPHERED_JOURNAL
echo -e "\n$DATE\n" >> $ENTRY
echo -e "\n" >> $JOURNAL
alacritty --command $EDITOR $ENTRY
cat $ENTRY >> $JOURNAL
shred $ENTRY
rm $ENTRY
age --passphrase --output $CIPHERED_JOURNAL $JOURNAL
shred $JOURNAL
rm $JOURNAL
