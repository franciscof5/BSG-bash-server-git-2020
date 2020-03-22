#!/bin/bash
#DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
dirname "$0"
echo "Adding all shortcode..."
git add --all
echo "Please enter commit description:"
read DESC 
git commit -m "$DESC"
