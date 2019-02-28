(******************************************************************************
*
* Sentinel HASP API for Borland Delphi
*
* Copyright (C) 2010, SafeNet, Inc. All rights reserved.
*
*******************************************************************************)

{$A8,B-,C-,D-,E-,F-,G+,H+,I-,J-,K-,L-,M-,N+,O+,P+,Q-,R-,S-,T-,U-,V+,W-,X+,Y-,Z1}

unit hasp_unit;

interface

uses
  Windows;

{------------------------------------------------------------------------------
  basic types (for platform compatibility)
 ------------------------------------------------------------------------------}

type
  hasp_u64_t = int64;
  hasp_s64_t = int64;
  hasp_u32_t = longword;
  hasp_s32_t = longint;
  hasp_u16_t = word;
  hasp_s16_t = smallint;
  hasp_u8_t  = byte;
  hasp_s8_t  = shortint;

{-----------------------------------------------------------------------------
  hasp_general General declarations
 -----------------------------------------------------------------------------}

type
  hasp_status_t       = hasp_u32_t;  // raw error code
  hasp_size_t         = hasp_u32_t;  // length
  hasp_handle_t       = hasp_u32_t;  // connection handle
  hasp_feature_t      = hasp_u32_t;  // feature id
  hasp_fileid_t       = hasp_u32_t;  // memory file id
  hasp_time_t         = hasp_u64_t;  // time, seconds since Jan-01-1970 0:00 GMT
  hasp_vendor_code_t  = pointer;     // contains the vendor code

{-----------------------------------------------------------------------------}

const
  { hasp_get_info() / hasp_get_sessioninfo() format to get update info (CTV) }
  HASP_UPDATEINFO = '<haspformat format="updateinfo"/>';

  { format to retrieve a small update info (C2V) }
  HASP_FASTUPDATEINFO = '<haspformat format="fastupdateinfo"/>';

  { hasp_get_info() / hasp_get_sessioninfo() format to get session info }
  HASP_SESSIONINFO = '<haspformat format="sessioninfo"/>';

  { hasp_get_info() / hasp_get_sessioninfo() format to get key/hardware info }
  HASP_KEYINFO = '<haspformat format="keyinfo"/>';

  HASP_RECIPIENT = '<haspformat root="location">'#13#10 +
                   '  <license_manager>'#13#10 +
                   '    <attribute name="id" />'#13#10 +
                   '    <attribute name="time" />'#13#10 +
                   '    <element name="hostname" />'#13#10 +
                   '    <element name="version" />'#13#10 +
                   '    <element name="host_fingerprint" />'#13#10 +
                   '  </license_manager>'#13#10 + 
                   '</haspformat>'#13#10;

{------------------------------------------------------------------------------
  Feature ID defines
 ------------------------------------------------------------------------------}

  // AND-mask used to identify feature type
  HASP_FEATURETYPE_MASK = $ffff0000;

  // After AND-ing with HASP_FEATURETYPE_MASK feature type contain this value.
  HASP_PROGNUM_FEATURETYPE = $ffff0000;

  // AND-mask used to extract program number from feature id if
  // program number feature.
  HASP_PROGNUM_MASK = $000000ff;

{------------------------------------------------------------------------------
  prognum options mask

  AND-mask used to identify prognum options:
      - HASP_PROGNUM_OPT_NO_LOCAL
      - HASP_PROGNUM_OPT_NO_REMOTE
      - HASP_PROGNUM_OPT_PROCESS
      - HASP_PROGNUM_OPT_CLASSIC
      - HASP_PROGNUM_OPT_TS

   3 bits of the mask are reserved for future extensions and currently unused.
   Initialize them to zero.
}

const
  { Invalid handle value for hasp_login() and hasp_login_scope() functions }
  HASP_INVALID_HANDLE_VALUE = 0;

  { Minimum block size for hasp_encrypt() and hasp_decrypt() functions. }
  HASP_MIN_BLOCK_SIZE = 16;

  { Minimum block size for hasp_legacy_encrypt() and hasp_legacy_decrypt() legacy functions. }
  HASP_MIN_BLOCK_SIZE_LEGACY = 8;




  HASP_PROGNUM_OPT_MASK = $0000ff00;

  { Disable local license search }
  HASP_PROGNUM_OPT_NO_LOCAL = $00008000;

  { Disable network license search }
  HASP_PROGNUM_OPT_NO_REMOTE = $00004000;

  { Sets session count of network licenses to per-process }
  HASP_PROGNUM_OPT_PROCESS = $00002000;

  { Enables the API to access "classic" (HASP4 or earlier) keys }
  HASP_PROGNUM_OPT_CLASSIC = $00001000;

  { Presence of Terminal Services gets ignored }
  HASP_PROGNUM_OPT_TS = $00000800;

  { Present in every hardware key. }
  HASP_DEFAULT_FID = 0;

  { Present in every hardware HASP key. }
  HASP_PROGNUM_DEFAULT_FID = (HASP_DEFAULT_FID or HASP_PROGNUM_FEATURETYPE);

