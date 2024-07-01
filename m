Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79868C1D
	for <landlock@lists.linux.dev>; Mon,  1 Jul 2024 14:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719843973; cv=none; b=J9ortBEbF2TIlpwZkY868r89Df5xhs+u0eaMNUHHo3ShIGB3bFjuUubk7Aj8OHi8dHXWFJanF0aLDDWjMtivtwr0hQrjl1vccUTRjTOOmAYkbv6ezRzqgr75XIwglPWEw27AUjbHFu1AtR93BBvTBGIzvQJcQWNSyBF13EK9S+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719843973; c=relaxed/simple;
	bh=piavopNMDXso4W1Z2RYCzYJ680Y4GEtYv+WdwrhB0U0=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:From:Subject; b=ZCC4LGZHydTMqxO5SekMkcBFQNW+6G4g8z83uKFdXhORh9LH1c89MZ/cn/hzeI9/0IDwpn++0T8tqVu9piasO72g2CM3iYPR4y+wk6CQ5LX2E5luqLPV2Sw5X7O6wlYbAQ09xTYlxbtM+yR3mJ4I100w9T8FkjamTvD58euahk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cYsexC+C; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cYsexC+C"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52cd717ec07so3906035e87.0
        for <landlock@lists.linux.dev>; Mon, 01 Jul 2024 07:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1719843969; x=1720448769; darn=lists.linux.dev;
        h=subject:from:content-language:to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1iE7O9191FRp4/AKimvKTaTIH12g38ZClC5fXjxTHo0=;
        b=cYsexC+CFzJyuBcqzlWmtbnG+tObLWYYDqZzhCsOPwg4hBQVvopf4HzlPNTgsAeqJB
         jqI103JsANt12dBQy8C+BbcIf001EROU9ki6frmC+/E9Wpa0wzw4Hf1rMveEP5BnO04Y
         IJijaZN2oQtePwIw1EgW3b2L58OeaL+a9MG7DJQ6CaaJSdL5tmkK0crmUJmvhJ1gYGrB
         SMPlWFrYax0YSf75SxNZ1MQrBAg5Lmv7zgEJjzHr6ozXGsEpx+cN76MOylakvuh6XxwI
         PIgRyhEGmkJhYf99IyRdr531BNwwkxMY37zqNNSGwYNRLqzO2UFh7DZB9qRr/q4rdmIK
         JxVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719843969; x=1720448769;
        h=subject:from:content-language:to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1iE7O9191FRp4/AKimvKTaTIH12g38ZClC5fXjxTHo0=;
        b=OCFaqL4miXOokn6kX8QEQSzo5TOX3apyu9BGTpfnAXBrJYM5ERPAaICSIoT6Yuf/3Z
         5DXairl3je/Z4gqbbEslJLI5S3Zo1US2xcjO2xwfRIsJ/LRae9cn1Sx03U4L1iL3JZWd
         POHeoo2z9AufpTp+XlPuezM/P3da1/ao43cFomHKUM7Nle5SDCLmqemiWVwdVc/htUzY
         VnUMSy0I3OqWII3Pc9pgRj9ihQ3W+7I8gaOk4Wer0a7QIuG4Jv5HlJfUuuqtgNn4plup
         YkHh3iUaOV0K/Q4ReEquCSBZW27e6n35FNvji+y0Yaz+g/qswGlX41mzLMB0ceP19rUn
         7y9g==
X-Gm-Message-State: AOJu0YxsqZP2scBnYLsuiaq+SevRhuqF6jYgtA2BB5ocaHfv0UXvXtgu
	zVUaxKhRSfDzPrVQk7iQQJc2UY0cd2+M5bGAKsNi7kqNHqlt3fETVviPr1VbkXnRhKR+dJhk1Nh
	QEwc=
X-Google-Smtp-Source: AGHT+IEUJ1D+mXrnv9ot0pygFsziayWkf9UJyROMlHoh3AVhWB+ANP2Adfm0Co6uGJdNfhuRq22oYg==
X-Received: by 2002:a05:651c:889:b0:2ec:4acf:97dc with SMTP id 38308e7fff4ca-2ee5e337975mr47458601fa.11.1719843968331;
        Mon, 01 Jul 2024 07:26:08 -0700 (PDT)
