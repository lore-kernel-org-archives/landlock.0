Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D401A63DF
	for <landlock@lists.linux.dev>; Tue,  5 Dec 2023 06:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGLxcZV9"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-54ca339ae7aso2868727a12.3
        for <landlock@lists.linux.dev>; Mon, 04 Dec 2023 22:09:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701756550; x=1702361350; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cJwZKf9lPeV+36ZA+RdCyyrn7yhr0tXP2JSZv2brSg4=;
        b=DGLxcZV9YFO2tA8i390y7epGYb9bxL7zkE0y1seznkdnsNYXbs3DllU/uxbWRAKOUt
         ihUBdOqZHWUYqOnBTOzIYf7YDsyGVHTS8BBavDlJ8r3mXn/NmzwcX5EL9cSS4ln3S3fn
         NvhzwQyoUPjkgWHOlf+upOHmS+hOYM2sq8MHxET17xBmF4tOq3CT/ybSCO9R/9dStZrP
         82VWLcfHuhY/PgLhgXQxZm+9ALu9dMrP4oRfkHeeFH84zRg0ylZ8IMrzUw5pp+ZPxdXK
         oyoVdWJtgFulcsZVo4+OJ81WmVj3LmZATQpxc6RE1XebKFGsQR55eBgx+eP+aXWNIo9J
         TEhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701756550; x=1702361350;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cJwZKf9lPeV+36ZA+RdCyyrn7yhr0tXP2JSZv2brSg4=;
        b=MZ7GEyvu1McOD2OlGQnXcBWuwKNp3wyH7EXlgxgcoIb+0+9mRc6Rzmrxugp0Lmq6+Q
         GAjsRnK+di42Fw3nmRONlkt1judllzVQmdiKCJIy4BiZExHoP4AYJXtVfziV10Ci8kfp
         LyxV1riJFn4LM6vIbUtGLjHE94cUL7ylMs2A1LWi+AnnrZ4MYJDx5Z8rWwhFzabLg+7W
         QoEEWE4A4+ky/nCvK+VBRvFH14zrrz8kdxx/7HZcje6AsSFVZq5TRbuDIrq7YCTiCm2K
         2J3+Pza0b9h5viwOSvRZ+D2nh40nNpLHoawo8vQolBQH8nrmd5pcqlBEcifeNeE3L177
         R6fg==
X-Gm-Message-State: AOJu0Yze1ZzMTzGikGl1geMpK9rNxfa+paP1i/FSfA23nK8YrlU3qZ+e
	KAJv50C4776W/qJi94MhDRA=
X-Google-Smtp-Source: AGHT+IFrh4GHu8LOP5I5BpQLbT0NFENyeUGrAGO1HTytPMW9toMIiJVKsgj+VymcDYktoZ6UntZyuQ==
X-Received: by 2002:a17:906:2a05:b0:a00:b4ab:cb6d with SMTP id j5-20020a1709062a0500b00a00b4abcb6dmr4027207eje.69.1701756549717;
        Mon, 04 Dec 2023 22:09:09 -0800 (PST)
Received: from localhost ([2a02:168:633b:1:9d6a:15a4:c7d1:a0f0])
        by smtp.gmail.com with ESMTPSA id p4-20020a170906140400b00a1b61096ce6sm2847829ejc.129.2023.12.04.22.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 22:09:09 -0800 (PST)
Date: Tue, 5 Dec 2023 07:09:07 +0100
From: =?iso-8859-1?Q?G=FCnther?= Noack <gnoack3000@gmail.com>
To: =?iso-8859-1?Q?Vin=EDcius?= dos Santos Oliveira <vini.ipsmaker@gmail.com>
Cc: landlock@lists.linux.dev
Subject: Re: Landlock support landed into Emilua
Message-ID: <20231205.2bd704a93e21@gnoack.org>
References: <CAK9RveLxro4zUG4jfFB=UNgcv5gdc8JuzNhMt=YbNhH=35ADzg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK9RveLxro4zUG4jfFB=UNgcv5gdc8JuzNhMt=YbNhH=35ADzg@mail.gmail.com>

Hello Vinícius,

On Mon, Dec 04, 2023 at 08:55:41AM -0300, Vinícius dos Santos Oliveira wrote:
> Emilua 0.5.0 was released with Landlock support:
> https://docs.emilua.org/api/0.5/changelog.html
> 
> Emilua is an execution engine with support for async IO for LuaJIT. It
> allows the creation of concurrent Lua programs. It also supports
> running separate Lua VMs for extracting parallelism.
> 
> Starting from the previous version, it added the ability to spawn Lua
> VMs in their own processes isolated in their own Linux namespaces for
> sandboxing purposes. However Linux namespaces are too convoluted and
> it became clear how inappropriate they really are to just create
> sandboxes.
> 
> Starting from the just newly released version, Landlock and Capsicum
> were added as alternatives to Linux namespaces.

This looks great, thanks for sharing!

I am not very proficient in Lua, but I a appreciate your well-written
introduction into sandboxing in your documentation (and also that you
are quoting Xkcd 1200 ;-))

Please do not hold back feedback if you run into any surprises or
questions!

–Günther