{------------------------------------------------------------------------------
  hasp_file_ids Memory file id defines
 ------------------------------------------------------------------------------}

  { File id for HASP4 compatible memory contents w/o license data area }
  HASP_FILEID_MAIN = $fff0;

  {(Dummy) file id for HASP4 RTC chip memory contents }
  HASP_FILEID_TIME = $fff1;

  { (Dummy) file id for license data area of memory contents }
  HASP_FILEID_LICENSE = $0000fff2;

  // File ID for Sentinel HASP secure writable memory.
  HASP_FILEID_RW = $0000fff4;

  { File ID for Sentinel HASP secure read only memory }
  HASP_FILEID_RO = $0000fff5;


{------------------------------------------------------------------------------
  hasp_error_codes Error code defines
 ------------------------------------------------------------------------------}

const
    HASP_STATUS_OK = 0;               { Request successfully completed }
    HASP_MEM_RANGE = 1;               { Request exceeds memory range of a HASP file }
    HASP_INV_PROGNUM_OPT = 2;         { Legacy HASP HL Run-time API: Unknown/Invalid Feature ID option }
    HASP_INSUF_MEM = 3;               { System is out of memory }
    HASP_TMOF = 4;                    { Too many open Features/login sessions }
    HASP_ACCESS_DENIED = 5;           { Access to Feature, HASP protection key or functionality denied }
    HASP_INCOMPAT_FEATURE = 6;        { Legacy decryption function cannot work on Feature }
    HASP_CONTAINER_NOT_FOUND = 7;     { DEPRECATED }
    HASP_HASP_NOT_FOUND = 7;          { Sentinel HASP protection key not available }
    HASP_TOO_SHORT = 8;               { Encrypted/decrypted data length too short to execute function call }
    HASP_INV_HND = 9;                 { Invalid login handle passed to function }
    HASP_INV_FILEID = 10;             { Specified File ID not recognized by API }
    HASP_OLD_DRIVER = 11;             { Installed driver or daemon too old to execute function }
    HASP_NO_TIME = 12;                { Real-time clock (rtc) not available }
    HASP_SYS_ERR = 13;                { Generic error from host system call }
    HASP_NO_DRIVER = 14;              { Required driver not installed }
    HASP_INV_FORMAT = 15;             { Unrecognized file format for update }
    HASP_REQ_NOT_SUPP = 16;           { Unable to execute function in this context }
    HASP_INV_UPDATE_OBJ = 17;         { Binary data passed to function does not contain valid update }
    HASP_KEYID_NOT_FOUND = 18;        { HASP protection key not found }
    HASP_INV_UPDATE_DATA = 19;        { Required XML tags not found; Contents in binary data are missing }
    HASP_INV_UPDATE_NOTSUPP = 20;     { Update request not supported by Sentinel HASP protection key }
    HASP_INV_UPDATE_CNTR = 21;        { Update counter set incorrectly }
    HASP_INV_VCODE = 22;              { Invalid Vendor Code passed }
    HASP_ENC_NOT_SUPP = 23;           { Sentinel HASP protection key does not support encryption type }
    HASP_INV_TIME = 24;               { Passed time value outside supported value range }
    HASP_NO_BATTERY_POWER = 25;       { Real-time clock battery out of power }
    HASP_NO_ACK_SPACE = 26;           { Acknowledge data requested by update, but ack_data parameter is null }
    HASP_TS_DETECTED = 27;            { Program running on a terminal server }
    HASP_FEATURE_TYPE_NOT_IMPL = 28;  { Requested Feature type not implemented }
    HASP_UNKNOWN_ALG = 29;            { Unknown algorithm used in H2R/V2C file }
    HASP_INV_SIG = 30;                { Signature verification operation failed }
    HASP_FEATURE_NOT_FOUND = 31;      { Requested Feature not available }
    HASP_NO_LOG = 32;                 { Access log not enabled }
    HASP_LOCAL_COMM_ERR = 33;         { Communication error between API and local HASP License Manager }
    HASP_UNKNOWN_VCODE = 34;          { Vendor Code not recognized by API }
    HASP_INV_SPEC = 35;               { Invalid XML specification }
    HASP_INV_SCOPE = 36;              { Invalid XML scope }
    HASP_TOO_MANY_KEYS = 37;          { Too many Sentinel HASP protection keys currently connected }
    HASP_TOO_MANY_USERS = 38;         { Too many concurrent user sessions currently connected }
    HASP_BROKEN_SESSION = 39;         { Session been interrupted }     
    HASP_REMOTE_COMM_ERR = 40;        { Communication error between local and remote HASP License Managers }
    HASP_FEATURE_EXPIRED = 41;        { Feature expired }
    HASP_OLD_LM = 42;                 { HASP License Manager version too old }
    HASP_DEVICE_ERR = 43;             { Input/Output error occurred }
    HASP_UPDATE_BLOCKED = 44;         { Update installation not permitted; This update was already applied }
    HASP_TIME_ERR = 45;               { System time has been tampered with }
    HASP_SCHAN_ERR = 46;              { Communication error occurred in secure channel }
    HASP_STORAGE_CORRUPT = 47;        { Corrupt data exists in secure storage area of HASP SL protection key }
    HASP_NO_VLIB = 48;                { Unable to find Vendor library }
    HASP_INV_VLIB = 49;               { Unable to load Vendor library }
    HASP_SCOPE_RESULTS_EMPTY = 50;    { Unable to locate any Feature matching scope }
    HASP_VM_DETECTED = 51;            { Program running on a virtual machine }
    HASP_HARDWARE_MODIFIED = 52;      { HASP SL key incompatible }
    HASP_USER_DENIED = 53;            { Login denied because of user restrictions }
    HASP_UPDATE_TOO_OLD = 54;         { out of sequence }
    HASP_UPDATE_TOO_NEW = 55;         { Update to old }
    HASP_OLD_VLIB = 56;               { Old vlib }
    HASP_UPLOAD_ERROR = 57;           { Upload via ACC failed, e.g. because of illegal format }
    HASP_INV_RECIPIENT = 58;          { Invalid XML "recipient" parameter }
    HASP_INV_DETACH_ACTION = 59;      { Invalid XML "action" parameter }
    HASP_TOO_MANY_PRODUCTS = 60;      { scope does not specify a unique Product }
    HASP_INV_PRODUCT = 61;            { Invalid Product information }
    HASP_UNKNOWN_RECIPIENT = 62;      { Unknown Recipient }
    HASP_INV_DURATION = 63;           { Invalid Duration }
    HASP_CLONE_DETECTED = 64;         { Cloned HASP SL secure storage detected }    
    HASP_NO_API_DYLIB = 400;          { API dispatcher: API for this Vendor Code was not found }
    HASP_INV_API_DYLIB = 401;         { API dispatcher: Unable to load API; DLL possibly corrupt? }
    HASP_INVALID_OBJECT = 500;        { C++ API: Object incorrectly initialized }
    HASP_INVALID_PARAMETER = 501;     { C++ API: Invalid function parameter }
    HASP_ALREADY_LOGGED_IN = 502;     { C++ API: Logging in twice to the same object }
    HASP_ALREADY_LOGGED_OUT = 503;    { C++ API: Logging out twice of the same object }
    HASP_OPERATION_FAILED = 525;      { .NET API: Incorrect use of system or platform }
    HASP_NO_EXTBLOCK = 600;           { Internal use: no classic memory extension block available }
    HASP_INV_PORT_TYPE = 650;         { Internal use: invalid port type }
    HASP_INV_PORT = 651;              { Internal use: invalid port value }
    HASP_NOT_IMPL = 698;              { Requested function not implemented }
    HASP_INT_ERR = 699;               { Internal error occurred in API }
    HASP_FIRST_HELPER = 2001;         { Reserved for HASP helper libraries }
    HASP_FIRST_HASP_ACT = 3001;       { Reserved for HASP Activation API }
    HASP_NEXT_FREE_VALUES = 5001;     {  }
{------------------------------------------------------------------------------
  The Basic API
 ------------------------------------------------------------------------------}

