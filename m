Received: from smtp-8fae.mail.infomaniak.ch (smtp-8fae.mail.infomaniak.ch [83.166.143.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA277D
	for <landlock@lists.linux.dev>; Thu, 10 Feb 2022 19:56:45 +0000 (UTC)
Received: from smtp-2-0000.mail.infomaniak.ch (unknown [10.5.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4JvkPl017RzMq63L;
	Thu, 10 Feb 2022 18:34:03 +0100 (CET)
Received: from ns3096276.ip-94-23-54.eu (unknown [23.97.221.149])
	by smtp-2-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4JvkPk3wxCzlhSMM;
	Thu, 10 Feb 2022 18:34:02 +0100 (CET)
Content-Type: multipart/mixed; boundary="------------3xeiRsBn1wyxO0yrZFRp3r7V"
Message-ID: <1dd9e03e-0f04-4722-0874-fb3b1757b7bb@digikod.net>
Date: Thu, 10 Feb 2022 18:34:54 +0100
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent:
Content-Language: en-US
To: gameoftrees@openbsd.org
Cc: Omar Polo <op@openbsd.org>, Thomas Adam <thomas@xteddy.org>,
 landlock@lists.linux.dev
From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: GoT Landlock fixes

This is a multi-part message in MIME format.
--------------3xeiRsBn1wyxO0yrZFRp3r7V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I noticed Omar Polo added support for Landlock to the Linux version of 
Game Of Trees [1]. This is great! However, the handled filesystem access 
is only LANDLOCK_ACCESS_FS_READ_FILE, and it will still be allowed to do 
multiple filesystem-related actions (e.g. write to files, remove 
files…). I don't know much about Game Of Trees but, according to the 
commit message, I think you would like to revoke any (currently 
supported) filesystem access. You should then add the 12 remaining 
access rights [2]. There is also a typo in the errno check, it should be 
EOPNOTSUPP (not ENOTSUP). You'll find a small patch attached. Let me 
know if I can help.

In a nutshell, the ruleset's handled_access_fs is required for backward 
and forward compatibility (i.e. the kernel and user space may not know 
each other's supported restrictions), hence the need to be explicit 
about the denied-by-default access rights.

Regards,
  Mickaël


[1] 
https://git.gameoftrees.org/gitweb/?p=got-portable.git;a=commit;h=97799ccd4b67a81f97039305d4fdd66588da9962
[2] https://docs.kernel.org/userspace-api/landlock.html#filesystem-flags
--------------3xeiRsBn1wyxO0yrZFRp3r7V
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-portable-extend-support-for-Landlock-and-fix-error-h.patch"
Content-Disposition: attachment;
 filename*0="0001-portable-extend-support-for-Landlock-and-fix-error-h.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBmMmMxZTA2YzIxOGI5OTdmNGM2ODZhNTlkOTAxYjVlMTk0OGU4MDAxIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/TWlja2E9QzM9QUJsPTIwU2FsYT1D
Mz1CQ24/PSA8bWljQGRpZ2lrb2QubmV0PgpEYXRlOiBUaHUsIDEwIEZlYiAyMDIyIDE4OjA5
OjUyICswMTAwClN1YmplY3Q6IFtQQVRDSF0gcG9ydGFibGU6IGV4dGVuZCBzdXBwb3J0IGZv
ciBMYW5kbG9jayBhbmQgZml4IGVycm9yIGhhbmRsaW5nCk1JTUUtVmVyc2lvbjogMS4wCkNv
bnRlbnQtVHlwZTogdGV4dC9wbGFpbjsgY2hhcnNldD1VVEYtOApDb250ZW50LVRyYW5zZmVy
LUVuY29kaW5nOiA4Yml0CgpUaGlzIGFkZCBhbGwgdGhlIHJlbWFpbmluZyBjdXJyZW50bHkg
c3VwcG9ydGVkIChMaW51eCA+PSA1LjEzKQpmaWxlc3lzdGVtIHJlc3RyaWN0aW9uczogY3Jl
YXRpb24sIHJlbW92YWwsIHJlYWRpbmcsIHdyaXRpbmcgYW5kCmV4ZWN1dGluZy4KCkZpeCB0
aGUgZXJybm8gY2hlY2sgd2l0aCBFT1BOT1RTVVBQIGluIGNhc2Ugb2Yga2VybmVsIHdpdGgg
TGFuZGxvY2sKc3VwcG9ydCBidWlsdC1pbiBidXQgZGlzYWJsZWQgYXQgYm9vdCB0aW1lLgoK
U2lnbmVkLW9mZi1ieTogTWlja2HDq2wgU2FsYcO8biA8bWljQGRpZ2lrb2QubmV0PgotLS0K
IGNvbXBhdC9sYW5kbG9jay5jIHwgMTYgKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDE0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvY29t
cGF0L2xhbmRsb2NrLmMgYi9jb21wYXQvbGFuZGxvY2suYwppbmRleCA0N2E1MjA5ZGJmZTIu
LjlhNjM3YmIwNzUzZiAxMDA2NDQKLS0tIGEvY29tcGF0L2xhbmRsb2NrLmMKKysrIGIvY29t
cGF0L2xhbmRsb2NrLmMKQEAgLTc2LDcgKzc2LDE5IEBAIGxhbmRsb2NrX25vX2ZzKHZvaWQp
CiAJCSAqIHJlamVjdGluZyAqYW55KiBmaWxlc3lzdGVtIGFjY2Vzcywgd2Ugc3RpbGwgaGF2
ZSB0bwogCQkgKiBsaXN0IHNvbWUgInBvc3NpYmxlIGFjdGlvbnMiIGhlcmUuCiAJCSAqLwot
CQkuaGFuZGxlZF9hY2Nlc3NfZnMgPSBMQU5ETE9DS19BQ0NFU1NfRlNfUkVBRF9GSUxFLAor
CQkuaGFuZGxlZF9hY2Nlc3NfZnMgPSBMQU5ETE9DS19BQ0NFU1NfRlNfRVhFQ1VURSB8IFwK
KwkJCQkgICAgIExBTkRMT0NLX0FDQ0VTU19GU19SRUFEX0ZJTEUgfCBcCisJCQkJICAgICBM
QU5ETE9DS19BQ0NFU1NfRlNfUkVBRF9ESVIgfCBcCisJCQkJICAgICBMQU5ETE9DS19BQ0NF
U1NfRlNfV1JJVEVfRklMRSB8IFwKKwkJCQkgICAgIExBTkRMT0NLX0FDQ0VTU19GU19SRU1P
VkVfRElSIHwgXAorCQkJCSAgICAgTEFORExPQ0tfQUNDRVNTX0ZTX1JFTU9WRV9GSUxFIHwg
XAorCQkJCSAgICAgTEFORExPQ0tfQUNDRVNTX0ZTX01BS0VfQ0hBUiB8IFwKKwkJCQkgICAg
IExBTkRMT0NLX0FDQ0VTU19GU19NQUtFX0RJUiB8IFwKKwkJCQkgICAgIExBTkRMT0NLX0FD
Q0VTU19GU19NQUtFX1JFRyB8IFwKKwkJCQkgICAgIExBTkRMT0NLX0FDQ0VTU19GU19NQUtF
X1NPQ0sgfCBcCisJCQkJICAgICBMQU5ETE9DS19BQ0NFU1NfRlNfTUFLRV9GSUZPIHwgXAor
CQkJCSAgICAgTEFORExPQ0tfQUNDRVNTX0ZTX01BS0VfQkxPQ0sgfCBcCisJCQkJICAgICBM
QU5ETE9DS19BQ0NFU1NfRlNfTUFLRV9TWU0sCiAJfTsKIAlpbnQgZmQsIHNhdmVkX2Vycm5v
OwogCkBAIC04Niw3ICs5OCw3IEBAIGxhbmRsb2NrX25vX2ZzKHZvaWQpCiAJZmQgPSBsYW5k
bG9ja19jcmVhdGVfcnVsZXNldCgmcmF0dHIsIHNpemVvZihyYXR0ciksIDApOwogCWlmIChm
ZCA9PSAtMSkgewogCQkvKiB0aGlzIGtlcm5lbCBkb2Vzbid0IGhhdmUgbGFuZGxvY2sgYnVp
bHQgaW4gKi8KLQkJaWYgKGVycm5vID09IEVOT1NZUyB8fCBlcnJubyA9PSBFTk9UU1VQKQor
CQlpZiAoZXJybm8gPT0gRU5PU1lTIHx8IGVycm5vID09IEVPUE5PVFNVUFApCiAJCQlyZXR1
cm4gMDsKIAkJcmV0dXJuIC0xOwogCX0KLS0gCjIuMzQuMQoK

--------------3xeiRsBn1wyxO0yrZFRp3r7V--
