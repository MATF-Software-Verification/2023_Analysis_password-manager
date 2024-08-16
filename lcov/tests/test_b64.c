#include "../../password-manager-master/include/console/b64.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main()
{
    const char *text = "Hello, World!";
    size_t encoded_len, decoded_len;

    char *encoded = b64_encode((const uint8_t *)text, strlen(text), &encoded_len);
    printf("Encoded: %s\n", encoded);

    uint8_t *decoded = b64_decode((const uint8_t *)encoded, encoded_len, &decoded_len);
    printf("Decoded: %s\n", decoded);

    free(encoded);
    free(decoded);

    return 0;
}