{-----------------------------------------------------------------------------
  Login into a feature.

  This function establishes a context (logs into a feature).
  hasp_login() also does the connection handling. There is one connection
  (secure channel) per API object. The last logout closes the channel.
  (see hasp_logout())
  When logging into a "classic" feature, the secure channel is not used.

  feature_id       - unique identifier of the feature,
                     With "classic" features (see \ref HASP_FEATURETYPE_MASK),
                     8 bits are reserved for legacy options (see \ref HASP_PROGNUM_OPT_MASK,
                     currently 5 bits are used):
                      - only local
                      - only remote
                      - login is counted per process ID
                      - disable terminal server check
                      - enable access to old (HASP3/HASP4) keys
  vendor_code      - pointer to the vendor blob
  handle           - pointer to the resulting session handle

  return           status code
                   - HASP_STATUS_OK         - the request completed successfully
                   - HASP_FEATURE_NOT_FOUND - the requested feature isn't available
                   - HASP_NOT_IMPL          - the type of feature isn't implemented
                   - HASP_INV_CLASSIC_OPT   - unknown classic option requested (HASP_PROGNUM_OPT_MASK)
                   - HASP_TMOF              - too many open handles
                   - HASP_INSUF_MEM         - out of memory

  For local prognum features, concurrency is not handled and each
  login performs a decrement if it is a counting license.

  Network prognum features just use the old HASPLM login logic with all
  drawbacks. There is only support for concurrent usage of one server
  (global server address).

}

