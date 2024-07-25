Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44DBA172784
	for <landlock@lists.linux.dev>; Thu, 25 Jul 2024 07:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721893865; cv=none; b=cvdSSa0qA+Y9Ayxo8E6dIvqwE2/PGWMH030wDytdF8TGBo21VRr782rtTr8KjoFgfMDQD5ujUV9OCA81Yf7ZNuTdVqhpti5/Yfwtg7cSbP/sqpVXD3hGn/xpsjpXz7+Mz4KaCWmiuhmU7duKSHyipZQLkOvUC8yNZRJWC+2RCyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721893865; c=relaxed/simple;
	bh=Jsb6/n0x8JnsosH5bFbDwkvHZBgSGIXoN6Bopq3BoBI=;
	h=Message-ID:Date:MIME-Version:Subject:References:To:Cc:From:
	 In-Reply-To:Content-Type; b=ZJ//DEJJ5pSK0Q0/T6Ynr4MTFLvXFj1VAi7tsBvoWvE/0HZqkZiYZjVAslMSEluezlWF+bHwShcZ4JXKlhZwpIqbP55tYaPYOaQsibtl2rwS5G6T+P59b+URYrasJxAC9GjfTK/guBhI+z8tBrlWrOfYOxMyFvQXvuX7VrKqFLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=CTP7yq8F; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="CTP7yq8F"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so29374266b.1
        for <landlock@lists.linux.dev>; Thu, 25 Jul 2024 00:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721893861; x=1722498661; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:cc:to:references
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5UpbOnKPNXdgCtKxaj/GkDYJck5XrkMyNSf35kBzLEE=;
        b=CTP7yq8FshhPx8YyzDkpgMjNU0J2R5VY4fiRkDIfNgZrHM0HQjxZyXYCGRZGxV2PiR
         PIqNXQwIW1D11lAZZgu48e97A5Gria7PIvA1Ai3x0/LjJW1b0sQK0CDkb33MiPGsJ92w
         MEwKyzXQbUSp96KhpMNPT2f8Qp5CQ9j3wweLyxvydKVXgPLOdF6GuMPO0DK6sPPhx/J7
         gZx+diGKGDPOBZxcWyh27a4Txr6zHvBZIO1q3azti79gT+IUKeaZLPNuX6KW7l0EqKOy
         RYUn1XcRc1WNwqeNTjQDIU2laOx2mm9aNgl2GHoDUzr2QR4C5IJiNq6B/GBIB1dTl4US
         WFOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721893861; x=1722498661;
        h=content-transfer-encoding:in-reply-to:from:cc:to:references
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5UpbOnKPNXdgCtKxaj/GkDYJck5XrkMyNSf35kBzLEE=;
        b=BOdJfiQ5Qt9r6ih/TL35wnNe/pn2kgI1DojKZd8Qy8HKHorqgjVPWVKEAM2BNESwQM
         klDMiFZKUvOfxY7gV+/2KcRWGMojJ0/Y28UmCyUjh3kxfZpvEgpb2WN7t4GHKWakdRfv
         3Id0eitvm1l0OJGO9ta0FUpYAogwY3ew7oPrwE7gX9PSw2kEr9DIbWHxvCx50s1WG9If
         JQUrlcc4AcBH6sFD5BsT+PRdOz3LbXELzrq1EU5o8XKUDhyVHhc+BflaiAiQB98qXHFs
         GpJBM5M61tHix/0tqKgqjkp7Zy7f283nuxA9t0OabG9yqdsCtMh9y2yz150tdL5Erckt
         tQ/w==
X-Gm-Message-State: AOJu0Yx7HfAMVfI1TZH0/7kSoYYrZaO5FAo8MvXgacOiCEFnLRBy15h8
	9uHrxAswkMIEkgfzfJbaTgWyROMBgtkfiQtPeElQjXt10V4bGISDSPVmMxJ9TwolnK5C/Lotj7O
	1rXg=
