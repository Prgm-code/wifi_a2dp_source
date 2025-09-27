# Install script for directory: /home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/usr/local")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/home/prgm/.espressif/tools/xtensa-esp-elf/esp-15.2.0_20250920/xtensa-esp-elf/bin/xtensa-esp32-elf-objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/mbedtls" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/aes.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/aria.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/asn1.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/asn1write.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/base64.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/bignum.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/block_cipher.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/build_info.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/camellia.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ccm.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/chacha20.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/chachapoly.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/check_config.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/cipher.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/cmac.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/compat-2.x.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/config_adjust_legacy_crypto.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/config_adjust_legacy_from_psa.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/config_adjust_psa_from_legacy.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/config_adjust_psa_superset_legacy.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/config_adjust_ssl.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/config_adjust_x509.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/config_psa.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/constant_time.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ctr_drbg.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/debug.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/des.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/dhm.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ecdh.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ecdsa.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ecjpake.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ecp.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/entropy.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/error.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/gcm.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/hkdf.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/hmac_drbg.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/lms.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/mbedtls_config.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/md.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/md5.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/memory_buffer_alloc.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/net_sockets.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/nist_kw.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/oid.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pem.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pk.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pkcs12.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pkcs5.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/pkcs7.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/platform.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/platform_time.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/platform_util.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/poly1305.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/private_access.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/psa_util.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ripemd160.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/rsa.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/sha1.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/sha256.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/sha3.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/sha512.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl_cache.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl_ciphersuites.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl_cookie.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/ssl_ticket.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/threading.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/timing.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/version.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/x509.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/x509_crl.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/x509_crt.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/mbedtls/x509_csr.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include/psa" TYPE FILE PERMISSIONS OWNER_READ OWNER_WRITE GROUP_READ WORLD_READ FILES
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/build_info.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_adjust_auto_enabled.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_adjust_config_dependencies.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_adjust_config_key_pair_types.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_adjust_config_synonyms.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_builtin_composites.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_builtin_key_derivation.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_builtin_primitives.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_compat.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_config.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_driver_common.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_driver_contexts_composites.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_driver_contexts_key_derivation.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_driver_contexts_primitives.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_extra.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_legacy.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_platform.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_se_driver.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_sizes.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_struct.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_types.h"
    "/home/prgm/esp/esp-idf/components/mbedtls/mbedtls/include/psa/crypto_values.h"
    )
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/prgm/code/Esp32/wifi_a2dp_source/build/esp-idf/mbedtls/mbedtls/include/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
