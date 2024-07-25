Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF9613A414
	for <landlock@lists.linux.dev>; Thu, 25 Jul 2024 09:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721899053; cv=none; b=Yw0uqZX1QEtpqC6cyfsIiLJ+6NDwrwm5yIjSYt+JnwdmUY+hBmJs+E19YRs+LOHb31LdRI9VBLjeGAYWTpHmd6YtZqRJxf6HwFTLx0xT96Yac5xS4SAvqh1Tk2WPCj/XJA3ZPSUXDBcuMfzDJtwFll5+S9MWaroBtXKIdqmHFpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721899053; c=relaxed/simple;
	bh=fISLlEjQa2n+uAGjutVa6Pq3irvL+rIREqmHsWsxWAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKHW6LvHxjQePPzjVrC+r0bNYSh2tG7akiGYJMQe+BwxTKCYh6J1ruUEYB6FM/65Yu9s9sOL1RtYc4dckVGcYyD5mHqwimlHJQNr/ulvVnwR/Gse7oL5oZEHiSpkOAhUcHbhVchaz09IMw5LPOe1TpBusJb8d6m6n7WPi3sX4dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=UytI9nL/; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UytI9nL/"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7a9a369055so30496066b.3
        for <landlock@lists.linux.dev>; Thu, 25 Jul 2024 02:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721899049; x=1722503849; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=09wThl2XUnmr9jgBWQAO6Z4F8bFGgK4SKSxPhVhzn7I=;
        b=UytI9nL/AburEW2o6sfSbxEfeCV4Uc0/fTPVCAU6l36hRUrE2Uy7gbak+f72h+zCIU
         8smEjog/0OPexaFI8Q7DgkwiZuy3LW8vDuG58qAZW8lIQJSgxQkR22gQziRXFkz6opto
         I/qWQN97hf9JenYLUr6BUf+pL+ASrAO40MK2lcb5/GwjdkFMj/w33S7Kbp1fvRJxpdqG
         5qdE8OiHHWlMhGkVYSfNXver3FcPGX1Ypfl0v4ENKtssVVL5mglsdsXaofuFsGzwd04+
         aSXyGoY67X2txUK8iV3NCkIRYbtXMZOf7LAD9/Gny2Y/sUqGGGvvU1nYn3FLwFEw+0GB
         WLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721899049; x=1722503849;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=09wThl2XUnmr9jgBWQAO6Z4F8bFGgK4SKSxPhVhzn7I=;
        b=kSC2ff0GtUIoPFwoOsqxcfM5CE02w/6EzvNfo/1i7ZLR1y/9vkNpjXx9qvpElKyIYp
         2l0ZCfFskPHDBDvoFruytGAlKSswfg4B/RfRwOFEYXgLRJhMeXsYpW7ZNbE0pOYq+Yhr
         naKk2larA6v3iBZd4vaOIiU5qW4GfqGyUcbUZW+HMpLb0Jp2yzo+J+pMaqNSuaFupcMu
         oJAQFahcjV97ZE4Ac4QShI0HJDzN69PtgBw8oDj/88Zpk5ZSBFBbnvZqYSPDzunje1yL
         t3MQFtbhuz1GYsfzV+NAlsUnPiDf/+K8W3tJqjpIP+6dQiRR4UpqJRnlPb2AbxYqgkzE
         bIQw==
X-Gm-Message-State: AOJu0YwRdcR1pCc8P3cC/d/E5PIXEolXnOOWY0s9VoFKOOo855CvDqB5
	8Y/MEPfnghmwOAX8OTitgdHEODhZLGXUCjJOk9MFNyHdr0WpDkxamUBtBCp9XcA=
X-Google-Smtp-Source: AGHT+IGi6tI3bUjL3daB8szBGU3ZvHz0IRU5npsL/j56GYS2reqUVs3uE9Hjb/PvY1+YSzvt33VVUQ==
X-Received: by 2002:a17:906:ae8d:b0:a7a:9f0f:ab14 with SMTP id a640c23a62f3a-a7ac4f219f7mr125452666b.33.1721899048728;
        Thu, 25 Jul 2024 02:17:28 -0700 (PDT)
Received: from ?IPV6:2a02:a31b:84a1:b780:b3c4:a558:3bdc:9662? ([2a02:a31b:84a1:b780:b3c4:a558:3bdc:9662])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad90486sm50728166b.150.2024.07.25.02.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Jul 2024 02:17:28 -0700 (PDT)
Message-ID: <9cc25a66-b71a-47b8-942e-0c4fef4f3214@suse.com>
Date: Thu, 25 Jul 2024 11:17:04 +0200
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: LTP landlock test is failing for all kernels <= 6.6
To: =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: landlock@lists.linux.dev, Petr Vorel <pvorel@suse.cz>,
 Li Wang <liwang@redhat.com>, ltp@lists.linux.it,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>