X-Google-Smtp-Source: AGHT+IF8K21h666VXYBniMLfwM/HkAdqT4eTOrw+1hbR8uIKCk7xNiT0IsAG3LGkua87HfPMjLQlIQ==
X-Received: by 2002:a17:906:919:b0:a7a:b070:92cc with SMTP id a640c23a62f3a-a7ac503af89mr101401266b.45.1721893860668;
        Thu, 25 Jul 2024 00:51:00 -0700 (PDT)
Received: from ?IPV6:2a02:a31b:84a1:b780:b3c4:a558:3bdc:9662? ([2a02:a31b:84a1:b780:b3c4:a558:3bdc:9662])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad91075sm43231266b.168.2024.07.25.00.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 00:51:00 -0700 (PDT)
Message-ID: <54317d90-ec53-49ff-bbff-15200f09c8d2@suse.com>
Date: Thu, 25 Jul 2024 09:50:36 +0200
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: LTP landlock test is failing for all kernels <= 6.6
Content-Language: en-US
References: <fc172149-12e9-45c3-9411-ab158fa7d747@suse.com>
To: landlock@lists.linux.dev
Cc: Petr Vorel <pvorel@suse.cz>, Li Wang <liwang@redhat.com>
From: Andrea Cervesato <andrea.cervesato@suse.com>
In-Reply-To: <fc172149-12e9-45c3-9411-ab158fa7d747@suse.com>
X-Forwarded-Message-Id: <fc172149-12e9-45c3-9411-ab158fa7d747@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi all,

we are facing an issue with landlock support in kernels <=6.6. We have a 
test that takes in consideration all possible rules set and enable only 
one of them, checking that all the others are raising a permission error.
The test can be found here: 
https://github.com/acerv/ltp/commit/9b1d6838592cebe3c89282a7339db543be2a00e7
It work fine for all kernels >= 6.7.

Below you will find the discussion in the LTP mailing list. Can you 
please give any help with this?

Regards,
Andrea



-------- Forwarded Message --------
Subject: 	Re: [LTP] [PATCH v3 09/11] Add landlock04 test
Date: 	Thu, 25 Jul 2024 09:12:39 +0200
From: 	Andrea Cervesato <andrea.cervesato@suse.com>
To: 	Li Wang <liwang@redhat.com>, Petr Vorel <pvorel@suse.cz>
CC: 	Andrea Cervesato <andrea.cervesato@suse.de>, ltp@lists.linux.it, 
Konstantin Meskhidze <konstantin.meskhidze@huawei.com>



Hi!

it seems like the landlock() support in kernel 6.6 is different than the 
one in 6.7. The reason why we see that error in kernel <=6.6 is related 
to how landlock is handling the rules set according to the rule we want 
to enable.

Let's suppose we want to enable the execution for a file. What we should 
be able to do, is to consider __ALL__ the rules available for landlock, 
then to enable EXEC only for a specific file. Then, if we make any other 
operation that is not EXEC, we should have a permission error. This 
translates to:

- set ruleset_attr->handled_access_fs for all available 
LANDLOCK_ACCESS_FS_* rules
- set path_beneath_attr->allowed_access to LANDLOCK_ACCESS_FS_EXEC | 
LANDLOCK_ACCESS_FS_READ (we need to read in order to execute) for a binary
- enforce the rules inside a sandbox containing the binary
- execute the binary will work
- do any other operation inside the sandbox and obtain a permissions error
- at this point, any new rule that is added, will update the list of 
landlock rules, enabling the sandbox permissions

For some reasons that I don't know (and this is evident from kselftests 
as well), if the initial rules set (ruleset_attr->handled_access_fs) is 
not identical to the rules we are going to enable 
(path_beneath_attr->allowed_access), landlock_add_rule() will fail with 
EINVAL. And this is our case for all kernels <=6.6.

I really have no idea why this happens and maybe we need to contact the 
landlock developers.

Andrea

