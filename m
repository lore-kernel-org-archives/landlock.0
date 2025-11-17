Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6DF2EAB72
	for <landlock@lists.linux.dev>; Mon, 17 Nov 2025 13:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763384977; cv=none; b=rsOWQg4yx9SaBJ9AWvfrw8+3jEK3CW2P3Ox8YN5yF+eKMb9r26n5fyUCBeiGwzVfKHlKg4WVjqrcei9zE2Oj0FZrTGWpbU527WrZMgMVg1B+hr6ljTdb8FonjBCMSQcfNtNlppSgJru0+y0f9+OPF9kUqFG7NCzzl4n+nQ6xB/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763384977; c=relaxed/simple;
	bh=86BSsIh2mbJnufFwZx2mKV1CtRVqQSNGePDbP1hOzeI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=qUZgksWo2419CANasIUpgeWpXl2B5l3G82RmSr7xDWyzzyn504bSVFDlUM7EU4xct6dJ4zQWG/LacfiQ1ReA9GL6Y97QqVKcnO5LVVBwDUtJM2g3sRTRsvaqNc+mj/A0I+4rAdSCrXzx+zdFtMo8A4qgX+KAQchhCdSqNZjh4js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFUfogI0; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFUfogI0"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-787d5555274so41393447b3.1
        for <landlock@lists.linux.dev>; Mon, 17 Nov 2025 05:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763384974; x=1763989774; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c0dXT30veEakeSVZxbz1QIlJ8eVNfIbZwRp+HWpn1P0=;
        b=BFUfogI0pdXnJOswOcqm9QlpaIE3Y9E39ZRgnvk1Z3HnVX83zyblU6/F0ORjb2RF3L
         dLKucCb+ewXyLT0TvL8+Mmz5RkuONWBb2bTrJhxD+y08SLIfj45cNSMWLdsaDdKTqc75
         VPwFI2sfRAJ4uNFRgYGgt2EmdfdR4m1nNfXSqJYIUbXFI/PksOoh5Ykqt1+Uv8XdgFxU
         bFkUZZYpypz5c35RUMlTTiEsRNlvRX3AbkoppzbZ0njvITIJGU8tYRX8Qs2om2Cyzinl
         KCkQVIT/OG0sJwNRwckN6kH3dRUz6tf7SotraBjLwLMKf2mzbk2DaXG0/OChhsnBfH/1
         TbZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763384974; x=1763989774;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c0dXT30veEakeSVZxbz1QIlJ8eVNfIbZwRp+HWpn1P0=;
        b=p63RjrTesHVdDH7fKdyGyA+YFeMLD/RnRFZNkoJ+bUGznroWiLfbmBRF3CMpezPDrB
         SFte9++MS8zQJ/LnbcyYgoxKipcBqj5qHkjibF/cjL0Uw0JdIxF6xMtBwUfVpP12KVdC
         sd5dVjOB29X8QKhMEWceh4yH+1Kq4ROnQO9Jz+t34Ra/t8i+91VhEdUbgDA1ZgCitQ6d
         5WRnxD204BfdZgQ6ZrGoAg2vqClz1nbvcPyWp2bq3JXSSH56So+guZ0RgR2baF2fpWML
         tzF6i2cL+VMTk3h3Z4zCc63orvoTgyQTsVbcUKxDlRitiEAIw7e0+koiQA/Z1m7wxHiV
         BcQA==
X-Gm-Message-State: AOJu0YzdkCJZqPwfj+Pf7mI80vR2DAoQT603VSgsWbdud6ec+578CeRe
	m1uvC5Pxxi/cMthM93idsnI3EblAENXDOxD6cCZYdK4Cf2SG7CVlUB8J
X-Gm-Gg: ASbGncsbGcvpxUjT3YKlA6RCnlrO5XpgTXpyx6ZGwO2wjRTl9FF/gxhgPQ+NEZCw/kx
	qcSI00Ct4EKSfN7q9Rn4oTtWEd4UM5Sjeeg5rTUbIm1BdgO2VPCJ+RbfkZG1zDFx6gQ9PwkF5V2
	CJCMqMDg0BVs8TbTLbf/b8BYk/7UsPYM+kCPurLzCVciFXAnmIHbwnlI1iRUNRbPyKVOFXPaj8w
	TeVzUR0A57nB37bbchldfFxThtmQewRCa+t24C7Cxo9TX/6ilqzrEE05J/V5BswtmNrha+6pm1Z
	G3CcZD8C5LVqIg5q7yz8IcfdtJm68FKsCLzYw43MieR/tnPBNwBXqW7Nul/vR+m7Bk2zyj7lxyb
	+BEt9mLpy7h89TKatnZIKn6C45V33R0KjFxn8lT52kjrZWLuzbcHWZZWULnu761URWkYZV1dXzg
	IQazFirrDmFFUf6auONEeq/pUQtm/XFCV6Bjb+S4qJTw/lR+wgpNN6HgLoYaYFp5vBHV1GWA==
X-Google-Smtp-Source: AGHT+IGNtFL4kQD34q8KQ3Yng7sJN594YBx6Cn4eH8B7Jjw45ePq7+kbxVaOP5+JhLN/PkP6PELaZQ==
X-Received: by 2002:a05:690e:251b:20b0:63f:ad90:ad45 with SMTP id 956f58d0204a3-641e74b050bmr8838407d50.1.1763384974120;
        Mon, 17 Nov 2025 05:09:34 -0800 (PST)