References: <fc172149-12e9-45c3-9411-ab158fa7d747@suse.com>
 <54317d90-ec53-49ff-bbff-15200f09c8d2@suse.com>
 <20240725.Sohsez7coh2t@digikod.net>
Content-Language: en-US
From: Andrea Cervesato <andrea.cervesato@suse.com>
In-Reply-To: <20240725.Sohsez7coh2t@digikod.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/25/24 11:06, Mickaël Salaün wrote:
> Hi Andrea,
>
> On Thu, Jul 25, 2024 at 09:50:36AM +0200, Andrea Cervesato wrote:
>> Hi all,
>>
>> we are facing an issue with landlock support in kernels <=6.6. We have a
>> test that takes in consideration all possible rules set and enable only one
>> of them, checking that all the others are raising a permission error.
>> The test can be found here:
>> https://github.com/acerv/ltp/commit/9b1d6838592cebe3c89282a7339db543be2a00e7
> There is definitely an issue in this commit.  ALL_RULES contains all
> access right, mixing filesystem and network ones, which doesn't make
> sense because they don't have the same "namespace".
> LANDLOCK_ACCESS_NET_* and LANDLOCK_ACCESS_FS_* bits overlaps.
> The tester_get_all_rules() function does the ABI checks and removes the
> LANDLOCK_ACCESS_NET_{BIND,CONNECT}_TCP bits if they are not supported
> (in the handled_access_net namespace), which is the same as removing
> LANDLOCK_ACCESS_FS_{EXECUTE,WRITE_FILE} whereas they are supported (in
> the handled_access_fs namespace).

Thank you very much. Indeed, there was an error in the test itself that 
was mixing namespaces.
Now problem seems to be solved.

