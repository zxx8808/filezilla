; Listing generated by Microsoft (R) Optimizing Compiler Version 18.00.21005.1 

	TITLE	F:\mycode\Hack12306\zlib-1.2.10\compress.c
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB MSVCRTD
INCLUDELIB OLDNAMES

_DATA	SEGMENT
$SG85421 DB	'1.2.10', 00H
_DATA	ENDS
PUBLIC	_compress@16
PUBLIC	_compress2@20
PUBLIC	_compressBound@4
EXTRN	_deflate@8:PROC
EXTRN	_deflateEnd@4:PROC
EXTRN	_deflateInit_@16:PROC
; Function compile flags: /Odtp
; File f:\mycode\hack12306\zlib-1.2.10\compress.c
_TEXT	SEGMENT
_sourceLen$ = 8						; size = 4
_compressBound@4 PROC

; 83   : {

	push	ebp
	mov	ebp, esp

; 84   :     return sourceLen + (sourceLen >> 12) + (sourceLen >> 14) +
; 85   :            (sourceLen >> 25) + 13;

	mov	eax, DWORD PTR _sourceLen$[ebp]
	shr	eax, 12					; 0000000cH
	add	eax, DWORD PTR _sourceLen$[ebp]
	mov	ecx, DWORD PTR _sourceLen$[ebp]
	shr	ecx, 14					; 0000000eH
	add	eax, ecx
	mov	edx, DWORD PTR _sourceLen$[ebp]
	shr	edx, 25					; 00000019H
	lea	eax, DWORD PTR [eax+edx+13]

; 86   : }

	pop	ebp
	ret	4
_compressBound@4 ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
; File f:\mycode\hack12306\zlib-1.2.10\compress.c
_TEXT	SEGMENT
_stream$ = -84						; size = 56
tv86 = -28						; size = 4
tv80 = -24						; size = 4
tv76 = -20						; size = 4
tv72 = -16						; size = 4
_max$ = -12						; size = 4
_left$ = -8						; size = 4
_err$ = -4						; size = 4
_dest$ = 8						; size = 4
_destLen$ = 12						; size = 4
_source$ = 16						; size = 4
_sourceLen$ = 20					; size = 4
_level$ = 24						; size = 4
_compress2@20 PROC