Received: from [10.10.10.50] (71-132-185-69.lightspeed.tukrga.sbcglobal.net. [71.132.185.69])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6410ea037besm4630188d50.9.2025.11.17.05.09.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Nov 2025 05:09:33 -0800 (PST)
Message-ID: <c015dfbc-9f0d-4711-a72e-9df5566da78c@gmail.com>
Date: Mon, 17 Nov 2025 08:09:33 -0500
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: mic@digikod.net
Cc: landlock@lists.linux.dev, vt@altlinux.org, m@maowtm.org
References: <20240406.baeVa4ugh9Ve@digikod.net>
Subject: Re: R/O protection for lower level dirs
Content-Language: en-US
From: Justin Suess <utilityemal77@gmail.com>
In-Reply-To: <20240406.baeVa4ugh9Ve@digikod.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I have a working tree that implements this feature. It's implemented in 
a flag named LANDLOCK_ADD_RULE_NO_INHERIT.

It's the successor to the first patch I submitted here:

v1: 
https://lore.kernel.org/linux-security-module/20251105180019.1432367-1-utilityemal77@gmail.com/T/#t

The above first implemented version patch implemented the flag without 
any parent directory protections.

Both the old version of the patch and my new version build on Tingmao 
Wang's patch to add LANDLOCK_ADD_RULE_QUIET, which helpfully added a 
rule with similar flag propagation logic.

v3: 
https://lore.kernel.org/linux-security-module/cover.1761511023.git.m@maowtm.org/

I still have to break it out into a patch and implement the kunit and 
flesh out the selftests, but you can find my new implementation and 
build it yourself here: 
https://github.com/RazeLighter777/linux-landlock-no-inherit

And you can see the relevant recent discussion on this issue: 
https://github.com/landlock-lsm/linux/issues/28

There is a newer version of Tingmao Wang's patch (v4) that I will rebase 
off soon, but it mostly concerned adding new tests so it shouldn't be 
difficult.

Rules tagged with LANDLOCK_ADD_RULE_NO_INHERIT attribute have the 
following properties:

1.  Access grants from a rule on a parent inode on the same 
mountpoint will not be propagated downward to child inodes. So a grant 
on /a = rw and /a/b = ro + LANDLOCK_ADD_RULE_NO_INHERIT will not grant 
/a/b write permissions.

2. Refer operations in the direct parent path of the inode (up to the 
mountpoint root) will be blocked if they operate directly on said path. 
So if /a/b/c/d = ro + LANDLOCK_ADD_RULE_NO_INHERIT, moving a,b,c or d, 
creating links to these files, renaming them, or removing them will be 
disallowed. This prevents breaking the file topology and preventing 
sandbox restart attacks.

3. LANDLOCK_ADD_RULE_NO_INHERIT propagates to child layers and is merged 
correctly across domains.

The use cases for this patch could be:

1. Granting access to /home/user, but restricting sensitive directories 
like /home/user/.ssh

2. More fine grained restrictions on USB or other devices in /dev. So 
you could a program to allow /dev/usb, but forbid a specific device 
/dev/usb/hiddev3 for instance.

Here's a demo of the patch. LL_FS_RO_NO_INHERIT is a landlock-sandboxer 
environment variable I added in which just creates an ro + 
LANDLOCK_ADD_RULE_NO_INHERIT rule on an inode.

Demo:

~ # LL_FS_RO="" LL_FS_RW="/" LL_FS_RO_NO_INHERIT="/a/b/c" 
landlock-sandboxer sh
Executing the sandboxed command...
~ # ls
a      dev    init   root   sys    tmp
bin    etc    proc   sbin   tests  usr
~ # rm -rf a/
rm: can't remove 'a/b/c': Permission denied
~ # mv a b
mv: can't rename 'a': Permission denied
~ # cd a/
/a # ls
b
/a # mv b bad
mv: can't rename 'b': Permission denied
/a # ln b bad
ln: bad: Operation not permitted
/a # ln bad b
ln: bad: No such file or directory
/a # rm -rf b
rm: can't remove 'b/c': Permission denied
/a # cd b
/a/b # ls
c
/a/b # rm -rf c
rm: can't remove 'c': Permission denied
/a/b # mv c bad
mv: can't rename 'c': Permission denied
/a/b # touch c/bad
touch: c/bad: Permission denied
/a/b # cd c
/a/b/c # ls
/a/b/c # ls -al
total 0
drwxr-xr-x    2 0        0               40 Nov  9 14:46 .
drwxr-xr-x    3 0        0               60 Nov  9 14:46 ..
/a/b/c # mount --bind /tmp .
mount: permission denied (are you root?)
/a/b/c # cd ..
/a/b # touch fi
/a/b # ls
c   fi
/a/b # mkdir good
/a/b # touch good/test
/a/b # rm -rf good/
/a/b #

Some things I'd like to hear feedback on:

1. Should parent directory refer operation restrictions apply on parent 
directories above the mountpoint? Currently they only propagate up to 
the mountpoint, so you if you had /a/b/c = ro + 
LANDLOCK_ADD_RULE_NO_INHERIT and / = rw, if /a/b was on a different 
mountpoint than /, you could still move /a to /unrelated for instance. 
This wouldn't be difficult to fix, but would add some complexity.

2. Potential for extension to other scopes? It's unclear how this flag 
could be useful for other cases such as network and signal restrictions, 
but if somebody can think of something interesting it might be worth a look.

3. Any edge cases that should be tested for that I might have missed / 
that need addressing.

I'd also love to hear feedback from Nicholas and see their work and 
incorporate any lessons learned from them.

Kind Regards,

Justin Suess



