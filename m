Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77213BB50
	for <landlock@lists.linux.dev>; Sat, 19 Oct 2024 14:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729347919; cv=none; b=oC4y+rCdpyRSR3ON9Hoj+tpmz6yXuKwoCp1H32GESD/4bl/eLWeZuwqa0iIRjfGvGDMs1I2DexQlLQ6hokUlg1CVOJ8bB86gyKpfML76MHM1GO0TOh1xTY39WL9yZfP+YVMKb4vUeOwcJ30ST1tc0hvXqTkxS9+aX+KxQi2nZDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729347919; c=relaxed/simple;
	bh=2BaFsMcSxZTCsocLuN/St9/nXAaOs5iWsKIibvNcAwE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=NJU9UwafykUWIThQcjBnIKrVapQQSZuWwsRNJytDBnN75NATxg+vZIHi4onV64WANYu0yfEaofVGFCFzUvyaYmLRblwIslRfQRL647CUXK9pGdDGrDW4/5kartxRyFrB3bJQtRJDOKGZctck4HZdlEmSMrUuGxH8Ww16BLULpzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LvC0Olce; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LvC0Olce"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-53a007743e7so3742708e87.1
        for <landlock@lists.linux.dev>; Sat, 19 Oct 2024 07:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729347916; x=1729952716; darn=lists.linux.dev;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2BaFsMcSxZTCsocLuN/St9/nXAaOs5iWsKIibvNcAwE=;
        b=LvC0Olce/4k27lrw+Sq236PsMZ7iNcX3aBqTy+8kdxn16lS/bKhl9M6yNMZ8ksZ3tP
         rj/v4JpUYXZPnkR4yx2z20ZQeg53ffzRZgmqIm3a6hEQxZzS4vvFgKqoFF9vDQB+DORp
         BQwhfStB4qCQJ+bcgKeBgtFJvG7t300jSlfPm2ypdvpe5zk9eZ+OZYz/RPnvimkSNQ1z
         OWrISzAfh0cZw/0e1dRk0iRptyHGy3IH6UUbGeundqU/BfLPKL7LpDl+Lu+xspHQNK9t
         tdSchC0IDFuUKmhe7bzol7HNAgHPsyH2Hgq2t2BkGMyidt3EcgY0gPLcdfAt3VHZujxN
         8XBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729347916; x=1729952716;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BaFsMcSxZTCsocLuN/St9/nXAaOs5iWsKIibvNcAwE=;
        b=ayc0u8NwP1apOJ4CFnXaPLgVT49eIEB5Jayt8FnTSirH18a+TcTQ/UMFCCd0SX6UpD
         m+GfeYNC1KYtF4cbuBY4SeFAHs3ckeetMu7YT2mMGXV72bwplwpJcV0hBN/OXhCx7UYF
         5h8LbQGDLIxl1jQQYjvLxmSlUSvKNJ5RcZ7PpauqWdDTJrWL/JWApEg6+oJaLH/U1nvd
         b2KRL7bKG0Od1Hfjx9KWHzJBntyOwa2G/JolJE24yLNNdK0yLWejjhdeu7gBd2ESVJE2
         8vqvGdMs3rRO35cYcmboDBzqbdGBOgC/nxWMPUXXsWQYfKNX19xl5/JP4q/aQidQXSh3
         V6ng==
X-Gm-Message-State: AOJu0YzqDeGtnpsoUUNjo9S3eiIexTJoOF4XWLEGOf0NZjvXQS9f+Ly+
	OKkAbQyJeYU/TFOhTdDnZyIu4ktI9Y9EmuOJOangqVceh2vpgFiKSvqOXcW8fvmRZ7en3CGonYJ
	+IbYwygi6or0Ky55bqFZKayd0l/UzjAuu
X-Google-Smtp-Source: AGHT+IFcF4oBbYTdO0weHSPEfkduklKGzvjUx35VQ441ydzWcHmuIiBmNK9YIjGyRbWlj61IKtQ5PkvEGjCEqE5cNyc=
X-Received: by 2002:a05:6512:b89:b0:539:e98c:c33b with SMTP id
 2adb3069b0e04-53a154fa775mr3466241e87.41.1729347915378; Sat, 19 Oct 2024
 07:25:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: landlock@lists.linux.dev
List-Id: <landlock.lists.linux.dev>
List-Subscribe: <mailto:landlock+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:landlock+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: =?UTF-8?Q?Vin=C3=ADcius_dos_Santos_Oliveira?= <vini.ipsmaker@gmail.com>
Date: Sat, 19 Oct 2024 11:24:58 -0300
Message-ID: <CAK9RveKOvQTP2E-sFTpu7Kq-2rSy3xFPfCUJaF-OzJ0ce5tULw@mail.gmail.com>
Subject: fdlopen()
To: landlock@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Is there any glibc/musl developer on the list? If so, could you
consider taking the case for fdlopen() once more in the development
lists? Asking here because Linux libc developers tend to be hostile
towards fdlopen() beggars.

For my Landlock/seccomp sandboxes (w/o any write permissions to the
filesystem... not even /tmp) I'd like to run a few in-memory plugins
using fdlopen().

fdlopen() was added to FreeBSD, 13 years ago, and it can be used with
memfd/capsicum.

A patch to add fdlopen() to musl was sent last year:
https://www.openwall.com/lists/musl/2023/05/08/4

Android's bioniC has fdlopen in the form of
android_dlopen_ext()/ANDROID_DLEXT_USE_LIBRARY_FD.

I can't use Linux namespaces here to mount a writable private /tmp
that is shared with no other user as I'd need unprivileged user
namespaces support. Landlock can't help me here (nor should).
fdlopen() would be ideal.

It'd also help me to further unify the interfaces of my software
between Linux and FreeBSD as I'd be able to just use fdlopen() on both
systems.


--=20
Vin=C3=ADcius dos Santos Oliveira
https://vinipsmaker.github.io/
