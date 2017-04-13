
WIP

A docker image that uses dns-01 to get signed let's encrypt certificates.

# tl;dr

**NOTE**: change domains.txt to one of your domains

```
DNSIMPLE_OAUTH_TOKEN=token ./run.sh
```

# Running the Dockerfile

Use the Dockerfile to generate the certificates. 

```
DNSIMPLE_OAUTH_TOKEN=token ./run.sh
```

builds the docker image and runs a container.

The dockerfile is based on the [lexicon's Dockerfile](https://github.com/AnalogJ/lexicon/blob/master/Dockerfile).

Dockerfile delivers the following:
 - use [dehydration](https://github.com/lukas2511/dehydrated) to talk to letsencrypt
 - use [Lexicon](https://github.com/AnalogJ/lexicon) to talk to dnsimple

Changes: 
- volume mount configuration
- volume mount created certificates and accounts
- appended hook.sh with auth-token for DNSimple usage

## config directory

Config directory contains
 - dehydration config for DNSimple needs
 - domains.txt with my domains
 - dehydration hooks.sh with lexicon implementation extended with auth-token

# Handling certificates

TODO handle certificates

After the Dockerfile is run, you end up with a number of certificates.
I use Kubernetes and add these to the ConfigMap



