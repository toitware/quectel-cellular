# Quectel cellular
Drivers for quectel modems.

## Using the driver as a service
The easiest way to use the module is to install it in a separate container 
and let it provide its network implementation as a service.

You can install the service through Jaguar:

``` sh
jag container install cellular-bg96 src/bg96.toit
```

and then run the [example](examples/bg96.toit):

``` sh
jag run examples/bg96.toit
```

Remember to install the package dependencies through `jag pkg install` in the 
root and `examples/` directories.
