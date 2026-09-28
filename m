Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A24E433A
	for <landlock@lists.linux.dev>; Mon, 28 Sep 2026 15:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790610607; cv=none; b=CjcYM/qmD0Q12xNyqa7PJ6VVfDMrjfb3BUsf3UONJiZgJV6yHtorHdJ5ZitRE+eGIC1DDnQ0Rp0snGtqOeQ+VHp/L+hE6+QcaMGKErcQNlfPYO1YtF76WkzDq87nv2J0O0/CD2+mItaNFg2f1n4y86fBPmPi2CFP+LUrCcabtcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790610607; c=relaxed/simple;
	bh=eK/eJ3hguVN3HC5ZratOGBwPh0MmUBHZAM2stBK3p20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QPk1x60RI7LvkSHPCo9xF6mcNhC4+YT6WsEpbmU0yTk5vix61Zwaui14tAocFKI/UkH/RSxtLtVPC6B1itpfUXMZ/vXNL63A7DRKrEP+DYGrEYTvx4dlLXpD92aOmKjKgeY7oSQJucBQOz3t3VChVGaltMYuD+o/RjRjE0CprBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmXbRgWi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmXbRgWi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd5462b69so18430155e9.1
        for <landlock@lists.linux.dev>; Mon, 28 Sep 2026 08:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790610604; x=1791215404; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TUupXe47hKEwtrJAakpSRuAqpv3FGIO9UcE3gl7qRpw=;
        b=JmXbRgWi8bxIvzEBbS7j3PL8alYaPWxiAMTrRJCxzFE0cUo35tzYHRA9Gvj5XEWENo
         x2oRthp0y8C8ED7wx8LUN2B97s1g1F2XVp4Gixt3k/mF84Bectaf8yE93qfZAGOC8h+O
         3wvwb74sRM1zhOnTe0n2bdMLkWG88YvwhBVEqkaMg1LXZ2/clrTn2czWsmGlROKxXBzp
         fGFnNT5gmxBHFy9xcsWPc3oHenq/ji/IBvmod6gHhJCOCnv7Zp2Hqd/VmqUCjDZdJkxo
         EHxA1PUHc5PkJ14Yys3SXLNgQ7DSJvRdbMPDXB2JIzrHdWMbAhmNhO/mCeM9cNXwaa7n
         hfTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790610604; x=1791215404;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUupXe47hKEwtrJAakpSRuAqpv3FGIO9UcE3gl7qRpw=;
        b=q5q6lyPLh50fErD7H+vV6hAz9mGOv7xK8glEDJcWoVgPSlG9wrYuhpExk/wa6lIqlY
         qaTfiAZAkH2oDZdi6+8SJjl7eSr9nnxfMGJhuQ3JHtgznR17FHbo9mfTNWnNXwbC5wRu
         2+P9L6jyyGA5yEWPI+w4RSPKXCfgIiGqrUqO945XfIMW/XYHNQ6R1dbi14+m/C7OSszD
         q3MEKtj5nadutaoiV1+niDIKDD/EhTASEqlheJWaVpnJ5PFKK7CosHqscqK9BUKj/cew
         NAkGor7cRu+34TO8v8kAkaJT789hAqSmaYG5V+MlTnzlcnMBbS/HdnSD29EbyzD9QJy/
         OXfg==
X-Forwarded-Encrypted: i=1; AKwUvBzxexknTRz7lNZ8DUslXdAGHtYH/9UYnwCMmlZMMhMN47me+5HL2DJaBPWIhsD9kGlT5vhy9ShcFA==@lists.linux.dev
X-Gm-Message-State: AFuF++kDF1H/3LGSyo/HXA9Eg1kndZ7VoA1+XZ1AJtPS4NpbPhoZX+ut
	Y8UfsPnWJxPAc9Svh55Ph4tHyDC0pxsrn0rmr/S4Q2bDlG6o3jR27LFM
