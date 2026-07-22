Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB89440F725
	for <landlock@lists.linux.dev>; Wed, 22 Jul 2026 12:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784724221; cv=none; b=V3TS6gFxJ00Q2PEx5bIQJr+TdaJzyiMzdmcB9Jen7CbmUN7eHr0g9f8+dCLh2cqIM22+msGwSFoJoOmSDHoiDtUcw7K+6CEOaVNKReE4qIXbl5+e6qWR/Zv7J33d+r9p1YGqPWV9JXkV3gDgCqLf59taLZ8LqWD6F9lJ+cipxmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784724221; c=relaxed/simple;
	bh=rOf3yOeoPaV8GbB0UMhEnSZ3ceLJXttM7TqE80KO8Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeGjwJ+cFossHtkp90a6kL0UKdud5x/X7s1xjciwW0IkKeY9eqPtl9pzZ60u398xVIsUYN3qKQzvKtbq/N92zQrw8zmfd2TwOepazkOJdNR9uc5DWwGH2n+gURu1HYN6Ho+lrjQowDLOoKHvTVkUuCWZ41uTf1KzTmOS0oWuUwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eZpzfcU+; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eZpzfcU+"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493f75f7172so97074565e9.1
        for <landlock@lists.linux.dev>; Wed, 22 Jul 2026 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784724218; x=1785329018; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnYnNtKTZhp3m/Ur7bxY+P2OLpfTbrGdAo3NRWVmIRE=;
        b=eZpzfcU+zl9+rlbOy0rSRpw7RObBmMIGXwNT1c1u0MOpY6MNkWoy6xJQZsTDFQmsd8
         S0GUfRcHWwHFbwWeRu88CuvxCi/6mfw/VRyfTLYnsAEgKzwYtSI2rjYTuQcHJSDnRfSY
         j97uNJuqX9m6QH+lkSdbmL9MF7RHBJhZkw/9or8MytXvoEd1gPogf/kScbK+BwOvRlcs
         vycaYVZwUBGLFU3ieR46EpCGawV74gH2+0me+slsLP58sFuOImH9q/qLxJoHMWb36z1J
         XvS6ElATqYbK+/YrwW/5ZdZJ/pNcgHH1hkOY55a0/eCbwEIIobmNgZhYffJb3QEZKJmU
         UvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784724218; x=1785329018;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BnYnNtKTZhp3m/Ur7bxY+P2OLpfTbrGdAo3NRWVmIRE=;
        b=eHi8XQCGo+d0HJGdie2pb2IP+/3H/4zfnliPNzw5KwCTC7sdHe5lhKtbXU/stCwCyl
         H3/pQ394ah9CZNtB7618mlTiZTLkJEThy4RM2mwYaAFRFggfHl6GNa8NhqDFtXiqBnZi
         krAWnbBCxnkWHbeUn+DmwpuJXKDJA09us+DZMybjrykw6l0J/f+OHXZXNMzBoAYvvUqZ
         Een8fuJmGPC7WQ8NDDeRE2OMe+ESnDFbxdw8IYD+H3h5KpdJkDOAxAd9pndcy22jL4Po
         PoBu8+T4hA+sDo1poM+Oa8vIGdVRDK71OB3fmmrlw9bnL6LP92f9Bygmi9XahBQHpFku
         Gs4w==
X-Forwarded-Encrypted: i=1; AHgh+RqDmVpydcAhPDgCCVY++ZyC0InTeOonNAXZrYAEv9QWP8lK1oB5xPNzQxVnVnCJulGRyozj2gEb2A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+K3sBVA34XEctdsG1m/P4zO9dvE4QHNmOMJIas9yKTQ30qHLz
	4c2cxIRpbVMa3Xdy+jwNNXuPt+50PPcJjmuY9zEjdQn6JyYJkAfPKxaMptLJSCvlyw==
