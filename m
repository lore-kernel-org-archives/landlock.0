Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB12B47A89B
	for <landlock@lists.linux.dev>; Mon, 14 Sep 2026 14:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789395133; cv=none; b=ivWa5aqag8RRLhwuV8jPadAtaBzzn8Tnf40AN8NfZYJZUDQw3XakhIxcxQ7kCiz9ggnlrX5HiUBZl81wojUSeFTsM7LdQwnZzhBTgNzSbdGXLqQZNwt5ghYtVmZZgU2HtMnVipmoJiwiMPT5nPiKBD3Ah2IVMVlOIbYGe6c21BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789395133; c=relaxed/simple;
	bh=FYgE/qMDYyeMl2lVwY7dAtgyDXOfNxxwb4+vbhAhdRk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=laC+cPzteply4qcZUK115CtjH+7kg7xWujZxgQfBwUH4/LUcssLqQbbA/DdyORB6i8v6IjK2zof7U24A10YxzXHRLTuMofi9KhNLBlOyLePdjvauPAniDdua2Ta5D6mBNX1qhcod/Zh3yB1nUUAKF79sjHfSP+VYOe1rDoht0nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k2RZGR19; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k2RZGR19"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso12021685e9.2
        for <landlock@lists.linux.dev>; Mon, 14 Sep 2026 07:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789395119; x=1789999919; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ucveROnBiD9Bvg19k0xNDw/2fESh5irWztcJl/INm4w=;
        b=k2RZGR19WugnGl/MTY/rfpe4de57Dz78WYQs3vtmYB6FiEbc2+GpEQbFPUts7iQ5Hi
         aHZ2fl4aZVAuejy920RmTCYrmWUdff2NQMAgvmXMC/syNJU9+pUA3JIXSKQRdvY57uq3
         DWy/AcVLWbfYCtyE4AunR2AWFvtDZLmB7G6VfwDEdX1MnJkHNB7+VPuD3Q/fuFoeFj/2
         1saO7vvF7adTOT8hONfxDdq6WHH+THX2Lf8Y3tXKframPxFJzl/QBaD2uU1uXQNYjYGP
         c1DSwaM3oPFoEy8ehLVLPj3kq0gSs6AMtYYe/ENUZAFQ7YXC8X5RAU4Y5BWdP5nI8Xio
         94yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789395119; x=1789999919;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ucveROnBiD9Bvg19k0xNDw/2fESh5irWztcJl/INm4w=;
        b=EdAC3WyPtGGCY/43qW+xTiLD3DxYoK5RBMsQzW1DIiXH2Pc/ZLQrvZr3W7LELsN5i3
         80q5DMNx7aHATORIsOztjIWMvrcj2zKbwg27eWIy3F8taHBy1erW5MRAlN8yEQtqpQVn
         DOaLTc0HWKy+BPG8LEgAfq2gCdK+8+KSUb4EDkPDXWBpOB+Kb5s1z2jb8VOeHAcH4vvM
         WnauxI8MxpSBDhcBn8P8bfBd4pJ7Ic4RyReBYeF5sNU9wK2Y2vogZg+M+CfN8+7bgzWd
         E2HldF+Ax6u8GQs2uxrYxJVnCxBSTDeeruiwk7hJYpaeIDN4zt8weNkQ9J1DsuHzmb25
         l+Hg==
X-Forwarded-Encrypted: i=1; AKwUvBwLLYnX3YiOgl2Nh3HCItJ2vPkLaErGPEND+396absXeSrx1TOvwBGj8As+5MaSKGeVt3Zqyp0XKg==@lists.linux.dev
X-Gm-Message-State: AFuF++klsXXXVKDys1I3ocOSxyeygINu41oV8sNS+Ct5eA0s8jQjNeh3
	e3V+/WEv67VRkcYBdPld1RdbDNIDdBbZnpQ9uvzUrJ5kdkOJX1uOIgK4
X-Gm-Gg: AYBFou26/rx94kecXILkTx/E0A8nOSMGMVVs5FX4MlR6qO2y5oHNX16YY3iFdq8/llA
	oJlNukPcqgDr0UA+vGEimtMH3TuST0qBuXX78gTO5QJDqX92My8JY9RupLPgXjo0ftrDI5pLlI5
	CiVrrpbdmrtC1/Bp2YjAcW2podEeWK/VzsHrmWbf/5PuNNOpYj3hbzV2sCNZhIQZy3pxzO8G5hd
	d5FUA2qJCYiTHuC09lh49AuPLhWfhsKnkcKTkIZlSiXlHwA6CNdQyc6wutKcvaF7tKjt01yX07t
	Zsz7wYMvRMRzlqyRm3RQRwqWVgDuwX5SMxJNN66kiKQXwbRdRmqQMHDLiPK+xOhKjQC5wAfQbHZ
	9cX411hdMvRZgfGqoK/O8goIDSJCyUmTspjvmj+gqlIkZKyjD5icqfxYNx79xWp9ki63WitKqq2
	M2Re+ECOGbrpdDzj1rCT5zuvomjbAEZ0R8neRKTWZ9O417hwwzT0TfXPHApCUBbqoVgvz4Yn3Bh
	pO0+w0+UVs=