function hasp_login( feature_id  : hasp_feature_t;
                     vendor_code : hasp_vendor_code_t;
                     var handle  : hasp_handle_t ) : hasp_status_t; stdcall;


{-----------------------------------------------------------------------------
  Logout.

  Logs out from a session and frees all allocated memory for the session. If it
  was the last session from this API, the connection to the LLM is shut down.

  handle       - session handle of session to log out from

  return     status code
               - HASP_STATUS_OK         - the request completed successfully
               - HASP_INV_HND           - invalid input handle

}

function hasp_logout(handle : hasp_handle_t) : hasp_status_t; stdcall;

{------------------------------------------------------------------------------
  Encrypt a buffer.

  This function encrypts a buffer.

  handle      - session handle
  buffer      - pointer to the buffer to be encrypted
  length      - size in bytes of the buffer to be encrypted (16 bytes minimum)

  return     status code
               - HASP_STATUS_OK         - the request completed successfully
               - HASP_INV_HND           - invalid input handle
               - HASP_NOT_IMPL          - the functionality for this feature type isn't implemented
               - HASP_TOO_SHORT         - the length of the data to be encrypted is too short
               - HASP_ENC_NOT_SUPP      - encryption type not supported by the hardware
               - HASP_FEATURE_NOT_FOUND - the requested feature isn't available anymore

  If the encryption fails (e.g. key removed in-between) the data pointed to
  by buffer is unmodified.
}

function hasp_encrypt( handle : hasp_handle_t;
                       var buffer;
                       length : hasp_size_t) : hasp_status_t; stdcall;


{------------------------------------------------------------------------------
  Decrypt a buffer.

  This function decrypts a buffer. This is the reverse operation of the
  hasp_encrypt() function. See hasp_encrypt() for more information.

  handle      - session handle
  buffer      - pointer to the buffer to be decrypted
  length      - size in bytes of the buffer to be decrypted (16 bytes minimum)

  return     status code
               - HASP_STATUS_OK         - the request completed successfully
               - HASP_INV_HND           - invalid input handle
               - HASP_NOT_IMPL          - the functionality for this feature type isn't implemented
               - HASP_TOO_SHORT         - the length of the data to be decrypted is too short
               - HASP_ENC_NOT_SUPP      - encryption type not supported by the hardware
               - HASP_FEATURE_NOT_FOUND - the requested feature isn't available anymore

 If the decryption fails (e.g. key removed in-between) the data
 pointed to by buffer is unmodified.
}

function hasp_decrypt ( handle : hasp_handle_t;
                        var buffer;
                        length : hasp_size_t)  : hasp_status_t; stdcall;


