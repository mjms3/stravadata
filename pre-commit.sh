#!/bin/bash

#Dump the environment to a file
echo "Dumping list of packages in the environment to environment.yml..."
ENV_FILE="environment.yml"
git rm -fq "${ENV_FILE}"
conda env export > "${ENV_FILE}" 2>&1
if grep -q Error environment.yml; then
echo "An Error was found when dumping the environment. Possibly you aren't in a conda environment. See environment.yml for more details"
exit 1
fi

#Slightly convoluted approach of creating then deleting a backup file
#is to ensure compatibility with both os x and linux
sed -i.bak -n '/prefix/!p' "${ENV_FILE}"
rm "${ENV_FILE}.bak"
git add "${ENV_FILE}"

#Run tests, ensuring we only test the stuff we're committing
#Note that, in general, we probably don't want to do this as that's
#What CI's for, but it's a good initial default
./run_tests.sh

exit 0