Received: from [10.232.133.69] ([88.128.88.77])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7ab4dcfsm1293280a34.30.2024.07.01.07.26.06
        for <landlock@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 07:26:07 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------PCrgJ8wN8qQXFKpc5lh0fr2s"
Message-ID: <5dcec431-4089-4c73-93c6-eda0e0616ebc@suse.com>
Date: Mon, 1 Jul 2024 16:25:53 +0200
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: landlock@lists.linux.dev
Content-Language: en-US
From: Andrea Cervesato <andrea.cervesato@suse.com>
Subject: Help with LANDLOCK_ACCESS_FS_EXECUTE

This is a multi-part message in MIME format.
--------------PCrgJ8wN8qQXFKpc5lh0fr2s
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

I'm actually writing a test for LANDLOCK_ACCESS_FS_EXECUTE flag in LTP [1].
The test is really simple: it applies the EXECUTE landlock rule inside a 
folder and it verifies that a binary inside it can be executed.
A similar test applies the rule only to the specific binary and check 
again its execution.

But while I was writing the test, I encountered an issue with the 
specific rule setup, since EACCES is raised unexpectedly during binary 
execution.
So I wrote a reproducer, assuming that LTP might be the issue, but it's 
not. The reproducer actually shows that binary can't be executed after 
applying the EXECUTE rule.

I will attach the source code to this email. Can you please tell me if 
there's something wrong with it?

Best regards,
Andrea Cervesato


[1] https://linux-test-project.readthedocs.io/en/latest/

--------------PCrgJ8wN8qQXFKpc5lh0fr2s
Content-Type: text/x-csrc; charset=UTF-8; name="exec-tester.c"
Content-Disposition: attachment; filename="exec-tester.c"
Content-Transfer-Encoding: base64