{------------------------------------------------------------------------------
  Read from key memory.

  This function is used to read from the key memory.

  handle       - session handle
  fileid       - id of the file to read (memory descriptor)
  offset       - file offset in the file
  length       - length
  buffer       - result of the read operation

  return     status code.
               - HASP_STATUS_OK         - the request completed successfully
               - HASP_INV_HND           - invalid input handle
               - HASP_NOT_IMPL          - the functionality for this feature type isn't implemented
               - HASP_INV_FILEID        - unknown fileid
               - HASP_MEM_RANGE         - attempt to read beyond eom
               - HASP_FEATURE_NOT_FOUND - the requested feature isn't available anymore

}

function hasp_read( handle : hasp_handle_t;
                    fileid : hasp_fileid_t;
                    offset : hasp_size_t;
                    length : hasp_size_t;
                    var buffer) : hasp_status_t;  stdcall;


{------------------------------------------------------------------------------
  Write to key memory.

  This function is used to write to the key memory. Depending on the provided
  session handle (either logged into the default feature or any other feature),
  write access to the license data memory (HASP_FILEID_LICENSE) is not permitted.

  handle       - session handle
  fileid       - id of the file to write
  offset       - file offset in the file
  length       - length
  buffer       - what to write

  return     status code.
               - HASP_STATUS_OK         - the request completed successfully
               - HASP_INV_HND           - invalid input handle
               - HASP_NOT_IMPL          - the functionality for this feature type isn't implemented
               - HASP_INV_FILEID        - unknown fileid
               - HASP_MEM_RANGE         - attempt to write beyond eom
               - HASP_FEATURE_NOT_FOUND - the requested feature isn't available anymore
}

function hasp_write ( handle : hasp_handle_t;
                      fileid : hasp_fileid_t;
                      offset : hasp_size_t;
                      length : hasp_size_t;
                      var buffer) : hasp_status_t;  stdcall;

{------------------------------------------------------------------------------
  Get memory size.

  This function is used to determine the memory size.

  handle       - session handle
  fileid       - id of the file to query
  size         - pointer to the resulting file size

  result     status code
               - HASP_STATUS_OK         - the request completed successfully
               - HASP_INV_HND           - invalid input handle
               - HASP_NOT_IMPL          - the functionality for this feature type isn't implemented
               - HASP_INV_FILEID        - unknown fileid
               - HASP_FEATURE_NOT_FOUND - the requested feature isn't available anymore
}

function hasp_get_size( handle : hasp_handle_t;
                        fileid : hasp_fileid_t;
                        var size : hasp_size_t) : hasp_status_t;  stdcall;

{------------------------------------------------------------------------------
  Read current time from a time key.

  This function reads the current time from a time key.
  The time will be returned in seconds since Jan-01-1970 0:00 GMT.

  remark:
    The general purpose of this function is not related to
    licensing, but to get reliable timestamps which are independent
    from the system clock.

  handle       - session handle
  time         - pointer to the actual time

  return     status code
               - HASP_STATUS_OK         - the request completed successfully
               - HASP_INV_HND           - invalid input handle
               - HASP_NOT_IMPL          - the functionality for this feature type isn't implemented
               - HASP_FEATURE_NOT_FOUND - the requested feature isn't available anymore
               - HASP_NO_TIME           - RTC not available
}

function hasp_get_rtc( handle : hasp_handle_t;
                       var time : hasp_time_t) : hasp_status_t;  stdcall;


{------------------------------------------------------------------------------
  Legacy HASP functionality for backward compatibility
 ------------------------------------------------------------------------------}

{------------------------------------------------------------------------------
  Legacy HASP4 compatible encryption function.

  handle       - session handle
  buffer       - pointer to the buffer to be encrypted
  length       - size in bytes of the buffer  (8 bytes minimum)

  return     status code
               - HASP_STATUS_OK         - the request completed successfully
               - HASP_INV_HND           - invalid input handle
               - HASP_TOO_SHORT         - the length of the data to be encrypted is too short
               - HASP_ENC_NOT_SUPP      - encryption type not supported by the hardware
               - HASP_INCOMPAT_FEATURE  - classic encryption is not available for this feature
               - HASP_FEATURE_NOT_FOUND - the requested feature isn't available anymore

  The handle must have been obtained by calling hasp_login() with
  a prognum feature id.

  If the encryption fails (e.g. key removed in-between) the data
  pointed to by buffer is undefined.
}

