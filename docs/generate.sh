#!/bin/bash

rm -rf _doxy_out
rm -rf _static
rm -rf _build

doxygen

LC_ALL=C sed -i '' -e 's/final //g' $(find ./_doxy_out -type f)
LC_ALL=C sed -i '' -e 's/@NonNull //g' $(find ./_doxy_out -type f)
LC_ALL=C sed -i '' -e 's/@Nullable //g' $(find ./_doxy_out -type f)
LC_ALL=C sed -i '' -e 's/inline="yes"/inline="no"/g' $(find ./_doxy_out -type f)
LC_ALL=C sed -i '' -e 's/\&lt;?\&gt;/\&lt;\&gt;/g' $(find ./_doxy_out -type f)
LC_ALL=C sed -i '' -e 's/com.kassowrobots.api.robot.xmlrpc.values.Value/Value/g' $(find ./_doxy_out -type f)

mkdir _static && make html
