Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841DD14F9C
	for <landlock@lists.linux.dev>; Mon,  4 Dec 2023 11:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JVaE/E9A"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-50be03cc8a3so3130413e87.1
        for <landlock@lists.linux.dev>; Mon, 04 Dec 2023 03:55:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701690957; x=1702295757; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hS0xMudJo4aE9yIwGigy+FlEwijf7u0akAKlmPNC6eM=;
        b=JVaE/E9A7Vgze3KVPrE9GMhHk4zkSEGi3CAzc/fUjRX3n49NC4SpExqwB757ZEW2Ui
         2MtlNpRwHIMCeIVJZjat6yzpPd2pZEb/70hbDnEO3f/+utV2bYLWqm1LW5Bl7uFVMO1h
         Ln5mPCwB1o3JqvzavaJFR8pldXmMD1QeASNavXxamqWILV3xjWVI/d77e4UmJ60zQ6gW
         NP31vwQF+x+sWQESvLg0B2VKfns/Pcc5obcQnONMwItMYM64BoWVjPXHuKLKuvUR9+Uz
         Hvs8aYU4G83aPSeWTUY5MCOf6LG5Qrgx9Ln2hXDksfALKJ+co5p27XkckC0uKg+oWOaI
         9HcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701690957; x=1702295757;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hS0xMudJo4aE9yIwGigy+FlEwijf7u0akAKlmPNC6eM=;
        b=nP/f6h06iHX9YKSvns4R4w4E/Tzz2U/gDTreTWd2qwVQfbK06EV5ktAe85ctgSFdaj
         xWrA5QEBNA3Ii1YcHcozRUba2MTolv3tsftcDIAl4EFhAUAskpf0CV8P3v9yZHX/aIun
         /wGMZgQiLt3eZ1ytt1jabY1RnlcOeIOtpxpb4l3NBeDjQJEuvK5em1obd/JrKjIskylk
         Xqd51/yKr35DR953+weya80ekN9oMIfIW7fbQk9BvEvQXFAyN38iDGpPyVEcC4Ls56JM
         +ox818IOODAUAsDvKBIsG6ljn7GQVnRc4QuQQOFIXEEOUy7TgQyFDnV5JVMdtf7vaxBy
         A6uA==
X-Gm-Message-State: AOJu0YwpK5eOYmG/ReuFQmhGom940vC3TSSp7Zu37XVwoThdO65Wkvyp
	1wLkpQ2qVQqqgXWJPt88T+QV3BSqn/mxWBpD+kyEozWw+Pc=
X-Google-Smtp-Source: AGHT+IH5A1OYzcBM/4LWLuyA+x4g42DDJuTLOL032N8k1eXPaNKiG5wrU1hCRP+4d4LJp4i1qUBSk2Yj0yr2TleZFbs=
X-Received: by 2002:a05:6512:6c6:b0:50a:72e6:96c7 with SMTP id
 u6-20020a05651206c600b0050a72e696c7mr3129615lff.3.1701690957099; Mon, 04 Dec
 2023 03:55:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?Q?Vin=C3=ADcius_dos_Santos_Oliveira?= <vini.ipsmaker@gmail.com>
Date: Mon, 4 Dec 2023 08:55:41 -0300
Message-ID: <CAK9RveLxro4zUG4jfFB=UNgcv5gdc8JuzNhMt=YbNhH=35ADzg@mail.gmail.com>
Subject: Landlock support landed into Emilua
To: landlock@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Emilua 0.5.0 was released with Landlock support:
https://docs.emilua.org/api/0.5/changelog.html

Emilua is an execution engine with support for async IO for LuaJIT. It
allows the creation of concurrent Lua programs. It also supports
running separate Lua VMs for extracting parallelism.

Starting from the previous version, it added the ability to spawn Lua
VMs in their own processes isolated in their own Linux namespaces for
sandboxing purposes. However Linux namespaces are too convoluted and
it became clear how inappropriate they really are to just create
sandboxes.

Starting from the just newly released version, Landlock and Capsicum
were added as alternatives to Linux namespaces.


--=20
Vin=C3=ADcius dos Santos Oliveira
https://vinipsmaker.github.io/