X-Gm-Gg: AYBFou2QmSlMPYvZ/hDK2dW2kAaO/ejtgJJLmZRA8wjZ+YgtTJIgKjp6L1X4u6Hwlii
	wfMBvBxkJLL81/sQnhYTaw1+FilY4F0UmlqXjpPaBIMk8QhvleuUJjXLpRe/qwt8CXJVnLGU2m6
	op9wWdsr2gAcJw7c+H3iYALSMRW0fNdfVEpvSotwgTt1pac9tiTz/v7rU7Hn5NKXLdlDplrzCSX
	DKJOJirE3XUjjISNcwBsRtXN3uYs6yZnE5mV4U7tGMVje/bwUKdvebFcqsmrykEKVgQQuKQZfHb
	YVpCqLHcUAd3WP6BG1p7KMAxB3PS8982ClUxfGdxFeM7ndZgWAQB441yBz8pYOWWnyG4mZ71JKw
	dMGtpKX5b0z5mIHy5NLRR6UAIvhFQWI0y95Cz79QZ/RFM0HKmIOlJnbqKRPiVRUdGyvIDzVQ6Ln
	tiTFokG2yRvy39hjQKAsbRE1ok+4Ay4Ba/MtnvgO5xeluXxVK8MEdtV07YLF8eLSv9e5jjBtnVc
	mcDGPk5ztlc7INtxoYI
X-Received: by 2002:a05:600d:6402:10b0:4a0:c01:1902 with SMTP id 5b1f17b1804b1-4a00c011a5fmr9990865e9.2.1790610603593;
        Mon, 28 Sep 2026 08:50:03 -0700 (PDT)
Received: from penguin-ubuntu.lan ([2a00:23c6:6405:9301:5b51:b317:1deb:4845])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a354c47sm29772532f8f.15.2026.09.28.08.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 08:50:02 -0700 (PDT)
From: Oxana Kharitonova <webprosto@gmail.com>
To: webprosto@gmail.com
Cc: gnoack3000@gmail.com,
	gnoack@google.com,
	jmorris@namei.or,
	landlock@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	mic@digikod.net,
	oxana@cloudflare.com,
	paul@paul-moore.com,
	serge@hallyn.com,
	wangyan01@kylinos.cn,
	utilityemal77@gmail.com
Subject: Re: [PATCH 0/6] landlock: Add POSIX message queue scoping
Date: Mon, 28 Sep 2026 16:47:34 +0100
Message-ID: <20260928155002.742984-1-webprosto@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914141156.258282-1-webprosto@gmail.com>
References: <20260914141156.258282-1-webprosto@gmail.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Günther!

As promissed, I'm following up with a more complete answer.  

On 14/09/2026 15:10, Oxana Kharitonova wrote:
> On 21/08/2026 09:46, GÃ¼nther Noack wrote:
>> What *might* still be interesting to restrict though: While mq_open()
>> checks the READ_FILE and WRITE_FILE rights, it checks none of the
>> LANDLOCK_ACCESS_FS_MAKE_* rights -- the message queue gets still
>> created, even when the mq_open() is denied and returns with an error.

I revisited my changes and noticed the gap you mentioned regarding
mqueue creation. Thanks for highlighting it. I'll address it in v2.

>> To expand on Justin's comment in [1] -- it feels that there are maybe
>> still some gaps in the "lifecycle management" of these message queues
>> that might be worth thinking systematically about, because both
>> mq_unlink() and the creation of the message queue entries are
>> currently apparently not restrictable yet?  It makes me wonder whether
>> hijacking of message queue names (creating same-named queues in other
>> Landlock domains) is a problem then?  Do you have thoughts on this?
> 
> I need to think about it more and check how the mq_unlink works, taking
> into account the comment from Justin and Mickaël.
> I'll follow up with a more complete answer.

Regarding the lifecycle management of POSIX message queues, I haven’t
found a good solution yet. I experimented with test programs, but the
main constraints come from the POSIX message-queue semantics. A queue is
independent of its creator’s lifetime and remains until mq_unlink() is
called explicitly and all open descriptors are closed. Its name must be
unique within the IPC namespace, but the same name can be reused after
the existing queue has been unlinked.

If mq_unlink() is restricted for a process, a stale queue could remain
and that process might be unable to clean it up. This seems to be the
concern Mickaël raised in [2]. However, Landlock restrictions apply to
the restricted process or domain, rather than globally to the queue, so
another process might still be able to access or unlink it if its
permissions allow. Therefore, I don’t currently see how to restrict this
correctly through a Landlock policy, other than documenting the
limitation. Let me know if you have other thoughts or I'm missing
something.

>>
>> Thanks,
>> –Günther
>>
>> [1] https://lore.kernel.org/all/amKDYoOSvHMzVbKX@suesslenovo/

Thanks,
Oxana

[2] https://lore.kernel.org/all/20260728.Heephie1tai3@digikod.net/
