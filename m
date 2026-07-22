Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9030735C6AC
	for <landlock@lists.linux.dev>; Wed, 22 Jul 2026 15:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784733286; cv=none; b=DuGKnVfxHILL8h4C0qInVwX+CNkIel1nbxqxzPgWAwjLTgkOMZjN0L64yla6tkIQ9umZTsrEcxVwSz03PtLM3j65Uv/BKgBQmLAzAXSTyeDyZarQqg8TlXA/+QELxsQ5gJmr6ktKOzbXwo/10bw7aB0XO0xRBiWf+IGdBi8jrFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784733286; c=relaxed/simple;
	bh=uWVSmITDaDOGcqPPhpjJGoP4+QNUe0r27fajCJAPzQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TAdcPv+Dno0o4T2SyopFGN/W/iQdILksEe+Su8M+eQ/jF5mJ/nYr/Vg7Za8FolAMMsyap+66hd7EPt/PZUpp0a7xTqOUC0ZSDVAIdQd/R5XRCW0jyZNUT7BRirsJuX8O6/LoXSyY3GLRTJ8Yr0nJyqLIkQ+ISb9xgpQGCTt8IaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=QGrj5rRM; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="QGrj5rRM"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-698ae09e356so17340951a12.2
        for <landlock@lists.linux.dev>; Wed, 22 Jul 2026 08:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1784733283; x=1785338083; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FpirftYM/AXiBsGItonV7B2bYW2GExd8EOWH3f0NLiA=;
        b=QGrj5rRMuH/1dnEPQul/OmEDBe6iZVkVP++9peZXn/vKW9yZISd+OVVUra9FGEPKD+
         oZogKeSUv22mM8XYy1vYXJ4oGx++/P+YrhXX9bKFVukg6qDyOI5pjqxPEuu6+uzOgAZN
         RtITfCqh13xb7zfgJUVWXItlBVJ3/wzadhviNW9q92OoQ99Md0bEYxF9szahluYCVBlM
         Neof0AyDkDpL86EFoakYEXCoSgerkSx9Bi3WTwuysPRCuejBpb4tSmG8WIAzfiSKHn4w
         Y2vUbR6Oxd6Gz+Vz6gGOxb1LfU+oVVDJcdvjOX9jpBFx8ebNgcW2U0d1vzTiVCtOdpcv
         14YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784733283; x=1785338083;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FpirftYM/AXiBsGItonV7B2bYW2GExd8EOWH3f0NLiA=;
        b=j7uWoyZPxJgPMiEiV3QHLY4x8S7crOq1rhVPC2oaM8vG7KZ24WDCyLjAWd5hCo5mQA
         pawWRZnOgtap1YKzqAHk0dcpRPvk6S4YpnJhCw9irFewWKlSd1L8t047C44F9ZTfW1L+
         8B1IbOG196PivfnUWBPg8Kq6Rfd5Ot1aDi9zOafCruparVgbi1fathtk+LRJkRMbbb6R
         fw71Git54hfZknwUMcG4w6VPT5wHwEqAnpeMRfJGCPomXhIP2k54c7hZXrJU7+Lvoaxt
         OhIjf7QsKTQqhHTUxwMhXb0JU9jhctypEQVIqwyzU3aXGDn8OPwUhrnjKaWKcRY3zGWz
         z1bg==
X-Gm-Message-State: AOJu0YwG4kmK50jRaQUx1VhzEfwa0RsBadi3xhtlrK6FZLeStDBQ59Px
	ZBCEjk4sKX74iMH5tfIwcsUbcCUF7QlPdtzGbV6PMQ9goWMHVYLRWzFps3Ed+YJnKFA=
X-Gm-Gg: AR+sD13ylL1RAEwGwtj34Z8bwfkGzA4VdZ/0kjRSBX7ohA5PHm7Mnf3PEHdYeyMjl7C
	Q+Z0UPjXoLDcxApEjpsI+/jwBskNsCfTOE/AjJ/KZxMAc4zsS13IORUxyrNXaKcpehi2LjAt7zl
	iwRea39SM4e/bvKPbRalmS5Ta8Zx+cekmwTGJqgPhkoWFZbANB4LveRe6y9sgym1ybzToNhTEN1
	8diQ3Ony4dsPbDdbpaOwkd2u9oYs3l2BQCpyQaWFcPyWRi/B3o0DjDND2FsKJIx4JdqkHwJx2Bk
	2kwEHm2llSRhZIbq9s+QgpavHtMEvkTTgwwOsrkCE0f0yEk0+i97Qhtza9G8p6cVyviRFgW6C4z
	PzJlmyJyQRx/U6Ce48Bw0zlrgsg7JjyAE9W5rlUBtaEYLdmwHHNo6Z7HxbN3H6s0=
X-Received: by 2002:a17:907:3e05:b0:c16:1655:309d with SMTP id a640c23a62f3a-c16b4868dd9mr1149194566b.56.1784733282760;
        Wed, 22 Jul 2026 08:14:42 -0700 (PDT)
Received: from DW927H4LGF ([2a09:bac6:37e6:1e5a::306:4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f11af2sm122985066b.57.2026.07.22.08.14.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 22 Jul 2026 08:14:42 -0700 (PDT)
From: Oxana Kharitonova <oxana@cloudflare.com>
To: gnoack@google.com
Cc: landlock@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	mic@digikod.net,
	oxana@cloudflare.com,
	paul@paul-moore.com,
	serge@hallyn.com,
	wangyan01@kylinos.cn,
	webprosto@gmail.com
Subject: Re: [PATCH 1/6] ipc: Move mqueue fs magic to uapi magic header
Date: Wed, 22 Jul 2026 16:14:23 +0100
Message-ID: <20260722151440.51298-1-oxana@cloudflare.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <amC69LnwcgG7xo-5@google.com>
References: <amC69LnwcgG7xo-5@google.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, Jul 22, 2026 at 1:43 PM Günther Noack <gnoack@google.com> wrote:
>
> Should this live in include/linux/ipc_namespace.h instead?  Or even be
> exposed as a helper function that lets you check whether an inode is
> referring to an mqueue?
>
> —Günther

Hi Günther,

Thanks for the feedback. Agree, better to move it. I'll check how to do it
better and include in v2.

