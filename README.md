This project export compress algorithm of infobright-4.0.7 community edition.

*Note: You should compile c++ lib on the same platform as your cluster will run.*

### Generate compress lib

Download the source and build the lib. 

```shell
$> git clone git@github.com:shunfei/indexr-compress-lib.git
$> cd indexr-compress-lib
$> ./compile.sh
$> ls lib/
```

Now the `lib` folder should contains compress lib file we need.

On mac:

```
libbhcompress.dylib
```

On linux:

```
libbhcompress.so
```