On 7/24/24 15:47, Andrea Cervesato wrote:
> Hi Li,
>
> thanks for checking. Mmmh I don't know if it's because they added 
> LANDLOCK_RULE_NET_PORT. It sounds strange to me, since that would 
> break all the other features.
>
> Andrea
>
> On 7/24/24 14:12, Li Wang wrote:
>> Hi Petr, Andrea,
>>
>> On Wed, Jul 17, 2024 at 1:27 AM Petr Vorel <pvorel@suse.cz> wrote:
>>
>>     Hi Andrea,
>>
>>     ...
>>     > +static void enable_exec_libs(const int ruleset_fd)
>>     > +{
>>     > +     FILE *fp;
>>     > +     char line[1024];
>>     > +     char path[PATH_MAX];
>>     > +     char dependency[8][PATH_MAX];
>>     > +     int count = 0;
>>     > +     int duplicate = 0;
>>     > +
>>     > +     fp = SAFE_FOPEN("/proc/self/maps", "r");
>>     > +
>>     > +     while (fgets(line, sizeof(line), fp)) {
>>     > +             if (strstr(line, ".so") == NULL)
>>     > +                     continue;
>>     > +
>>     > +             SAFE_SSCANF(line, "%*x-%*x %*s %*x %*s %*d %s",
>>     path);
>>     > +
>>     > +             for (int i = 0; i < count; i++) {
>>     > +                     if (strcmp(path, dependency[i]) == 0) {
>>     > +                             duplicate = 1;
>>     > +                             break;
>>     > +                     }
>>     > +             }
>>     > +
>>     > +             if (duplicate) {
>>     > +                     duplicate = 0;
>>     > +                     continue;
>>     > +             }
>>     > +
>>     > +             strncpy(dependency[count], path, PATH_MAX);
>>     > +             count++;
>>     > +
>>     > +             tst_res(TINFO, "Enable read/exec permissions for
>>     %s", path);
>>     > +
>>     > +             path_beneath_attr->allowed_access =
>>     > +                     LANDLOCK_ACCESS_FS_READ_FILE |
>>     > +                     LANDLOCK_ACCESS_FS_EXECUTE;
>>     > +             path_beneath_attr->parent_fd = SAFE_OPEN(path,
>>     O_PATH | O_CLOEXEC);
>>     > +
>>     > +             SAFE_LANDLOCK_ADD_RULE(
>>     > +                     ruleset_fd,
>>     > +                     LANDLOCK_RULE_PATH_BENEATH,
>>     > +                     path_beneath_attr,
>>     > +                     0);
>>
>>     Unfortunately, on 6.6.15-amd64 kernel (random Debian machine) it
>>     fails (after
>>     fresh boot) with:
>>
>>     ...
>>     tst_supported_fs_types.c:97: TINFO: Kernel supports tmpfs
>>     tst_supported_fs_types.c:49: TINFO: mkfs is not needed for tmpfs
>>     tst_test.c:1746: TINFO: === Testing on ext2 ===
>>     tst_test.c:1111: TINFO: Formatting /dev/loop1 with ext2 opts=''
>>     extra opts=''
>>     mke2fs 1.47.0 (5-Feb-2023)
>>     tst_test.c:1123: TINFO: Mounting /dev/loop1 to
>>     /tmp/LTP_lant6WbKJ/sandbox fstyp=ext2 flags=0
>>     landlock_common.h:30: TINFO: Landlock ABI v3
>>     landlock04.c:151: TINFO: Testing LANDLOCK_ACCESS_FS_EXECUTE
>>     landlock04.c:123: TINFO: Enable read/exec permissions for
>>     /usr/lib/i386-linux-gnu/libc.so.6
>>     landlock04.c:131: TBROK: landlock_add_rule(3, 1, 0xf7f13ff4, 0):
>>     EINVAL (22)
>>
>>
>> Possibly that's because the 'LANDLOCK_RULE_PATH_BENEATH'  was
>> refactored from the v6.7 mainline kernel, so it can't add the rule 
>> correctly
>> with older kernels.
>>
>> commit 0e0fc7e8eb4a11bd9f89a9c74bc7c0e144c56203
>> Author: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
>> Date:   Thu Oct 26 09:47:46 2023 +0800
>>
>>     landlock: Refactor landlock_add_rule() syscall
>>
>> But this is my guess (through reading the code), I didn't do more to
>> verify that by installing such a kernel.
>>
>>
>> -- 
>> Regards,
>> Li Wang
>
>

