#!/run/current-system/sw/bin/fish

set debug true
builtin -q age == 1
if $status == 1
  echo "age not installed! Exiting."
  exit
end

# set date (date '+%A %b %d %H:%M')
# set entry $HOME/jrnl_entry.txt
# set journal $HOME/Notes/remote-default/journal/test_journal.md
# touch $entry
# echo -e "\n$date\n" >> $entry
# # echo -e "\n" >> $journal
# alacritty --command $EDITOR $entry
# cat $entry >> $journal
# shred $entry
# rm $entry