LyoKICogQ29tcGlsZSB3aXRoOgogKiAgICBnY2MgLWxjIGV4ZWMtdGVzdGVyLmMgLW8gZXhl
Yy10ZXN0ZXIKICoKICogRW5zdXJlIHRoYXQgImxhbmRsb2NrX2V4ZWMiIGlzIHByZXNlbnQg
YW5kIGl0J3MgZXhlY3V0YWJsZSB2aWEgImV4ZWN2ZSIuCiAqIENhbiBiZSBhIGNvbXBpbGVk
IHNvdXJjZSBsaWtlOgogKgogKiAgICBpbnQgbWFpbih2b2lkKSB7IHJldHVybiAwOyB9CiAq
LwoKI2RlZmluZSBfR05VX1NPVVJDRQoKI2luY2x1ZGUgPHN0ZGlvLmg+CiNpbmNsdWRlIDxm
Y250bC5oPgojaW5jbHVkZSA8ZXJybm8uaD4KI2luY2x1ZGUgPHN0cmluZy5oPgojaW5jbHVk
ZSA8c3RkaW50Lmg+CiNpbmNsdWRlIDx1bmlzdGQuaD4KI2luY2x1ZGUgPHN5cy93YWl0Lmg+
CiNpbmNsdWRlIDxzeXMvcHJjdGwuaD4KI2luY2x1ZGUgPHN5cy9zeXNjYWxsLmg+CiNpbmNs
dWRlIDxsaW51eC9sYW5kbG9jay5oPgoKI2RlZmluZSBGSUxFX0VYRUMgImxhbmRsb2NrX2V4
ZWMiCgpzdGF0aWMgaW5saW5lIGludCBsYW5kbG9ja19jcmVhdGVfcnVsZXNldChjb25zdCBz
dHJ1Y3QgbGFuZGxvY2tfcnVsZXNldF9hdHRyICphdHRyLAoJc2l6ZV90IHNpemUsIHVpbnQz
Ml90IGZsYWdzKQp7CglyZXR1cm4gc3lzY2FsbChTWVNfbGFuZGxvY2tfY3JlYXRlX3J1bGVz
ZXQsCgkJYXR0ciwgc2l6ZSwgZmxhZ3MpOwp9CgpzdGF0aWMgaW5saW5lIGludCBsYW5kbG9j
a19hZGRfcnVsZShpbnQgcnVsZXNldF9mZCwgZW51bSBsYW5kbG9ja19ydWxlX3R5cGUgcnVs
ZV90eXBlLAoJY29uc3Qgdm9pZCAqcnVsZV9hdHRyLCB1aW50MzJfdCBmbGFncykKewoJcmV0
dXJuIHN5c2NhbGwoU1lTX2xhbmRsb2NrX2FkZF9ydWxlLAoJCXJ1bGVzZXRfZmQsIHJ1bGVf
dHlwZSwgcnVsZV9hdHRyLCBmbGFncyk7Cn0KCnN0YXRpYyBpbmxpbmUgaW50IGxhbmRsb2Nr
X3Jlc3RyaWN0X3NlbGYoaW50IHJ1bGVzZXRfZmQsIGludCBmbGFncykKewoJcmV0dXJuIHN5
c2NhbGwoU1lTX2xhbmRsb2NrX3Jlc3RyaWN0X3NlbGYsCgkJcnVsZXNldF9mZCwgZmxhZ3Mp
Owp9CgpzdGF0aWMgdm9pZCBydW5fdGVzdChjb25zdCBpbnQgd2l0aF9sYW5kbG9jaykKewoJ
aW50IHJ2YWw7CglwaWRfdCBwaWQ7CglpbnQgc3RhdHVzOwoJaW50IGZkID0gLTE7CglpbnQg
cnVsZXNldF9mZCA9IC0xOwoKCWlmICh3aXRoX2xhbmRsb2NrKSB7CgkJc3RydWN0IGxhbmRs
b2NrX3J1bGVzZXRfYXR0ciBydWxlc2V0X2F0dHIgPSB7CgkJCS5oYW5kbGVkX2FjY2Vzc19m
cyA9CgkJCQlMQU5ETE9DS19BQ0NFU1NfRlNfRVhFQ1VURSB8CgkJCQlMQU5ETE9DS19BQ0NF
U1NfRlNfV1JJVEVfRklMRSB8CgkJCQlMQU5ETE9DS19BQ0NFU1NfRlNfUkVBRF9GSUxFCgkJ
fTsKCgkJcnVsZXNldF9mZCA9IGxhbmRsb2NrX2NyZWF0ZV9ydWxlc2V0KAoJCQkmcnVsZXNl
dF9hdHRyLCBzaXplb2Yoc3RydWN0IGxhbmRsb2NrX3J1bGVzZXRfYXR0ciksIDApOwoJCWlm
IChydWxlc2V0X2ZkID09IC0xKSB7CgkJCXByaW50ZigibGFuZGxvY2tfY3JlYXRlX3J1bGVz
ZXQoKSBlcnJvciAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKCQkJZ290byBlbmQ7CgkJfQoK
CQlmZCA9IG9wZW4oRklMRV9FWEVDLCBPX1BBVEggfCBPX0NMT0VYRUMsIDA3NDQpOwoJCWlm
IChmZCA9PSAtMSkgewoJCQlwcmludGYoIkNhbid0IG9wZW4gZmlsZSAnJXMnXG4iLCBGSUxF
X0VYRUMpOwoJCQlnb3RvIGVuZDsKCQl9CgoJCXN0cnVjdCBsYW5kbG9ja19wYXRoX2JlbmVh
dGhfYXR0ciBwYXRoX2JlbmVhdGhfYXR0ciA9IHsKCQkJLmFsbG93ZWRfYWNjZXNzID0gTEFO
RExPQ0tfQUNDRVNTX0ZTX0VYRUNVVEUsCgkJCS5wYXJlbnRfZmQgPSBmZCwKCQl9OwoKCQly
dmFsID0gbGFuZGxvY2tfYWRkX3J1bGUoCgkJCXJ1bGVzZXRfZmQsCgkJCUxBTkRMT0NLX1JV
TEVfUEFUSF9CRU5FQVRILAoJCQkmcGF0aF9iZW5lYXRoX2F0dHIsCgkJCTApOwoJCWlmIChy
dmFsID09IC0xKSB7CgkJCXByaW50ZigibGFuZGxvY2tfYWRkX3J1bGUgZXJyb3I6ICVzXG4i
LCBzdHJlcnJvcihlcnJubykpOwoJCQlnb3RvIGVuZDsKCQl9CgoJCXJ2YWwgPSBwcmN0bChQ
Ul9TRVRfTk9fTkVXX1BSSVZTLCAxLCAwLCAwLCAwKTsKCQlpZiAocnZhbCA9PSAtMSkgewoJ
CQlwcmludGYoInByY3RsIGVycm9yXG4iKTsKCQkJZ290byBlbmQ7CgkJfQoKCQlydmFsID0g
bGFuZGxvY2tfcmVzdHJpY3Rfc2VsZihydWxlc2V0X2ZkLCAwKTsKCQlpZiAocnZhbCA9PSAt
MSkgewoJCQlwcmludGYoImxhbmRsb2NrX3Jlc3RyaWN0X3NlbGYgZXJyb3I6ICVzXG4iLCBz
dHJlcnJvcihlcnJubykpOwoJCQlnb3RvIGVuZDsKCQl9Cgl9CgoJcGlkID0gZm9yaygpOwoJ
aWYgKHBpZCA9PSAtMSkgewoJCXByaW50ZigiZXhlY3ZlKCkgZXJyb3I6ICVzXG4iLCBzdHJl
cnJvcihlcnJubykpOwoJCWdvdG8gZW5kOwoJfQoKCWlmICghcGlkKSB7CgkJY2hhciAqYXJn
c1tdID0geyhjaGFyICopRklMRV9FWEVDLCBOVUxMfTsKCgkJcnZhbCA9IGV4ZWN2ZShGSUxF
X0VYRUMsIGFyZ3MsIE5VTEwpOwoJCWlmIChydmFsID09IC0xKQoJCQlwcmludGYoIkZhaWxl
ZCB0byBleGVjdXRlIHRlc3QgYmluYXJ5OiAlc1xuIiwgc3RyZXJyb3IoZXJybm8pKTsKCgkJ
X2V4aXQoMSk7Cgl9CgoJd2FpdHBpZChwaWQsICZzdGF0dXMsIDApOwoJaWYgKCFXSUZFWElU
RUQoc3RhdHVzKSB8fCBXRVhJVFNUQVRVUyhzdGF0dXMpICE9IDApCgkJZ290byBlbmQ7CgoJ
cHJpbnRmKCJCaW5hcnkgZXhlY3V0ZWRcbiIpOwoKZW5kOgoJaWYgKHJ1bGVzZXRfZmQgIT0g
LTEpCgkJY2xvc2UocnVsZXNldF9mZCk7CgoJaWYgKGZkICE9IC0xKQoJCWNsb3NlKGZkKTsK
fQoKaW50IG1haW4odm9pZCkKewoJcHJpbnRmKCJcblRlc3RpbmcgTEFORExPQ0tfQUNDRVNT
X0ZTX0VYRUNVVEUgZnVuY3Rpb25hbGl0eVxuXG4iKTsKCXByaW50ZigiLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLVxuIik7CglwcmludGYoIlx0UnVubmluZyB0
ZXN0IHdpdGhvdXQgbGFuZGxvY2tcbiIpOwoJcHJpbnRmKCJcdCIpOwoJcnVuX3Rlc3QoMCk7
CglwcmludGYoIlxuIik7CgoJcHJpbnRmKCItLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tXG4iKTsKCXByaW50ZigiXHRSdW5uaW5nIHRlc3Qgd2l0aCBsYW5kbG9j
ayBhY3RpdmF0ZWRcbiIpOwoJcHJpbnRmKCJcdCIpOwoJcnVuX3Rlc3QoMSk7CglwcmludGYo
IlxuIik7CgoJcmV0dXJuIDA7Cn0K

--------------PCrgJ8wN8qQXFKpc5lh0fr2s--
