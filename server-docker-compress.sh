#!/bin/sh

# get absolute path of current dir
# echo $(cd `dirname $0`; pwd)

docker run -p 4000:4000 -it --rm \
-v $(cd `dirname $0`; pwd)/website/scaffolds:/website/scaffolds \
-v $(cd `dirname $0`; pwd)/website/scripts:/website/scripts \
-v $(cd `dirname $0`; pwd)/website/source:/website/source \
-v $(cd `dirname $0`; pwd)/website/themes:/website/themes \
-v $(cd `dirname $0`; pwd)/website/_config.yml:/website/_config.yml \
-v $(cd `dirname $0`; pwd)/website/gulpfile.js:/website/gulpfile.js \
cveo/cveo-website-generator:latest sh -c "hexo g && gulp && hexo s"