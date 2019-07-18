#!/usr/bin/env python

if __name__ == '__main__':
    import sys
    import os
    import shutil
    target = sys.argv[1]
    for num, source in enumerate(sys.argv[2:]):
        shutil.copy(source, os.path.join(target, "{}{}{}".format(
            os.path.splitext(os.path.basename(source))[0],
            num,
            os.path.splitext(source)[1])))
