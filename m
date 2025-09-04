Received: from smtp-8fab.mail.infomaniak.ch (smtp-8fab.mail.infomaniak.ch [83.166.143.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3FE222594
	for <landlock@lists.linux.dev>; Thu,  4 Sep 2025 18:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757012117; cv=none; b=gJ9+ck6CHpOSXUzyQZtIPWa47nW/CmKb8G9MKQ1hUVAQUXuyyPu0g0tSlB3HVAb3fMSoYhrl3SIatMbasOp6UigaOCCvtmYfAFmg6Jbq4m7doOheMM3hzKu2M81xjNGX9vweKz4mALB3S+xD+AfRnNMtqat7ZS/3te1hN04zHB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757012117; c=relaxed/simple;
	bh=3w9ufJX/Wp4arR6T2oEI1m4xMyNAnL0vZDdZxT2OceU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyJLvYgU1Tga3dClENKYQVhlnDx5dqYaCUogET0fWiuMUPjFI5t5N+p3zvC+SZI4s2nyXakbpkjqmF2vtATuOio/CnKl5sr9l4Y5pUxPP+YXA+1WNln41tZbBERdgEWGtzyE/p7AbVaTlcNPtpJC+WKioscwFTX0CUc9sbBLGAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=CaShtB6t; arc=none smtp.client-ip=83.166.143.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="CaShtB6t"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cHpCW6PCnzrgP;
	Thu,  4 Sep 2025 20:38:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1757011127;
	bh=XnJX/BALytZOcOriUSV9FKkQcAFrIPa7+2hCJBMVqjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CaShtB6tL7wkP6CMCpXuNJ5vsnMzJRTne4ED6d82Ht0o1GCcnOHL6HpnwZIWgZvh0
	 bLnvskDm5fZGQAadnVfc9VIWKzbTDemMmGx1nVJQ2mwESO1nWy6XQEsb+XRqW9V10S
	 DOnGK31E8WoBPTWHBjLYyPQ6HnFJgdu8NoTsEhX4=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cHpCW1NJbzpJR;
	Thu,  4 Sep 2025 20:38:47 +0200 (CEST)
Date: Thu, 4 Sep 2025 20:38:46 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: =?utf-8?B?5aea5bmz?= <yaoping@vivo.com>
Cc: "landlock@lists.linux.dev" <landlock@lists.linux.dev>, 
	Tingmao Wang <m@maowtm.org>
Subject: Re: landlock not works well on FUSE filesystem?
Message-ID: <20250904.pei6EiFaibo4@digikod.net>
References: <OSQPR06MB7181A053FE55DC0348750713D43BA@OSQPR06MB7181.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <OSQPR06MB7181A053FE55DC0348750713D43BA@OSQPR06MB7181.apcprd06.prod.outlook.com>
X-Infomaniak-Routing: alpha

Hi,

On Thu, Aug 28, 2025 at 01:49:08AM +0000, 姚平 wrote:
> Hi, all.
> 
> I’m trying to use landlock on android 15 which uses kernel 6.6, but meet some troubles when enable landlock on files in fuse filesystem. Here is what I did:
> 
> I use https://elixir.bootlin.com/linux/v6.6.101/source/samples/landlock/sandboxer.c to build a sandboxer and a very simple program sandboxer-test as the sandboxed target.
> The simple target program just reads first line from a file and writes a line to another file.
> I run tests in /data/local/tmp with SELinux disabled. In each test, I enable Landlock with a ruleset, both including and excluding the filepath being tested.
> 
> Test1: test files on /data, landlock works like a charm
> ===Ruleset includes tested files:
> >LL_FS_RO="/apex/:/linkerconfig:/data/local/tmp/sandbox:" LL_FS_RW="/data/local/tmp/files" /data/local/tmp/sandboxer /data/local/tmp/sandbox/sandboxer-test /data/local/tmp/files/ro/readme.txt /data/local/tmp/files/rw/writeme.txt
> First line from input file '/data/local/tmp/files/ro/readme.txt':
> hello there~~~
> 
> writed to output file '/data/local/tmp/files/rw/writeme.txt':
> hello world
> 
> ===Ruleset excludes test files:
> > LL_FS_RO="/apex/:/linkerconfig:/data/local/tmp/sandbox:" LL_FS_RW="/data/local/tmp/sandbox" /data/local/tmp/sandboxer /data/local/tmp/sandbox/sandboxer-test /data/local/tmp/files/ro/readme.txt /data/local/tmp/files/rw/writeme.txt

This would not change your test but LL_FS_RW should point to something
else than the sandboxer binary.  Well, we should probably allow this
variable to not be set.

> Error opening input file '/data/local/tmp/files/ro/readme.txt': Permission denied
> Error opening output file '/data/local/tmp/files/rw/writeme.txt': Permission denied
> 
> Test2: test files on /tmp, landlock works like a charm
> ===Ruleset includes tested files:
> > LL_FS_RO="/apex/:/linkerconfig:/data/local/tmp/sandbox:"LL_FS_RW="/tmp" /data/local/tmp/sandboxer /data/local/tmp/sandbox/sandboxer-test /tmp/ro.txt /tmp/rw.txt
> First line from input file '/tmp/ro.txt':
> hello there~~
> 
> writed to output file '/tmp/rw.txt':
> hello world
> 
> ===Ruleset excludes test files:
> > LL_FS_RO="/apex/:/linkerconfig:/data/local/tmp/sandbox:"LL_FS_RW="/data" /data/local/tmp/sandboxer /data/local/tmp/sandbox/sandboxer-test /tmp/ro.txt /tmp/rw.txt
> Error opening input file '/tmp/ro.txt': Permission denied
> Error opening output file '/tmp/rw.txt': Permission denied
> 
> Test3: test files on /storage/emulated, landlock not works.
> ===Ruleset includes tested files:
> >LL_FS_RO="/apex/:/linkerconfig:/data/local/tmp/sandbox:"LL_FS_RW="/storage/emulated/0/Android/data/com.vivo.nativetest/files" /data/local/tmp/sandboxer /data/local/tmp/sandbox/sandboxer-test /storage/emulated/0/Android/data/com.vivo.nativetest/files/ro.txt /storage/emulated/0/Android/data/com.vivo.nativetest/files/rw.txt
> Error opening input file '/storage/emulated/0/Android/data/com.vivo.nativetest/files/ro.txt': Permission denied
> Error opening output file '/storage/emulated/0/Android/data/com.vivo.nativetest/files/rw.txt': Permission denied
> 
> ===Ruleset excludes tested files:
> >LL_FS_RO="/apex/:/linkerconfig:/data/local/tmp/sandbox:"LL_FS_RW="/data" /data/local/tmp/sandboxer /data/local/tmp/sandbox/sandboxer-test /storage/emulated/0/Android/data/com.test.nativetest/files/ro.txt /storage/emulated/0/Android/data/com.test.nativetest/files/rw.txt
> Error opening input file '/storage/emulated/0/Android/data/com.test.nativetest/files/ro.txt': Permission denied
> Error opening output file '/storage/emulated/0/Android/data/com.test.nativetest/files/rw.txt': Permission denied
> 
> Here are the mount infos:
> 
> /dev/block/dm-57 on /data type f2fs (rw,lazytime,seclabel,nosuid,nodev,noatime,background_gc=on,nogc_merge,discard,discard_unit=block,user_xattr,inline_xattr,acl,inline_data,inline_dentry,noflush_merge,barrier,extent_cache,mode=adaptive,active_logs=6,reserve_root=134217,resuid=0,resgid=1065,inlinecrypt,alloc_mode=default,checkpoint_merge,fsync_mode=nobarrier,compress_algorithm=zstd:1,compress_log_size=3,compress_mode=user,compress_cache,memory=normal,errors=continue)
> /dev/fuse on /storage/emulated type fuse (rw,lazytime,nosuid,nodev,noexec,noatime,user_id=0,group_id=0,allow_other)
> tmpfs on /tmp type tmpfs (rw,seclabel,relatime,size=5604712k,nr_inodes=1401178)
> 
> As you can see, the only difference in the 3 tests is the tested file’s location. I’m not sure if this related to the filesystem type or I did something wrong.

Yes, it might be related to the sdcard FUSE implementation.

Could you please adapt a bit tools/testing/selftests/landlock/fs_test.c
(in the kernel source tree) and patch it with
https://lore.kernel.org/all/20250704171345.1393451-1-mic@digikod.net/
to check that the layout3_fs tests with FUSE work as expected?
You can just remove the non-layout3_fs tests, change the mount point
for FUSE, build and run fs_test.

My tests with another FUSE FS seems to work fine, but they may be
incomplete, or maybe the sdcard FUSE FS has a bug.

Also, see this patch to run all Landlock FS tests against a specified
directory/FS:
https://lore.kernel.org/all/20250830034753.186551-1-m@maowtm.org/

> 
> Can someone help me to solve this problem?
> 
> thanks a lot.
> 
> ________________________________
> 本邮件及其附件内容可能含有机密和/或隐私信息，仅供指定个人或机构使用。若您非发件人指定收件人或其代理人，请勿使用、传播、复制或存储此邮件之任何内容或其附件。如您误收本邮件，请即以回复或电话方式通知发件人，并将原始邮件、附件及其所有复本删除。谢谢。
> The contents of this message and any attachments may contain confidential and/or privileged information and are intended exclusively for the addressee(s). If you are not the intended recipient of this message or their agent, please note that any use, dissemination, copying, or storage of this message or its attachments is not allowed. If you receive this message in error, please notify the sender by reply the message or phone and delete this message, any attachments and any copies immediately.
> Thank you
