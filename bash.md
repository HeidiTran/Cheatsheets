## **I. Server**
- Ping a server
```bash
ping <server name>
ping <IP address>

# eg: ping abc.us.com
# eg: (Prefer) ping -c3 <server name> -> only ping 3 time
```

- Test if a server is reachable
```bash
ping -c3 $server > /dev/null 2>&1
if [ $? -ne 0]
then
    echo "Server: $server was unreachable"
    exit 1;
fi
```

## **II. Curl**
```bash
curl -k
# -k, --insecure -> Allow connections to SSL sites without certs
```

## **III. Miscellaneous**
- Show help/usage text
```bash
HELPTEXT="
#########################
#
# <Description here>
#
# Usage
#   $0 [<option_1>|<option_2>]
# ex.
#   $0              <Description here>
#   $0 option_1     <Description here>
#   $0 option_2     <Description here>
#
#########################
"

if [ $# -eq 1 -a "$1" == "help" ]
then
    echo "$HELPTEXT"
    exit 0;
fi
```
