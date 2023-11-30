wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz 
zcat < install-tl-unx.tar.gz | tar xf -

# Get the list of directories matching the pattern "install-tl-*"
# and store the first one in a variable
folder=$(ls -d install-tl-*/ 2>/dev/null | head -n 1)

# Check if the folder variable is empty
if [ -z "$folder" ]; then
    echo "Error: No folder found matching the pattern 'install-tl-*'"
    exit 1
fi

# Change directory into the first folder
cd "$folder" && echo "Changed directory to $folder"
# Perform the install
perl ./install-tl --no-interaction 