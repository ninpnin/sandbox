# Go to sandbox-folder and empty it
function sandbox
  # Helper function for confirmations
  function read_confirm
    while true
      read -l -P 'Do you want to continue? [y/N] ' confirm

      switch $confirm
        case Y y
          return 0
        case '' N n
          return 1
      end
    end
  end

  if ! test -d "$HOME/.sandbox"
    mkdir "$HOME/.sandbox"
  end
  cd "$HOME/.sandbox"
  if test (count "$HOME/.sandbox/"*) -gt 0
    echo "The sandbox is not empty."
    echo "Its contents will be deleted."
    if read_confirm
      for file in "$HOME/.sandbox/"*;
        echo "Removing... $file";
        rm -r $file;
      end
    end
  end
  open .
end