X-Received: by 2002:a05:600c:3b9a:b0:49c:ffde:45ff with SMTP id 5b1f17b1804b1-49e7a66b656mr33565995e9.17.1789395118802;
        Mon, 14 Sep 2026 07:11:58 -0700 (PDT)
Received: from penguin-ubuntu.lan ([2a00:23c6:6405:9301:838b:b854:bb11:52b5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e63c9a7c9sm535965175e9.13.2026.09.14.07.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:11:58 -0700 (PDT)
From: Oxana Kharitonova <webprosto@gmail.com>
To: gnoack3000@gmail.com
Cc: gnoack@google.com,
	jmorris@namei.or,
	landlock@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	mic@digikod.net,
	oxana@cloudflare.com,
	paul@paul-moore.com,
	serge@hallyn.com,
	wangyan01@kylinos.cn,
	webprosto@gmail.com
Subject: Re: [PATCH 0/6] landlock: Add POSIX message queue scoping
Date: Mon, 14 Sep 2026 15:10:23 +0100
Message-ID: <20260914141156.258282-1-webprosto@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821.d42cd4b82f91@gnoack.org>
References: <20260821.d42cd4b82f91@gnoack.org>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Günther!

Apologies for the delayed reply. I took some break. 

Thank you very much for the detailed explanation and for the 
test program.

On 21/08/2026 09:46, GÃ¼nther Noack wrote:
> Thank you for sending this!
> 
> I have a high level question about this patch set:
> 
> You are adding a check to hook_file_open(), but the existing
> hook_file_open() can already prevent mq_open().
> 
> The following experiment illustrates this:
> * Restrict LANDLOCK_ACCESS_FS_READ_FILE and LANDLOCK_ACCESS_FS_WRITE_FILE
> * Try to run mq_open("/foobar", O_CREAT...)
> 
> Depending on the installed PATH_BENEATH rules, you now see differing behaviour:
> 
> * If we allow READ_FILE and WRITE_FILE on nothing, mq_open() is *DENIED*.
> * If we allow READ_FILE and WRITE_FILE on /, mq_open() is *DENIED*.
> * If we allow READ_FILE and WRITE_FILE on a mounted /dev/mqueue, mq_open() is *ALLOWED*.
> 
> So it seems that the existing file system restrictions are already
> preventing POSIX message queues from being opened?  And not only that
> -- since such Landlock policies are already quite common, it seems
> likely that many existing landlocked programs are already restricting
> opening of POSIX message queues today.

The additional check in hook_file_open() adds a restriction for two sibling domains
created under the same parent. If both siblings share filesystem
access, but must not communicate with each other through POSIX message
queues, the scope check prevents one sibling from opening a queue created
by the other. 

Although I can't say how practical this use case is. I see that it adds 
additional overhead for non-mqeuee files too, but it doesn't seem significant 
as it only checks the inode type and mqueuefs superblock magic.

If you think it's not worth it, I'm happy to remove it.

> So, to clarify:
> 
> * What your patch set is adding is only that we are now additionally
>    taking the Landlock domain scope into account?
> * This distinction only makes a difference for landlocked programs
>    that do not restrict READ_FILE/WRITE_FILE or that do restrict it and
>    then allow-list READ_FILE/WRITE_FILE on a previously mounted
>    /dev/mqueue.
> 
> Maybe this would be interesting to clarify a bit more prominently in
> the cover letter, because it reduces the applicability of this
> patchset?

Agree, I'll add more details in the cover letter. 

> Attached below is a LLM-generated (but double checked) test program
> which you can use to try out the creation of mqueues.  (As first
> argument, use "-", "/" or "/dev/mqueue".)
> 
> What *might* still be interesting to restrict though: While mq_open()
> checks the READ_FILE and WRITE_FILE rights, it checks none of the
> LANDLOCK_ACCESS_FS_MAKE_* rights -- the message queue gets still
> created, even when the mq_open() is denied and returns with an error.
> 
> To expand on Justin's comment in [1] -- it feels that there are maybe
> still some gaps in the "lifecycle management" of these message queues
> that might be worth thinking systematically about, because both
> mq_unlink() and the creation of the message queue entries are
> currently apparently not restrictable yet?  It makes me wonder whether
> hijacking of message queue names (creating same-named queues in other
> Landlock domains) is a problem then?  Do you have thoughts on this?

I need to think about it more and check how the mq_unlink works, taking 
into account the comment from Justin and Mickaël. 
I'll follow up with a more complete answer.

> 
> Thanks,
> –Günther
> 
> [1] https://lore.kernel.org/all/amKDYoOSvHMzVbKX@suesslenovo/


