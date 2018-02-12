#!/bin/sh

# Check if the user has overriden their note directory
if [ -z "$NOTE_DIR" ]; then
  note_dir="$HOME/.notes"
else
  note_dir="$NOTE_DIR"
fi

# Display help
if [ -z "$1" ] || [ "$1" == '--help' ]; then
  echo 'notes.sh filter CATEGORY'
  echo 'Display any files matching the given category.'
  echo

  echo 'note.sh search GREPSTRING'
  echo 'Display any files matching the given grepstring, based on their content.'
  echo

  echo 'note.sh :CATEGORY CONTENT'
  echo 'Create a new note in a category, with a given content.'
  echo

  echo 'note.sh CONTENT'
  echo 'Create a new note in the General category, with the given content.'
  echo

  echo 'note.sh :CATEGORY'
  echo 'Using $EDITOR or vi, create a new note in a given category.'
  echo

  echo 'note.sh --help'
  echo 'Display this message.'
  echo

  echo 'note.sh'
  echo 'Display this message.'
  echo

  echo 'You can change your notes directory by setting $NOTE_DIR, otherwise it will be ~/.notes'
  echo 'This directory will be checked for existence and created with any other command.'

  exit 0
fi

# Check our folder structures exist
if [ ! -d "$note_dir" ]; then
  $(mkdir "$note_dir")
fi

# Check if we're filtering by category
if [ "filter" == "$1" ]; then
  if [ -z "$2" ]; then
    cat="General"
  else
    cat="$2"
  fi
  ls "$note_dir" | grep "$cat" | while read -r line; do
  	echo "$line"
  	echo '\t'$(cat "$note_dir/$line")
  	echo
  	echo
  done
  exit 0
fi

# Check if we're searching content (grepping)
if [ "search" == "$1" ]; then
  if [ -z "$2" ]; then
    echo "No search parameter given."
    exit -1
  fi

  for f in "$note_dir/"*
  do
    if [ -f "$f" ]; then
      grep -q "$2" "$f"
      if [ $? -eq 0 ]; then
        echo $(basename "$f")
        echo "\t"$(cat "$f")
        echo
        echo
      fi
    fi
  done

  exit 0
fi

# Check if we have a given category
if [ ":" == $(printf %.1s "$1") ]; then
  cat=$(echo "$1" | cut -c 2-)': '
  data="$2"
else
  cat='General: '
  data="$1"
fi

# Make our note file
file_name=$cat$(date '+%Y %B %d, %A, %H:%M:%S')
if [ -z "$data" ]; then
  if [ -z "$EDITOR" ]; then
    EDITOR="vi"
  fi
  "$EDITOR" "$note_dir/.tmp"
  if [ -f "$note_dir/.tmp" ]; then
    mv "$note_dir/.tmp" "$note_dir/$file_name"
  fi
else
  echo "$data" > "$note_dir/$file_name"
fi
exit 0