function hasp_legacy_encrypt(handle : hasp_handle_t;
                             var buffer;
                             length : hasp_size_t ) : hasp_status_t; stdcall;


{------------------------------------------------------------------------------
  Legacy HASP4 compatible decryption function.

  handle       - session handle
  buffer       - pointer to the buffer to be decrypted
  length       - size in bytes of the buffer (8 bytes minimum)

  return     status code
               - HASP_STATUS_OK         - the request completed successfully
               - HASP_INV_HND           - invalid input handle
               - HASP_TOO_SHORT         - the length of the data to be decrypted is too short
               - HASP_ENC_NOT_SUPP      - encryption type not supported by the hardware
               - HASP_INCOMPAT_FEATURE  - classic decryption is not available for this feature
               - HASP_FEATURE_NOT_FOUND - the requested feature isn't available anymore

  The handle must have been obtained by calling \ref hasp_login() with
  a prognum feature id.

  If the decryption fails (e.g. key removed in-between) the data
  pointed to by buffer is undefined.
}

function hasp_legacy_decrypt ( handle : hasp_handle_t;
                               var buffer;
                               length : hasp_size_t ) : hasp_status_t; stdcall;


{------------------------------------------------------------------------------
  Write to HASP4 compatible real time clock

  handle       - session handle
  new_time     - time value to be set

  return     status code
               - HASP_STATUS_OK         - the request completed successfully
               - HASP_INV_HND           - invalid input handle
               - HASP_INCOMPAT_FEATURE  - functionality is not available for this feature
               - HASP_FEATURE_NOT_FOUND - the requested feature isn't available anymore
               - HASP_NO_TIME           - RTC not available

  Note: The handle must have been obtained by calling hasp_login() with
        a prognum feature id.
}

function hasp_legacy_set_rtc( handle : hasp_handle_t;
                             new_time : hasp_time_t ) : hasp_status_t; stdcall;


{------------------------------------------------------------------------------
  Set the LM idle time.

  handle       - session handle
  idle_time    - the idle time in minutes

  return      status code
               - HASP_STATUS_OK         - the request completed successfully
               - HASP_INV_HND           - invalid input handle
               - HASP_INCOMPAT_FEATURE  - changing the idletime is not available for this feature
               - HASP_FEATURE_NOT_FOUND - the requested feature isn't available anymore
               - HASP_REQ_NOT_SUPP      - attempt to set the idle time for a local license

  Note: The handle must have been obtained by calling hasp_login() with
        a prognum feature id.
}

function hasp_legacy_set_idletime ( handle : hasp_handle_t;
                                    idle_time : hasp_u16_t ) : hasp_status_t; stdcall;


{------------------------------------------------------------------------------
  Extended HASP HL API
 ------------------------------------------------------------------------------

  The extended API consists of functions which provide extended functionality.
  This advanced functionality is sometimes necessary, and addresses the
  "advanced" user.

 ------------------------------------------------------------------------------
  Get information in a session context.

  Memory for the information is allocated by this function and has to be
  freed by the hasp_free() function.

  handle       - session handle
  format       - XML definition of the output data structure
  info         - pointer to the returned information (XML list)

  return     status code
               - HASP_STATUS_OK  - the request completed successfully
               - HASP_INV_HND    - handle not active
               - HASP_INV_FORMAT - unrecognized format
}

function hasp_get_sessioninfo( handle : hasp_handle_t;
                               format : pchar;
                               var info : pchar) : hasp_status_t; stdcall;


{------------------------------------------------------------------------------
  Free resources allocated by hasp_get_sessioninfo

  This function must be called to free the resources
  allocated by hasp_get_sessioninfo.

  info   -  pointer to the resources to be freed
}

procedure hasp_free (info : pointer); stdcall;


{------------------------------------------------------------------------------
  Write an update.

  This function writes update information. The update blob contains all
  necessary data to perform the update: Where to write (in which "container",
  e.g. dongle), the necessary access data (passwords) and of course the
  update itself. The function returns in an acknowledge blob, which is
  signed/encrypted by the updated instance and contains a proof that this
  update has been succeeded. Memory for the acknowledge blob is allocated by
  the API and has to be freed by the programmer (see hasp_free()).

  update_data      - pointer to the complete update data.
  ack_data         - pointer to a buffer to get the acknowledge data.

  return     status code
}

function hasp_update ( update_data  : pchar;
                       var ack_data : pchar ) : hasp_status_t; stdcall;


