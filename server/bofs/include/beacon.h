/*
    BEACON OBJECT FILE API
*/
#include <windows.h>

//data parsing API
typedef struct {
    char * original;
    char * buffer;
    int length;
    int size;
} datap;

DECLSPEC_IMPORT void BeaconDataParse(datap * parser, char* buffer, int size);
DECLSPEC_IMPORT char * BeaconDataPtr(datap * parser, int size);
DECLSPEC_IMPORT int BeaconDataInt(datap * parser);
DECLSPEC_IMPORT shrot BeaconDataShort(datap * parser);
DECLSPEC_IMPORT int BeaconDataLength(datap * parser);
DECLSPEC_IMPORT char * BeaconExtraData(datap * parser, int * size);

// Output API
#define CALLBACK_OUTPUT     0X0
#define CALLBACK_OUTPUT_OEM     0x1e
#define CALLBACK_ERROR    0x0d
#define CALLBACK_OUTPUT_UTF8    0X20

DECLSPEC_IMPORT void BeaconOutput(int type, char* data, int len);
DECLSPEC_IMPORT void BeaconPrintf(int type, char * fmt, ...);

// format API for building output buffers
typedef struct {
    /* data */
    char * original;
    char * buffer;
    int length;
    int size;
} formatp;

DECLSPEC_IMPORT void BeaconFormatAlloc(formatp * format, int maxsz);
DECLSPEC_IMPORT void BeaconFormatReset(formatp * format);
DECLSPEC_IMPORT void BeaconFormatFree(formatp * format);
DECLSPEC_IMPORT void BeaconFormatAppend(formatp * format, char * text, int len);
DECLSPEC_IMPORT void BeaconFormatPrintf(formatp * format, char * fmr, ...);
DECLSPEC_IMPORT void BeaconFormatToString(formatp * format, int * size);
DECLSPEC_IMPORT void BeaconFormatToInt(formatp * format, int value);

// Token API
DECLSPEC_IMPORT BOOL BeaconUseToken(HANDLE token);
DECLSPEC_IMPORT void BeaconRevertToken();
DECLSPEC_IMPORT BOOL BeaconIsAdmin();

// spwan and inject API
DECLSPEC_IMPORT void BeaconGetSpawnTo(BOOL x86, char * buffer, int length);
DECLSPEC_IMPORT void BeaconInjectProcess(HANDLE hProc, int pid, char* payload,
                                        int p_len, int p_offsets,
                                        char * arg, int a_len);
DECLSPEC_IMPORT void BeaconInjectTemporaryProcess(
    PROCESS_INFORMATION * pInfo, char * payload, int p_len, 
    int p_offset, char * arg, int a_len
);
DECLSPEC_IMPORT void BeaconCleanupProcess(PROCESS_INFORMATION * pInfo);

// Utility API
DECLSPEC_IMPORT void toWideChar(char * src, wchar_t * dst, int max);