X-Gm-Gg: AR+sD13Pp3rnjNDwR3G1NaFvzUIQ+rNH+oBklTshzWb+EWbsoaVHNEoj9gvvEpmubos
	7JVzDo/2aF38jU964HjlBjCPvpCkurF8EPZ2ZT7RAygLCu/77XyiAf+YHcuL10hzf6V5DflHNAc
	2BTrM4FfICQXA1BtmIctLDvlab5DxpdWn8AjEq4hPbaV/naJ5jbk86jB134uhVqy23THV3ukaJA
	78WpiE/PjGbNme553ZicCPLF1xasDvxqWPvBbqyMKW3myq9+NFoow7VmfpE2MtWanh9NyE54Zmi
	+oAlTzmUKcTg/tQSHql8zn8KOEVMewK2u0ttuf3zJY7cwDEJYCDII+OH7ODeYx2V9gFWTY2QWzz
	vb8nxN3cXxIMvsLMZHo85OlsvAc8DwQzWtLIYwDHxEtKn0Vjg9UVWr00RxClxA7SMDEh8USqm9T
	K9Iark4knODQlhaVPaB7+zQ1DEXiCss/XxH9AYt1lTqg==
X-Received: by 2002:a05:600c:1d25:b0:495:6c44:633f with SMTP id 5b1f17b1804b1-4956c4463c8mr23451755e9.31.1784724217695;
        Wed, 22 Jul 2026 05:43:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:288a:8:b091:e7a3:a71:4447])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956a4f9a11sm64818665e9.4.2026.07.22.05.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 05:43:37 -0700 (PDT)
Date: Wed, 22 Jul 2026 14:43:32 +0200
From: =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>
To: Oxana Kharitonova <oxana@cloudflare.com>
Cc: mic@digikod.net, paul@paul-moore.com, jmorris@namei.or,
	serge@hallyn.com, wangyan01@kylinos.cn,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	landlock@lists.linux.dev, webprosto@gmail.com
Subject: Re: [PATCH 1/6] ipc: Move mqueue fs magic to uapi magic header
Message-ID: <amC69LnwcgG7xo-5@google.com>
References: <20260722122952.42149-1-oxana@cloudflare.com>
 <20260722122952.42149-2-oxana@cloudflare.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260722122952.42149-2-oxana@cloudflare.com>

Hello!

On Wed, Jul 22, 2026 at 01:29:37PM +0100, Oxana Kharitonova wrote:
> Move MQUEUE_MAGIC from ipc/mqueue.c to include/uapi/linux/magic.h so
> it can be shared by code outside of ipc/mqueue.c without duplicating
> the constant.
> 
> Signed-off-by: Oxana Kharitonova <oxana@cloudflare.com>
> ---
>  include/uapi/linux/magic.h | 2 ++
>  ipc/mqueue.c               | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/linux/magic.h b/include/uapi/linux/magic.h
> index 4f2da935a76c..8e5d33bb1453 100644
> --- a/include/uapi/linux/magic.h
> +++ b/include/uapi/linux/magic.h
> @@ -78,6 +78,8 @@
>  
>  #define V9FS_MAGIC		0x01021997
>  
> +#define MQUEUE_MAGIC		0x19800202
> +
>  #define BDEVFS_MAGIC            0x62646576
>  #define DAXFS_MAGIC             0x64646178
>  #define BINFMTFS_MAGIC          0x42494e4d
> diff --git a/ipc/mqueue.c b/ipc/mqueue.c
> index 4798b375972b..9515597d45ce 100644
> --- a/ipc/mqueue.c
> +++ b/ipc/mqueue.c
> @@ -22,6 +22,7 @@
>  #include <linux/sysctl.h>
>  #include <linux/poll.h>
>  #include <linux/mqueue.h>
> +#include <linux/magic.h>
>  #include <linux/msg.h>
>  #include <linux/skbuff.h>
>  #include <linux/vmalloc.h>
> @@ -47,7 +48,6 @@ struct mqueue_fs_context {
>  	bool			 newns;	/* Set if newly created ipc namespace */
>  };
>  
> -#define MQUEUE_MAGIC	0x19800202
>  #define DIRENT_SIZE	20
>  #define FILENT_SIZE	80
>  
> -- 
> 2.50.1 (Apple Git-155)
> 

The only reference to MQUEUE_MAGIC that I find in your patchset is from
Landlock's kernel code -- For a value that gets serialized to disk, like
for the other file systems, I think there is actually a legitimate use
case for userspace to use that value, when dealing with raw images?  But
that's not the case here, I think?

Should this live in include/linux/ipc_namespace.h instead?  Or even be
exposed as a helper function that lets you check whether an inode is
referring to an mqueue?

—Günther