{------------------------------------------------------------------------------
  Utility functions
 ------------------------------------------------------------------------------}

{------------------------------------------------------------------------------
  Convert broken up time into a time type

  day          - input day
  month        - input month
  year         - input year
  hour         - input hour
  minute       - input minute
  second       - input second
  time         - pointer to put result

  return     status code
               - HASP_STATUS_OK  - the request completed successfully
               - HASP_INV_TIME   - time outside of the supported range
}

function hasp_datetime_to_hasptime ( day, month, year,
                                    hour, minute, second : cardinal;
                                    var time : hasp_time_t ) : hasp_status_t; stdcall;


{------------------------------------------------------------------------------
  Convert time type into broken up time

  time         - pointer to put result
  day          - pointer to day
  month        - pointer to month
  year         - pointer to year
  hour         - pointer to hour
  minute       - pointer to minute
  second       - pointer to second

  return     status code
               - HASP_STATUS_OK  - the request completed successfully
               - HASP_INV_TIME   - time outside of the supported range
}

function hasp_hasptime_to_datetime (
             time : hasp_time_t;
             var day, month, year,
                 hour, minute, second : cardinal) : hasp_status_t; stdcall;

{------------------------------------------------------------------------------
  Feature ID convention
 ------------------------------------------------------------------------------

  Feature ids are 32bits wide. If the upper 16 bit contain the value indicated
  by HASP_PROGNUM_FEATURETYPE, the feature defines a prognum feature.

  For prognum features there are some options encoded in the feature id.
  These include

  - HASP_PROGNUM_OPT_NO_LOCAL
    Don't search for a license locally. "Remote-only"

  - HASP_PROGNUM_OPT_NO_REMOTE
    Don't search for a license on the network. "Local-only"

  - HASP_PROGNUM_OPT_PROCESS
    In case, a license is found in the network, count license usage per
    process instead of per workstation.

  - HASP_PROGNUM_OPT_TS
    Don't detect whether the program is running on a remote screen
    on a terminal server.

  - HASP_PROGNUM_OPT_CLASSIC
    The API by default only searches for HASPHL keys. When this option
    is set, it also searches for HASP3/HASP4 keys.
}

function hasp_login_scope(feature_id : hasp_feature_t;
                          scope : pchar;
                          vendor_code : hasp_vendor_code_t;
                          var handle : hasp_handle_t) : hasp_status_t; stdcall;
                
function hasp_get_info(scope : pchar;
                       format: pchar;
                       vendor_code : hasp_vendor_code_t;
                       var info : pchar) : hasp_status_t; stdcall;

function hasp_detach(detach_action  : pchar;
                     scope          : pchar;
                     vc             : hasp_vendor_code_t;
                     recipient      : pchar;
                     var info       : pchar) : hasp_status_t; stdcall;

function hasp_get_version(var major_version : integer;
                          var minor_version : integer;
                          var build_server : integer;
                          var build_number : integer;
                          vendor_code : hasp_vendor_code_t) : hasp_status_t; stdcall;
{-----------------------------------------------------------------------------}
  implementation
{-----------------------------------------------------------------------------}

{$L hasp_windows_delphi_97898.obj  }

function hasp_login;                stdcall; external;
function hasp_logout;               stdcall; external;
function hasp_encrypt;              stdcall; external;
function hasp_decrypt;              stdcall; external;
function hasp_read;                 stdcall; external;
function hasp_write;                stdcall; external;
function hasp_get_size;             stdcall; external;
function hasp_get_rtc;              stdcall; external;
function hasp_legacy_encrypt;       stdcall; external;
function hasp_legacy_decrypt;       stdcall; external;
function hasp_legacy_set_rtc;       stdcall; external;
function hasp_legacy_set_idletime;  stdcall; external;
function hasp_get_sessioninfo;      stdcall; external;
procedure hasp_free;                stdcall; external;
function hasp_update;               stdcall; external;
function hasp_datetime_to_hasptime; stdcall; external;
function hasp_hasptime_to_datetime; stdcall; external;
function hasp_login_scope;          stdcall; external;
function hasp_get_info;             stdcall; external;
function hasp_detach;               stdcall; external;
function hasp_get_version;          stdcall; external;

{-----------------------------------------------------------------------------}

initialization

{-----------------------------------------------------------------------------}

finalization

{-----------------------------------------------------------------------------}

end.