>> It work fine for all kernels >= 6.7.
> LANDLOCK_ACCESS_NET_{BIND,CONNECT}_TCP were introduced with this kernel
> (Landlock ABI 4), so I guess that's the issue.
>
>> Below you will find the discussion in the LTP mailing list. Can you please
>> give any help with this?
>>
>> Regards,
>> Andrea
>>
>>
>>
>> -------- Forwarded Message --------
>> Subject: 	Re: [LTP] [PATCH v3 09/11] Add landlock04 test
>> Date: 	Thu, 25 Jul 2024 09:12:39 +0200
>> From: 	Andrea Cervesato <andrea.cervesato@suse.com>
>> To: 	Li Wang <liwang@redhat.com>, Petr Vorel <pvorel@suse.cz>
>> CC: 	Andrea Cervesato <andrea.cervesato@suse.de>, ltp@lists.linux.it,
>> Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
>>
>>
>>
>> Hi!
>>
>> it seems like the landlock() support in kernel 6.6 is different than the one
>> in 6.7. The reason why we see that error in kernel <=6.6 is related to how
>> landlock is handling the rules set according to the rule we want to enable.
>>
>> Let's suppose we want to enable the execution for a file. What we should be
>> able to do, is to consider __ALL__ the rules available for landlock, then to
>> enable EXEC only for a specific file. Then, if we make any other operation
>> that is not EXEC, we should have a permission error. This translates to:
>>
>> - set ruleset_attr->handled_access_fs for all available LANDLOCK_ACCESS_FS_*
>> rules
>> - set path_beneath_attr->allowed_access to LANDLOCK_ACCESS_FS_EXEC |
>> LANDLOCK_ACCESS_FS_READ (we need to read in order to execute) for a binary
>> - enforce the rules inside a sandbox containing the binary
>> - execute the binary will work
>> - do any other operation inside the sandbox and obtain a permissions error
>> - at this point, any new rule that is added, will update the list of
>> landlock rules, enabling the sandbox permissions
>>
>> For some reasons that I don't know (and this is evident from kselftests as
>> well), if the initial rules set (ruleset_attr->handled_access_fs) is not
>> identical to the rules we are going to enable
>> (path_beneath_attr->allowed_access), landlock_add_rule() will fail with
>> EINVAL. And this is our case for all kernels <=6.6.
> path_beneath_attr->allowed_access needs to be a subset of
> ruleset_attr->handled_access_fs, otherwise it doesn't make sense to
> allow something which is not handled/denied.
>
>> I really have no idea why this happens and maybe we need to contact the
>> landlock developers.
> Feel free to Cc me and Günther for all Landlock-related patches.
Sure.
>> Andrea
>>
>> On 7/24/24 15:47, Andrea Cervesato wrote:
>>> Hi Li,
>>>
>>> thanks for checking. Mmmh I don't know if it's because they added
>>> LANDLOCK_RULE_NET_PORT. It sounds strange to me, since that would break
>>> all the other features.
>>>
>>> Andrea
>>>
>>> On 7/24/24 14:12, Li Wang wrote:
>>>> Hi Petr, Andrea,
>>>>
>>>> On Wed, Jul 17, 2024 at 1:27 AM Petr Vorel <pvorel@suse.cz> wrote:
>>>>
>>>>      Hi Andrea,
>>>>
>>>>      ...
>>>>      > +static void enable_exec_libs(const int ruleset_fd)
>>>>      > +{
>>>>      > +     FILE *fp;
>>>>      > +     char line[1024];
>>>>      > +     char path[PATH_MAX];
>>>>      > +     char dependency[8][PATH_MAX];
>>>>      > +     int count = 0;
>>>>      > +     int duplicate = 0;
>>>>      > +
>>>>      > +     fp = SAFE_FOPEN("/proc/self/maps", "r");
>>>>      > +
>>>>      > +     while (fgets(line, sizeof(line), fp)) {
>>>>      > +             if (strstr(line, ".so") == NULL)
>>>>      > +                     continue;
>>>>      > +
>>>>      > +             SAFE_SSCANF(line, "%*x-%*x %*s %*x %*s %*d %s",
>>>>      path);
>>>>      > +
>>>>      > +             for (int i = 0; i < count; i++) {
>>>>      > +                     if (strcmp(path, dependency[i]) == 0) {
>>>>      > +                             duplicate = 1;
>>>>      > +                             break;
>>>>      > +                     }
>>>>      > +             }
>>>>      > +
>>>>      > +             if (duplicate) {
>>>>      > +                     duplicate = 0;
>>>>      > +                     continue;
>>>>      > +             }
>>>>      > +
>>>>      > +             strncpy(dependency[count], path, PATH_MAX);
>>>>      > +             count++;
>>>>      > +
>>>>      > +             tst_res(TINFO, "Enable read/exec permissions for
>>>>      %s", path);
>>>>      > +
>>>>      > +             path_beneath_attr->allowed_access =
>>>>      > +                     LANDLOCK_ACCESS_FS_READ_FILE |
>>>>      > +                     LANDLOCK_ACCESS_FS_EXECUTE;
>>>>      > +             path_beneath_attr->parent_fd = SAFE_OPEN(path,
>>>>      O_PATH | O_CLOEXEC);
>>>>      > +
>>>>      > +             SAFE_LANDLOCK_ADD_RULE(
>>>>      > +                     ruleset_fd,
>>>>      > +                     LANDLOCK_RULE_PATH_BENEATH,
>>>>      > +                     path_beneath_attr,
>>>>      > +                     0);
>>>>
>>>>      Unfortunately, on 6.6.15-amd64 kernel (random Debian machine) it
>>>>      fails (after
>>>>      fresh boot) with:
>>>>
>>>>      ...
>>>>      tst_supported_fs_types.c:97: TINFO: Kernel supports tmpfs
>>>>      tst_supported_fs_types.c:49: TINFO: mkfs is not needed for tmpfs
>>>>      tst_test.c:1746: TINFO: === Testing on ext2 ===
>>>>      tst_test.c:1111: TINFO: Formatting /dev/loop1 with ext2 opts=''
>>>>      extra opts=''
>>>>      mke2fs 1.47.0 (5-Feb-2023)
>>>>      tst_test.c:1123: TINFO: Mounting /dev/loop1 to
>>>>      /tmp/LTP_lant6WbKJ/sandbox fstyp=ext2 flags=0
>>>>      landlock_common.h:30: TINFO: Landlock ABI v3
>>>>      landlock04.c:151: TINFO: Testing LANDLOCK_ACCESS_FS_EXECUTE
>>>>      landlock04.c:123: TINFO: Enable read/exec permissions for
>>>>      /usr/lib/i386-linux-gnu/libc.so.6
>>>>      landlock04.c:131: TBROK: landlock_add_rule(3, 1, 0xf7f13ff4, 0):
>>>>      EINVAL (22)
>>>>
>>>>
>>>> Possibly that's because the 'LANDLOCK_RULE_PATH_BENEATH'  was
>>>> refactored from the v6.7 mainline kernel, so it can't add the rule
>>>> correctly
>>>> with older kernels.
>>>>
>>>> commit 0e0fc7e8eb4a11bd9f89a9c74bc7c0e144c56203
>>>> Author: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
>>>> Date:   Thu Oct 26 09:47:46 2023 +0800
>>>>
>>>>      landlock: Refactor landlock_add_rule() syscall
>>>>
>>>> But this is my guess (through reading the code), I didn't do more to
>>>> verify that by installing such a kernel.
>>>>
>>>>
>>>> -- 
>>>> Regards,
>>>> Li Wang
>>>
>>
Regards,
Andrea

