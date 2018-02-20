# This is very bad AWK, forgive me.

function generate_string(header_level) {
    # String without the hashes
    base = substr($0, header_level + 2);

    # Trailing whitespace
    gsub(/^[ \t]+/, "", base);
    gsub(/[ \t]+$/, "", base);

    # An id is the header title with punctuation removed, lowercased, and
    # all spaces are "-"
    id = base;
    gsub(/[^a-zA-Z0-9 \t]+/, "", id);
    gsub(/[^a-zA-Z0-9]+/, "-", id);
    id = tolower(id);

    return "<h" header_level " id=\"" id "\">" base "</h" header_level ">"
}

$1 == "#" { print generate_string(1); }
$1 == "##" { print generate_string(2); }
$1 == "###" { print generate_string(3); }
$1 == "####" { print generate_string(4); }
$1 == "#####" { print generate_string(5); }
$1 == "######" { print generate_string(6); }
!/^[#]+/ { print; }