; 28   : {

	push	ebp
	mov	ebp, esp
	sub	esp, 84					; 00000054H

; 29   :     z_stream stream;
; 30   :     int err;
; 31   :     const uInt max = (uInt)-1;

	mov	DWORD PTR _max$[ebp], -1

; 32   :     uLong left;
; 33   : 
; 34   :     left = *destLen;

	mov	eax, DWORD PTR _destLen$[ebp]
	mov	ecx, DWORD PTR [eax]
	mov	DWORD PTR _left$[ebp], ecx

; 35   :     *destLen = 0;

	mov	edx, DWORD PTR _destLen$[ebp]
	mov	DWORD PTR [edx], 0

; 36   : 
; 37   :     stream.zalloc = (alloc_func)0;

	mov	DWORD PTR _stream$[ebp+32], 0

; 38   :     stream.zfree = (free_func)0;

	mov	DWORD PTR _stream$[ebp+36], 0

; 39   :     stream.opaque = (voidpf)0;

	mov	DWORD PTR _stream$[ebp+40], 0

; 40   : 
; 41   :     err = deflateInit(&stream, level);

	push	56					; 00000038H
	push	OFFSET $SG85421
	mov	eax, DWORD PTR _level$[ebp]
	push	eax
	lea	ecx, DWORD PTR _stream$[ebp]
	push	ecx
	call	_deflateInit_@16
	mov	DWORD PTR _err$[ebp], eax

; 42   :     if (err != Z_OK) return err;

	cmp	DWORD PTR _err$[ebp], 0
	je	SHORT $LN6@compress2
	mov	eax, DWORD PTR _err$[ebp]
	jmp	$LN7@compress2
$LN6@compress2:

; 43   : 
; 44   :     stream.next_out = dest;

	mov	edx, DWORD PTR _dest$[ebp]
	mov	DWORD PTR _stream$[ebp+12], edx

; 45   :     stream.avail_out = 0;

	mov	DWORD PTR _stream$[ebp+16], 0

; 46   :     stream.next_in = (z_const Bytef *)source;

	mov	eax, DWORD PTR _source$[ebp]
	mov	DWORD PTR _stream$[ebp], eax

; 47   :     stream.avail_in = 0;

	mov	DWORD PTR _stream$[ebp+4], 0
$LN5@compress2:

; 48   : 
; 49   :     do {
; 50   :         if (stream.avail_out == 0) {

	cmp	DWORD PTR _stream$[ebp+16], 0
	jne	SHORT $LN2@compress2

; 51   :             stream.avail_out = left > (uLong)max ? max : (uInt)left;

	mov	ecx, DWORD PTR _left$[ebp]
	cmp	ecx, DWORD PTR _max$[ebp]
	jbe	SHORT $LN9@compress2
	mov	edx, DWORD PTR _max$[ebp]
	mov	DWORD PTR tv72[ebp], edx
	jmp	SHORT $LN10@compress2
$LN9@compress2:
	mov	eax, DWORD PTR _left$[ebp]
	mov	DWORD PTR tv72[ebp], eax
$LN10@compress2:
	mov	ecx, DWORD PTR tv72[ebp]
	mov	DWORD PTR _stream$[ebp+16], ecx

; 52   :             left -= stream.avail_out;

	mov	edx, DWORD PTR _left$[ebp]
	sub	edx, DWORD PTR _stream$[ebp+16]
	mov	DWORD PTR _left$[ebp], edx
$LN2@compress2:

; 53   :         }
; 54   :         if (stream.avail_in == 0) {

	cmp	DWORD PTR _stream$[ebp+4], 0
	jne	SHORT $LN1@compress2

; 55   :             stream.avail_in = sourceLen > (uLong)max ? max : (uInt)sourceLen;

	mov	eax, DWORD PTR _sourceLen$[ebp]
	cmp	eax, DWORD PTR _max$[ebp]
	jbe	SHORT $LN11@compress2
	mov	ecx, DWORD PTR _max$[ebp]
	mov	DWORD PTR tv76[ebp], ecx
	jmp	SHORT $LN12@compress2
$LN11@compress2:
	mov	edx, DWORD PTR _sourceLen$[ebp]
	mov	DWORD PTR tv76[ebp], edx
$LN12@compress2:
	mov	eax, DWORD PTR tv76[ebp]
	mov	DWORD PTR _stream$[ebp+4], eax

; 56   :             sourceLen -= stream.avail_in;

	mov	ecx, DWORD PTR _sourceLen$[ebp]
	sub	ecx, DWORD PTR _stream$[ebp+4]
	mov	DWORD PTR _sourceLen$[ebp], ecx
$LN1@compress2:

; 57   :         }
; 58   :         err = deflate(&stream, sourceLen ? Z_NO_FLUSH : Z_FINISH);

	cmp	DWORD PTR _sourceLen$[ebp], 0
	je	SHORT $LN13@compress2
	mov	DWORD PTR tv80[ebp], 0
	jmp	SHORT $LN14@compress2
$LN13@compress2:
	mov	DWORD PTR tv80[ebp], 4
$LN14@compress2:
	mov	edx, DWORD PTR tv80[ebp]
	push	edx
	lea	eax, DWORD PTR _stream$[ebp]
	push	eax
	call	_deflate@8
	mov	DWORD PTR _err$[ebp], eax

; 59   :     } while (err == Z_OK);

	cmp	DWORD PTR _err$[ebp], 0
	je	$LN5@compress2

; 60   : 
; 61   :     *destLen = stream.total_out;

	mov	ecx, DWORD PTR _destLen$[ebp]
	mov	edx, DWORD PTR _stream$[ebp+20]
	mov	DWORD PTR [ecx], edx

; 62   :     deflateEnd(&stream);

	lea	eax, DWORD PTR _stream$[ebp]
	push	eax
	call	_deflateEnd@4

; 63   :     return err == Z_STREAM_END ? Z_OK : err;

	cmp	DWORD PTR _err$[ebp], 1
	jne	SHORT $LN15@compress2
	mov	DWORD PTR tv86[ebp], 0
	jmp	SHORT $LN16@compress2
$LN15@compress2:
	mov	ecx, DWORD PTR _err$[ebp]
	mov	DWORD PTR tv86[ebp], ecx
$LN16@compress2:
	mov	eax, DWORD PTR tv86[ebp]
$LN7@compress2:

; 64   : }

	mov	esp, ebp
	pop	ebp
	ret	20					; 00000014H
_compress2@20 ENDP
_TEXT	ENDS
; Function compile flags: /Odtp
; File f:\mycode\hack12306\zlib-1.2.10\compress.c
_TEXT	SEGMENT
_dest$ = 8						; size = 4
_destLen$ = 12						; size = 4
_source$ = 16						; size = 4
_sourceLen$ = 20					; size = 4
_compress@16 PROC

; 73   : {

	push	ebp
	mov	ebp, esp

; 74   :     return compress2(dest, destLen, source, sourceLen, Z_DEFAULT_COMPRESSION);

	push	-1
	mov	eax, DWORD PTR _sourceLen$[ebp]
	push	eax
	mov	ecx, DWORD PTR _source$[ebp]
	push	ecx
	mov	edx, DWORD PTR _destLen$[ebp]
	push	edx
	mov	eax, DWORD PTR _dest$[ebp]
	push	eax
	call	_compress2@20

; 75   : }

	pop	ebp
	ret	16					; 00000010H
_compress@16 ENDP
_TEXT	ENDS
END
